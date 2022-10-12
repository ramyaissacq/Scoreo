//
//  TotalStandings.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 09, 2022
//
import Foundation
import SwiftyJSON

struct TotalStandings {

	let rank: Int?
	let teamId: Int?
	let winRate: String?
	let drawRate: String?
	let loseRate: String?
	let winAverage: Double?
	let loseAverage: Double?
	let deduction: Int?
	let deductionExplainCn: String?
	let recentFirstResult: String?
	let recentSecondResult: String?
	let recentThirdResult: String?
	let recentFourthResult: String?
	let recentFifthResult: String?
	let recentSixthResult: String?
	let deductionExplainEn: String?
	let color: Int?
	let redCard: Int?
	let totalCount: Int?
	let winCount: Int?
	let drawCount: Int?
	let loseCount: Int?
	let getScore: Int?
	let loseScore: Int?
	let goalDifference: Int?
	let integral: Int?
	let totalAddScore: Int?

	init(_ json: JSON) {
		rank = json["rank"].intValue
		teamId = json["teamId"].intValue
		winRate = json["winRate"].stringValue
		drawRate = json["drawRate"].stringValue
		loseRate = json["loseRate"].stringValue
		winAverage = json["winAverage"].doubleValue
		loseAverage = json["loseAverage"].doubleValue
		deduction = json["deduction"].intValue
		deductionExplainCn = json["deductionExplainCn"].stringValue
		recentFirstResult = json["recentFirstResult"].stringValue
		recentSecondResult = json["recentSecondResult"].stringValue
		recentThirdResult = json["recentThirdResult"].stringValue
		recentFourthResult = json["recentFourthResult"].stringValue
		recentFifthResult = json["recentFifthResult"].stringValue
		recentSixthResult = json["recentSixthResult"].stringValue
		deductionExplainEn = json["deductionExplainEn"].stringValue
		color = json["color"].intValue
		redCard = json["redCard"].intValue
		totalCount = json["totalCount"].intValue
		winCount = json["winCount"].intValue
		drawCount = json["drawCount"].intValue
		loseCount = json["loseCount"].intValue
		getScore = json["getScore"].intValue
		loseScore = json["loseScore"].intValue
		goalDifference = json["goalDifference"].intValue
		integral = json["integral"].intValue
		totalAddScore = json["totalAddScore"].intValue
	}

}