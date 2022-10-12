//
//  TeamInfo.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 09, 2022
//
import Foundation
import SwiftyJSON

struct TeamInfo {

	let flag: String?
	let conferenceFlg: Int?
	let teamId: Int?
	let nameEn: String?
	let nameChs: String?
	let nameCht: String?

	init(_ json: JSON) {
		flag = json["flag"].stringValue
		conferenceFlg = json["conferenceFlg"].intValue
		teamId = json["teamId"].intValue
		nameEn = json["nameEn"].stringValue
		nameChs = json["nameChs"].stringValue
		nameCht = json["nameCht"].stringValue
	}

}