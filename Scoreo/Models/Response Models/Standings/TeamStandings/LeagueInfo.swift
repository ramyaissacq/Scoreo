//
//  LeagueInfo.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 09, 2022
//
import Foundation
import SwiftyJSON

struct LeagueInfo {

	let countRound: Int?
	let currRound: Int?
	let leagueId: Int?
	let nameEn: String?
	let nameChs: String?
	let nameCht: String?
	let season: String?
	let color: String?
	let logo: String?
	let nameEnShort: String?
	let nameChsShort: String?
	let nameChtShort: String?

	init(_ json: JSON) {
		countRound = json["countRound"].intValue
		currRound = json["currRound"].intValue
		leagueId = json["leagueId"].intValue
		nameEn = json["nameEn"].stringValue
		nameChs = json["nameChs"].stringValue
		nameCht = json["nameCht"].stringValue
		season = json["season"].stringValue
		color = json["color"].stringValue
		logo = json["logo"].stringValue
		nameEnShort = json["nameEnShort"].stringValue
		nameChsShort = json["nameChsShort"].stringValue
		nameChtShort = json["nameChtShort"].stringValue
	}

}