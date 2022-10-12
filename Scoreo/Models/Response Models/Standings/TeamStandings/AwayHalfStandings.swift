//
//  AwayHalfStandings.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 09, 2022
//
import Foundation
import SwiftyJSON

struct AwayHalfStandings {

	let rank: Int?
	let teamId: Int?
	let winRate: String?
	let drawRate: String?
	let loseRate: String?
	let winAverage: Int?
	let loseAverage: Int?
	let totalCount: Int?
	let winCount: Int?
	let drawCount: Int?
	let loseCount: Int?
	let getScore: Int?
	let loseScore: Int?
	let goalDifference: Int?
	let integral: Int?

	init(_ json: JSON) {
		rank = json["rank"].intValue
		teamId = json["teamId"].intValue
		winRate = json["winRate"].stringValue
		drawRate = json["drawRate"].stringValue
		loseRate = json["loseRate"].stringValue
		winAverage = json["winAverage"].intValue
		loseAverage = json["loseAverage"].intValue
		totalCount = json["totalCount"].intValue
		winCount = json["winCount"].intValue
		drawCount = json["drawCount"].intValue
		loseCount = json["loseCount"].intValue
		getScore = json["getScore"].intValue
		loseScore = json["loseScore"].intValue
		goalDifference = json["goalDifference"].intValue
		integral = json["integral"].intValue
	}

}