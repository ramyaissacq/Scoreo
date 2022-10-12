//
//  LeagueData01.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 14, 2022
//
import Foundation
import SwiftyJSON

struct LeagueData01 {

	let leagueId: Int?
	let color: String?
	let nameEn: String?
	let nameEnShort: String?
	let nameChs: String?
	let nameChsShort: String?
	let nameCht: String?
	let nameChtShort: String?
	let type: String?
	let subSclassEn: String?
	let subSclassCn: String?
	let sumRound: String?
	let currRound: String?
	let currSeason: String?
	let countryId: String?
	let countryEn: String?
	let countryCn: String?
	let leagueLogo: String?
	let countryLogo: String?
	let areaId: String?
	let nameId: String?
	let nameIdShort: String?
	let subSclassId: String?
	let countryNameEn: String?
	let countryNameCn: String?
	let countryNameId: String?
	let nameVi: String?
	let nameViShort: String?
	let subSclassVi: String?
	let countryNameVi: String?
	let nameTh: String?
	let nameThShort: String?
	let subSclassTh: String?
	let countryNameTh: String?
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
		type = json["type"].stringValue
		subSclassEn = json["subSclassEn"].stringValue
		subSclassCn = json["subSclassCn"].stringValue
		sumRound = json["sumRound"].stringValue
		currRound = json["currRound"].stringValue
		currSeason = json["currSeason"].stringValue
		countryId = json["countryId"].stringValue
		countryEn = json["countryEn"].stringValue
		countryCn = json["countryCn"].stringValue
		leagueLogo = json["leagueLogo"].stringValue
		countryLogo = json["countryLogo"].stringValue
		areaId = json["areaId"].stringValue
		nameId = json["nameId"].stringValue
		nameIdShort = json["nameIdShort"].stringValue
		subSclassId = json["subSclassId"].stringValue
		countryNameEn = json["countryNameEn"].stringValue
		countryNameCn = json["countryNameCn"].stringValue
		countryNameId = json["countryNameId"].stringValue
		nameVi = json["nameVi"].stringValue
		nameViShort = json["nameViShort"].stringValue
		subSclassVi = json["subSclassVi"].stringValue
		countryNameVi = json["countryNameVi"].stringValue
		nameTh = json["nameTh"].stringValue
		nameThShort = json["nameThShort"].stringValue
		subSclassTh = json["subSclassTh"].stringValue
		countryNameTh = json["countryNameTh"].stringValue
		nameCn = json["nameCn"].stringValue
		nameCnShort = json["nameCnShort"].stringValue
	}

}