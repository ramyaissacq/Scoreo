//
//  PlayerStandings.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 10, 2022
//
import Foundation
import SwiftyJSON

struct PlayerStandings {

	let playerId: Int?
	let playerNameEn: String?
	let playerNameChs: String?
	let playerNameCht: String?
	let countryEn: String?
	let countryCn: String?
	let teamID: Int?
	let teamNameEn: String?
	let teamNameChs: String?
	let teamNameCht: String?
	let goals: Int?
	let homeGoals: Int?
	let awayGoals: Int?
	let homePenalty: Int?
	let awayPenalty: Int?
	let matchNum: Int?
	let subNum: Int?

	init(_ json: JSON) {
		playerId = json["playerId"].intValue
		playerNameEn = json["playerNameEn"].stringValue
		playerNameChs = json["playerNameChs"].stringValue
		playerNameCht = json["playerNameCht"].stringValue
		countryEn = json["countryEn"].stringValue
		countryCn = json["countryCn"].stringValue
		teamID = json["teamID"].intValue
		teamNameEn = json["teamNameEn"].stringValue
		teamNameChs = json["teamNameChs"].stringValue
		teamNameCht = json["teamNameCht"].stringValue
		goals = json["goals"].intValue
		homeGoals = json["homeGoals"].intValue
		awayGoals = json["awayGoals"].intValue
		homePenalty = json["homePenalty"].intValue
		awayPenalty = json["awayPenalty"].intValue
		matchNum = json["matchNum"].intValue
		subNum = json["subNum"].intValue
	}

}
