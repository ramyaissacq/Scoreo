//
//  LeagueStandingList.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 15, 2022
//
import Foundation
import SwiftyJSON

struct LeagueStandingList {

	let leagueId: Int?
	let season: String?
	let score: [Score]?

	init(_ json: JSON) {
		leagueId = json["leagueId"].intValue
		season = json["season"].stringValue
		score = json["score"].arrayValue.map { Score($0) }
	}

}
