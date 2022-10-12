//
//  Score.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 15, 2022
//
import Foundation
import SwiftyJSON

struct Score {

	let groupNameEn: String?
	let groupNameChs: String?
	let groupNameCht: String?
	let groupScore: [GroupScore]?

	init(_ json: JSON) {
		groupNameEn = json["groupNameEn"].stringValue
		groupNameChs = json["groupNameChs"].stringValue
		groupNameCht = json["groupNameCht"].stringValue
		groupScore = json["groupScore"].arrayValue.map { GroupScore($0) }
	}

}