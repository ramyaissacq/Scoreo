//
//  ScoresResponse.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 07, 2022
//
import Foundation
import SwiftyJSON

struct ScoresResponse {

	let matchList: [MatchList]?
	let meta: Meta?
    let todayHotLeague: [TodayHotLeague]?
    let todayHotLeagueList: [MatchList]?

	init(_ json: JSON) {
		matchList = json["matchList"].arrayValue.map { MatchList($0) }
		meta = Meta(json["meta"])
        todayHotLeague = json["todayHotLeague"].arrayValue.map { TodayHotLeague($0) }
        todayHotLeagueList = json["todayHotLeagueList"].arrayValue.map { MatchList($0) }
	}

}
