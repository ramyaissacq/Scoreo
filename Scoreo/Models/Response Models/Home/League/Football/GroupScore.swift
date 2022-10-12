//
//  GroupScore.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 15, 2022
//
import Foundation
import SwiftyJSON

struct GroupScore {

	let groupEn: String?
	let groupCn: String?
	let scoreItems: [ScoreItems]?

	init(_ json: JSON) {
		groupEn = json["groupEn"].stringValue
		groupCn = json["groupCn"].stringValue
		scoreItems = json["scoreItems"].arrayValue.map { ScoreItems($0) }
	}

}