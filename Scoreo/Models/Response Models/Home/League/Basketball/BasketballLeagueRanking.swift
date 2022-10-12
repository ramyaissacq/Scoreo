//
//  BasketballLeagueRanking.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 24, 2022
//
import Foundation
import SwiftyJSON

struct BasketballLeagueRanking {

	let list: [BasketballRankData]?
	let season: String?

	init(_ json: JSON) {
		list = json["list"].arrayValue.map { BasketballRankData($0) }
		season = json["season"].stringValue
	}

}
