//
//  BasketballLeagueData.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 24, 2022
//
import Foundation
import SwiftyJSON

struct BasketballLeagueData {

	let leagueId: Int?
	let color: String?
	let nameEn: String?
	let nameEnShort: String?
	let nameChs: String?
	let nameChsShort: String?
	let nameCht: String?
	let nameChtShort: String?
	let leagueType: String?
	let currentSeason: String?
	let countryId: String?
	let countryEn: String?
	let countryCn: String?
	let leagueKind: String?
	let logo: String?
	let partTime: String?
	let ruleCn: String?
	let nameId: String?
	let nameIdShort: String?
	let countryNameEn: String?
	let countryNameCn: String?
	let countryNameId: String?
	let ruleEn: String?
	let ruleId: String?
	let nameVi: String?
	let nameViShort: String?
	let countryNameVi: String?
	let ruleVi: String?
	let nameCn: String?
	let nameCnShort: String?

	init(_ json: JSON) {
		leagueId = json["leagueId"].intValue
		color = json["color"].stringValue
		nameEn = json["nameEn"].stringValue
		nameEnShort = json["nameEnShort"].stringValue
		nameChs = json["nameChs"].stringValue
		nameChsShort = json["nameChsShort"].stringValue
		nameCht = json["nameCht"].stringValue
		nameChtShort = json["nameChtShort"].stringValue
		leagueType = json["leagueType"].stringValue
		currentSeason = json["currentSeason"].stringValue
		countryId = json["countryId"].stringValue
		countryEn = json["countryEn"].stringValue
		countryCn = json["countryCn"].stringValue
		leagueKind = json["leagueKind"].stringValue
		logo = json["logo"].stringValue
		partTime = json["partTime"].stringValue
		ruleCn = json["ruleCn"].stringValue
		nameId = json["nameId"].stringValue
		nameIdShort = json["nameIdShort"].stringValue
		countryNameEn = json["countryNameEn"].stringValue
		countryNameCn = json["countryNameCn"].stringValue
		countryNameId = json["countryNameId"].stringValue
		ruleEn = json["ruleEn"].stringValue
		ruleId = json["ruleId"].stringValue
		nameVi = json["nameVi"].stringValue
		nameViShort = json["nameViShort"].stringValue
		countryNameVi = json["countryNameVi"].stringValue
		ruleVi = json["ruleVi"].stringValue
		nameCn = json["nameCn"].stringValue
		nameCnShort = json["nameCnShort"].stringValue
	}

}
