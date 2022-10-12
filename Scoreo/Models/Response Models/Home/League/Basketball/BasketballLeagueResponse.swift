//
//  BasketballLeagueResponse.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 24, 2022
//
import Foundation
import SwiftyJSON

struct BasketballLeagueResponse {

	let leagueData: [BasketballLeagueData]?
	let leagueRanking: BasketballLeagueRanking?

	init(_ json: JSON) {
		leagueData = json["leagueData"].arrayValue.map { BasketballLeagueData($0) }
		leagueRanking = BasketballLeagueRanking(json["leagueRanking"])
	}

}
