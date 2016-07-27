//
//  Movie.swift
//  AannaFilms
//
//  Created by Pradheep Rajendirane on 23/06/2016.
//  Copyright © 2016 DI2PRA. All rights reserved.
//

import Foundation
import Firebase

struct Movie {
    let key:String!
    var title:String!
    var description: String?
    var directedBy: String?
    var actors : String?
    var musicDirector: String?
    var trailerLink: String?
    var releaseDate: NSDate?
    var cover:String?
    var visible:Bool
    
    /*init(title: String, description: String? = nil, directedBy: String? = nil, actors: String? = nil, musicDirector: String? = nil, releaseDate: NSDate? = nil, cover:String? = nil, trailerLink:String? = nil) {
        
        self.key = ""
        self.title = title
        self.actors = actors
        self.directedBy = directedBy
        self.musicDirector = musicDirector
        self.description = description
        self.releaseDate = releaseDate
        self.cover = cover
        self.trailerLink = trailerLink
        
    }*/
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        title = snapshot.value!["title"] as! String
        description = snapshot.value!["description"] as? String
        directedBy = snapshot.value!["directedBy"] as? String
        actors = snapshot.value!["actors"] as? String
        musicDirector = snapshot.value!["musicDirector"] as? String
        trailerLink = snapshot.value!["trailerLink"] as? String
        cover = snapshot.value!["cover"] as? String
        visible = snapshot.value!["visible"] as! Bool
        
        if let date = snapshot.value!["releaseDate"] as? String {
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            if let dateFrom = dateFormatter.dateFromString(date) {
                releaseDate = dateFrom
            }
            
        }
    }
    
    func toAnyObject() -> AnyObject {
        
        var data: [String:AnyObject] = [
            "title" : title
        ]
        
        if let _ = description {
            data["description"] = description!
        }
        
        if let _ = directedBy {
            data["directedBy"] = directedBy!
        }
        
        if let _ = actors {
            data["actors"] = actors!
        }
        
        if let _ = musicDirector {
            data["musicDirector"] = musicDirector!
        }
        
        if let _ = trailerLink {
            data["trailerLink"] = trailerLink!
        }
        
        if let _ = releaseDate {
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            data["releaseDate"] = dateFormatter.stringFromDate(releaseDate!)
        }
        
        if let _ = cover {
            data["cover"] = cover!
        }       
        
        
        return data
        
    }
}

struct Cinema {
    var cinema : String
    var ville : String
    var seances : [Seance]
}

struct Seance {
    var date : NSDate
    var heure : [String]?
    var details : String?
    
}