//
//  AppGroup.swift
//  AppStoreClone
//
//  Created by djepbarov on 2.06.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id, name, artistName, artworkUrl100: String
}
