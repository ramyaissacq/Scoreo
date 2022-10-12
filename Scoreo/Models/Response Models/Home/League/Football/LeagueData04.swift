//
//  LeagueData04.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 14, 2022
//
import Foundation
import SwiftyJSON

struct LeagueData04 {

	let ruleCn: String?
	let ruleEn: String?
	let ruleId: String?
	let ruleVi: String?
	let ruleTh: String?
	let leagueId: Int?

	init(_ json: JSON) {
		ruleCn = json["ruleCn"].stringValue
		ruleEn = json["ruleEn"].stringValue
		ruleId = json["ruleId"].stringValue
		ruleVi = json["ruleVi"].stringValue
		ruleTh = json["ruleTh"].stringValue
		leagueId = json["leagueId"].intValue
	}

}