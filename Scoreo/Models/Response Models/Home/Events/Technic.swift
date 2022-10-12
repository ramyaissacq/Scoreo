//
//  Technic.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 13, 2022
//
import Foundation
import SwiftyJSON

struct Technic {

	let matchId: Int?
	let technicCount: String?

	init(_ json: JSON) {
		matchId = json["matchId"].intValue
		technicCount = json["technicCount"].stringValue
	}

}