//
//  BasketballRankData.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 24, 2022
//
import Foundation
import SwiftyJSON

struct BasketballRankData {

	let roundEn: String?
	let roundChs: String?
	let roundCht: String?
	let group: String?
	let rank: Int?
	let teamId: Int?
	let winCount: Int?
	let loseCount: Int?
	let totalScore: Int?
	let totalLoss: Int?
	let streak: Int?
	let isPromoted: Bool?

	init(_ json: JSON) {
		roundEn = json["roundEn"].stringValue
		roundChs = json["roundChs"].stringValue
		roundCht = json["roundCht"].stringValue
		group = json["group"].stringValue
		rank = json["rank"].intValue
		teamId = json["teamId"].intValue
		winCount = json["winCount"].intValue
		loseCount = json["loseCount"].intValue
		totalScore = json["totalScore"].intValue
		totalLoss = json["totalLoss"].intValue
		streak = json["streak"].intValue
		isPromoted = json["isPromoted"].boolValue
	}

}
