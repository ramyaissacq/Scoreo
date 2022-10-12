//
//  ScoreItems.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 15, 2022
//
import Foundation
import SwiftyJSON

struct ScoreItems {

	let rank: String?
	let teamId: String?
	let color: String?
	let teamNameEn: String?
	let teamNameChs: String?
	let teamNameCht: String?
	let totalCount: String?
	let winCount: String?
	let drawCount: String?
	let loseCount: String?
	let getScore: String?
	let loseScore: String?
	let goalDifference: String?
	let integral: String?

	init(_ json: JSON) {
		rank = json["rank"].stringValue
		teamId = json["teamId"].stringValue
		color = json["color"].stringValue
		teamNameEn = json["teamNameEn"].stringValue
		teamNameChs = json["teamNameChs"].stringValue
		teamNameCht = json["teamNameCht"].stringValue
		totalCount = json["totalCount"].stringValue
		winCount = json["winCount"].stringValue
		drawCount = json["drawCount"].stringValue
		loseCount = json["loseCount"].stringValue
		getScore = json["getScore"].stringValue
		loseScore = json["loseScore"].stringValue
		goalDifference = json["goalDifference"].stringValue
		integral = json["integral"].stringValue
	}

}