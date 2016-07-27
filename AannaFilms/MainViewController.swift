//
//  ViewController.swift
//  AannaFilms
//
//  Created by Pradheep Rajendirane on 15/04/2016.
//  Copyright © 2016 DI2PRA. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    var ref:FIRDatabaseReference?
    var storageRef:FIRStorageReference?
    var circularTransitionHandler: BIZCircularTransitionHandler = BIZCircularTransitionHandler()
    var movies:[Movie] = []
    var coverPath:[String:String] = [String:String]()
    let activityIndicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)

        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0)
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        activityIndicator.center = view.center
        
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        
        super.viewDidLoad()
        
        
        
        // Initialise reference
        self.ref = FIRDatabase.database().reference()
        self.storageRef = FIRStorage.storage().reference()
        
        
        ref!.child("movie").queryOrderedByChild("order").observeEventType(FIRDataEventType.Value, withBlock: { snapshot in
            
            self.movies = []
            
            for item in snapshot.children {
                let movie = Movie(snapshot: item as! FIRDataSnapshot)
                
                if movie.visible {
                    self.movies.append(movie)
                }
                
            }
            
            self.movieCollectionView.reloadData()
            self.activityIndicator.stopAnimating()
            
            }, withCancelBlock: { error in
            print(error.description)
        })
        
        
        
        /*for movie in Movies {
            let newMovie = ref!.child("movie").childByAutoId()
            newMovie.setValue(movie.toAnyObject())

        }*/
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        movieCollectionView.backgroundColor = UIColor.clearColor()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showMovieSegue", sender: self)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("movieCell", forIndexPath: indexPath) as! MovieCell
        
        
        cell.title.text = movies[indexPath.row].title.uppercaseString
        
        // handle cover loading
        cell.image.image = nil
        
        if let coverString = movies[indexPath.row].cover {
            
            if coverString != "" {
                
                cell.coverLoadingIndicator.startAnimating()
                
                if let path = coverPath[self.movies[indexPath.row].key] {
                    if(path != "") {
                        cell.coverLoadingIndicator.stopAnimating()
                        cell.image.image = UIImage(contentsOfFile: path)
                    }
                    
                } else {
                    
                    
                    
                    self.coverPath[self.movies[indexPath.row].key] = ""
                    
                    storageRef!.child(coverString).dataWithMaxSize(1 * 1024 * 1024) { (data, error) -> Void in
                        if (error != nil) {
                            print(error)
                        } else {
                            
                            
                            
                            let path = NSTemporaryDirectory() + self.movies[indexPath.row].cover!
                            data!.writeToFile(path, atomically: true)
                            
                            self.coverPath[self.movies[indexPath.row].key] = path
                            
                            if let updateCell = self.movieCollectionView.cellForItemAtIndexPath(indexPath) as? MovieCell {
                                updateCell.coverLoadingIndicator.stopAnimating()
                                updateCell.image.image = UIImage(data: data!)
                            }
                        }
                    }
                }
            } else {
                cell.coverLoadingIndicator.removeFromSuperview()
            }
        } else {
            cell.coverLoadingIndicator.removeFromSuperview()
        }
        
        
        
        //cell.image.image = UIImage(named: movies[indexPath.row].cover!)
        
        /*let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "EEEE dd MMMM yyyy"
        let date = dateFormatter.stringFromDate(Movies[indexPath.row].releaseDate)
        
        cell.sortieLabel.text = "sortie le " + date
        cell.realisateurLabel.text = "réalisé par " + Movies[indexPath.row].directedBy
        cell.actorLabel.text = "avec " + Movies[indexPath.row].actors
        cell.musicLabel.text = "bande son par " + Movies[indexPath.row].musicDirector*/
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as! MovieViewController
        let centerOfButton: CGPoint = CGPoint(x: (sender?.view.frame.size.width)!/2, y: (sender?.view.frame.size.height)!/2)
        
        vc.movie = movies[movieCollectionView.indexPathsForSelectedItems()![0].row]
        vc.coverPath = coverPath[movies[movieCollectionView.indexPathsForSelectedItems()![0].row].key]
            
        self.circularTransitionHandler.transitionWithDestinationViewController(vc, initialTransitionPoint: centerOfButton)
        
    }


}

