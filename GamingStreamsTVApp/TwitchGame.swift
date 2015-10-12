//
//  TwitchGame.swift
//  TestTVApp
//
//  Created by Olivier Boucher on 2015-09-13.

import Foundation

struct TwitchGame: CellItem {
    
    private(set) var id : Int
    private(set) var viewers = 0
    private(set) var channels = 0
    private(set) var name : String
    private(set) var thumbnails : [String : String]
    private(set) var logos : [String : String]
    
    init(id : Int, viewers : Int, channels : Int, name : String, thumbnails : [String : String], logos : [String : String]) {
        self.id = id
        self.viewers = viewers
        self.channels = channels
        self.name = name
        self.thumbnails = thumbnails
        self.logos = logos
    }
    
    init?(dict: [String : AnyObject]) {
        if let gameDict = dict["game"] as? [String : AnyObject] {
            guard let id = gameDict["_id"] as? Int else {
                return nil
            }
            guard let name = gameDict["name"] as? String else {
                return nil
            }
            guard let thumbs = gameDict["box"] as? [String : String] else {
                return nil
            }
            guard let logos = gameDict["logo"] as? [String : String] else {
                return nil
            }
            self.id = id
            self.name = name
            self.thumbnails = thumbs
            self.logos = logos
            
            if let viewers = dict["viewers"] as? Int {
                self.viewers = viewers
            }
            if let channels = dict["channels"] as? Int {
                self.channels = channels
            }
        } else {
            guard let id = dict["_id"] as? Int else {
                return nil
            }
            guard let name = dict["name"] as? String else {
                return nil
            }
            guard let thumbs = dict["box"] as? [String : String] else {
                return nil
            }
            guard let logos = dict["logo"] as? [String : String] else {
                return nil
            }
            self.id = id
            self.name = name
            self.thumbnails = thumbs
            self.logos = logos
            
            if let viewers = dict["viewers"] as? Int {
                self.viewers = viewers
            }
            if let channels = dict["channels"] as? Int {
                self.channels = channels
            }
        }
    }
    
    var urlTemplate: String? {
        get {
            return thumbnails["template"]
        }
    }
    
    var title: String {
        get {
            return name
        }
    }
    
    var subtitle: String {
        get {
            if viewers > 0 {
                return "\(viewers) viewers"
            } else {
                return ""
            }
        }
    }
}