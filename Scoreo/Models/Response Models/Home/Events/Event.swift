//
//  Event.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 13, 2022
//
import Foundation
import SwiftyJSON

struct Event {

	let id: Int?
	let isHome: Bool?
	let kind: Int?
	let time: String?
	let nameEn: String?
	let nameChs: String?
	let nameCht: String?
	let playerId: String?
	let playerId2: String?
	let overtime: String?
	let nameCn: String?
	let nameId: String?
	let nameVi: String?

	init(_ json: JSON) {
		id = json["id"].intValue
		isHome = json["isHome"].boolValue
		kind = json["kind"].intValue
		time = json["time"].stringValue
		nameEn = json["nameEn"].stringValue
		nameChs = json["nameChs"].stringValue
		nameCht = json["nameCht"].stringValue
		playerId = json["playerId"].stringValue
		playerId2 = json["playerId2"].stringValue
		overtime = json["overtime"].stringValue
		nameCn = json["nameCn"].stringValue
		nameId = json["nameId"].stringValue
		nameVi = json["nameVi"].stringValue
	}

}