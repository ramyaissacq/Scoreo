//
//  BreiefingResponse.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 14, 2022
//
import Foundation
import SwiftyJSON

struct BreiefingResponse {

	let matchId: Int?
	let recommendCn: String?
	let recommendEn: String?
	let recommendId: String?
	let recommendVi: String?
	let recommendTh: String?

	init(_ json: JSON) {
		matchId = json["matchId"].intValue
		recommendCn = json["recommendCn"].stringValue
		recommendEn = json["recommendEn"].stringValue
		recommendId = json["recommendId"].stringValue
		recommendVi = json["recommendVi"].stringValue
		recommendTh = json["recommendTh"].stringValue
	}

}
