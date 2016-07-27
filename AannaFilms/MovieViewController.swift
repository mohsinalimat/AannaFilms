//
//  MovieViewController.swift
//  AannaFilms
//
//  Created by Pradheep Rajendirane on 09/05/2016.
//  Copyright © 2016 DI2PRA. All rights reserved.
//

import UIKit
import Firebase

class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var movie:Movie?
    var coverPath:String?
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func close(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 40
        tableView.sectionHeaderHeight = 32
        tableView.sectionFooterHeight = 10
        
        tableView.registerNib(UINib(nibName: "MovieSectionHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "MovieSectionHeader")
        
        //mvc = parentViewController as? MainViewController
        
        /*scrollView.delegate = self
         
         movieCover.image = UIImage(named: image[movieId])
         movieTitle.text = data[movieId].uppercaseString*/
        
        //self.view.addConstraint(NSLayoutConstraint(item: movieCover, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: self.view.frame.size.height/2))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section == 0) {
            return 1
        } else if(section == 1) {
            return 1
        } else if(section==2) {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section == 0) {
            return 0
        } else {
            return 32
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if(section == 0) {
            
            return nil
        
        } else {

            
            let header = tableView.dequeueReusableHeaderFooterViewWithIdentifier("MovieSectionHeader") as? MovieSectionHeader
            
            if(section == 1) {
                header?.title.text = "Description".uppercaseString
            } else if(section == 2) {
                header?.title.text = "Bande Annonce".uppercaseString
            } else if(section == 3) {
                header?.title.text = "Séances".uppercaseString
            }
            
            return header
        }
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UITableViewHeaderFooterView()
        
        footer.contentView.backgroundColor = UIColor.whiteColor()
        
        return footer
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0) {
            
            if(indexPath.row == 0) {
                let cell = tableView.dequeueReusableCellWithIdentifier("TitleCell", forIndexPath: indexPath) as! TitleCell
                
                cell.title.text = movie!.title.uppercaseString
                cell.director.text = movie!.directedBy
                cell.actors.text = movie!.actors
                cell.musicDirector.text = movie!.musicDirector
                
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "EEEE dd MMMM yyyy"
                cell.sortie.text = dateFormatter.stringFromDate(movie!.releaseDate!)
                
                //cell.coverImage.image = UIImage(named: movie!.cover!)
                
                cell.coverImage.image = UIImage(contentsOfFile: coverPath!)
                
                return cell
            } else {
                
                let cell = UITableViewCell()
                return cell
            }
            
        } else if(indexPath.section == 1) {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("DescriptionCell", forIndexPath: indexPath) as! DescriptionCell
            
            cell.descriptionLabel.text = movie!.description
            
            return cell
        
        } else if(indexPath.section == 2) {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("TrailerCell", forIndexPath: indexPath) as! TrailerCell
            
            if let url = movie?.trailerLink {
                let myURL : NSURL = NSURL(string: "https://www.youtube.com/embed/" + url)!
                //Note: use the "embed" address instead of the "watch" address.
                let myURLRequest : NSURLRequest = NSURLRequest(URL: myURL)
                cell.trailerView.loadRequest(myURLRequest)
            }
               
            
            
            return cell
            
        } else {
            
            if(indexPath.row == 0) {
                let cell = tableView.dequeueReusableCellWithIdentifier("TheaterCell") as! TheaterCell
                
                cell.titleLabel.text = "Gaumont Pathé • Saint-Denis"
                
                return cell
            } else {
                let cell = tableView.dequeueReusableCellWithIdentifier("ShowCell") as! ShowCell
                
                let hours = ["10:00", "13:00","14:00", "15:00", "16:00", "19:00", "20:00"]
                
                var x: CGFloat=0;
                
                for hour in hours {
                    let label = UILabel(frame: CGRectMake(x, 0, 50, 24))
                    label.textAlignment = NSTextAlignment.Center
                    label.backgroundColor = UIColor.whiteColor()
                    
                    let maskPath = UIBezierPath(roundedRect: label.bounds, cornerRadius: 5)
                    let maskLayer = CAShapeLayer(layer: maskPath)
                    maskLayer.frame = label.bounds
                    maskLayer.path = maskPath.CGPath
                    label.layer.mask = maskLayer
                    
                    label.font = UIFont(name: "Roboto-Thin", size: 15)
                    label.text = hour
                    label.textColor = UIColor(colorLiteralRed: 214/255, green: 69/255, blue: 65/255, alpha: 1)
                    cell.hourContentView.addSubview(label)
                    x+=58
                }
                
                cell.hourContentViewWith.constant = x-8
                
                
                return cell
            }
            
            
        }
        
        /*if(indexPath.row == 0) {
            let cell = tableView.dequeueReusableCellWithIdentifier("TitleCell", forIndexPath: indexPath) as! TitleCell
            
            cell.title.text = movie!.title.uppercaseString
            cell.director.text = movie!.directedBy
            cell.actors.text = movie!.actors
            cell.musicDirector.text = movie!.musicDirector
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "EEEE dd MMMM yyyy"
            cell.sortie.text = dateFormatter.stringFromDate(Movies[indexPath.row].releaseDate)
            
            cell.coverImage.image = UIImage(named: movie!.cover!)
            
            return cell
        } else if(indexPath.row == 1) {
            let cell = tableView.dequeueReusableCellWithIdentifier("DescriptionCell", forIndexPath: indexPath) as! DescriptionCell
            
            cell.descriptionLabel.text = movie!.description
            
            return cell
        } else {
            
            
        }*/
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        /*let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)) as! CoverCell
        
        cell.aspecRatioConstraint.constant = min(0, -scrollView.contentOffset.y / 2.0)*/
    }
    
    
    // MARK: - ScrollView
    /*func scrollViewDidScroll(scrollView: UIScrollView) {
        if(scrollView.contentOffset.y > (self.movieCover.frame.height-50)) {
            closeButton.setImage(UIImage(named: "close-black"), forState: UIControlState.Normal)
        } else {
            closeButton.setImage(UIImage(named: "close-white"), forState: UIControlState.Normal)
        }
    }*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
