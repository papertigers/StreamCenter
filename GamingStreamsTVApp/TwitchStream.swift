//
//  TwitchStream.swift
//  TestTVApp
//
//  Created by Olivier Boucher on 2015-09-13.

import Foundation

struct TwitchStream: CellItem {
    private(set) var id : Int
    private(set) var gameName : String
    private(set) var viewers = 0
    private(set) var videoHeight = 0
    private(set) var preview : [String : String]
    private(set) var channel : TwitchChannel
    
    init(id : Int, gameName : String, viewers : Int, videoHeight : Int, preview : [String : String], channel : TwitchChannel) {
        self.id = id
        self.gameName = gameName
        self.viewers = viewers
        self.videoHeight = videoHeight
        self.preview = preview
        self.channel = channel
    }
    
    init?(dict: [String : AnyObject], channel: TwitchChannel) {
        guard let id = dict["_id"] as? Int else {
            return nil
        }
        guard let gameName = dict["game"] as? String else {
            return nil
        }
        guard let preview = dict["preview"] as? [String : String] else {
            return nil
        }
        self.id = id
        self.gameName = gameName
        self.preview = preview
        
        if let viewers = dict["viewers"] as? Int {
            self.viewers = viewers
        }
        
        if let videoHeight = dict["video_height"] as? Int {
            self.videoHeight = videoHeight
        }
        
        self.channel = channel
    }
    
    var urlTemplate: String? {
        get {
            return preview["template"]
        }
    }
    
    var title: String {
        get {
            return channel.status
        }
    }
    
    var subtitle: String {
        get {
            return "\(viewers) viewers on \(channel.name)"
        }
    }
}
