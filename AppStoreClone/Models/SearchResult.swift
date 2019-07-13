//
//  SearchResult.swift
//  AppStoreClone
//
//  Created by djepbarov on 16.04.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [AppsStoreResult]
}

struct AppsStoreResult: Decodable {
    let id: String = ""
    let artworkUrl100: String // icon
    let trackName: String // name of the app
    let primaryGenreName: String // category
    let screenshotUrls: [String]
    let averageUserRating: Float?
}
