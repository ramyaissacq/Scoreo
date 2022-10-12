//
//  LeagueColorInfos.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 09, 2022
//
import Foundation
import SwiftyJSON

struct LeagueColorInfos {

	let color: String?
	let leagueNameEn: String?
	let leagueNameChs: String?
	let leagueNameCht: String?
	let beginRank: Int?
	let endRank: Int?

	init(_ json: JSON) {
		color = json["color"].stringValue
		leagueNameEn = json["leagueNameEn"].stringValue
		leagueNameChs = json["leagueNameChs"].stringValue
		leagueNameCht = json["leagueNameCht"].stringValue
		beginRank = json["beginRank"].intValue
		endRank = json["endRank"].intValue
	}

}