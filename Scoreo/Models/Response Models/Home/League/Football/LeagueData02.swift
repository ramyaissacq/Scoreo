//
//  LeagueData02.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 14, 2022
//
import Foundation
import SwiftyJSON

struct LeagueData02 {

	let leagueId: Int?
	let subId: Int?
	let subNameEn: String?
	let subNameChs: String?
	let subNameCht: String?
	let num: String?
	let totalRound: String?
	let currentRound: String?
	let hasScore: Bool?
	let includeSeason: String?
	let isCurrentSub: Bool?
	let currentSeason: String?
	let isTwoRounds: Bool?
	let subNameId: String?
	let subNameVi: String?
	let subNameTh: String?

	init(_ json: JSON) {
		leagueId = json["leagueId"].intValue
		subId = json["subId"].intValue
		subNameEn = json["subNameEn"].stringValue
		subNameChs = json["subNameChs"].stringValue
		subNameCht = json["subNameCht"].stringValue
		num = json["num"].stringValue
		totalRound = json["totalRound"].stringValue
		currentRound = json["currentRound"].stringValue
		hasScore = json["hasScore"].boolValue
		includeSeason = json["includeSeason"].stringValue
		isCurrentSub = json["isCurrentSub"].boolValue
		currentSeason = json["currentSeason"].stringValue
		isTwoRounds = json["isTwoRounds"].boolValue
		subNameId = json["subNameId"].stringValue
		subNameVi = json["subNameVi"].stringValue
		subNameTh = json["subNameTh"].stringValue
	}

}