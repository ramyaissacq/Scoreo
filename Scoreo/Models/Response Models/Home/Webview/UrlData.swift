//
//  Data.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on October 11, 2022
//
import Foundation
import SwiftyJSON

struct UrlData {

	let code: String?
	let ip: String?
	let isBanned: Int?

	init(_ json: JSON) {
		code = json["code"].stringValue
		ip = json["ip"].stringValue
		isBanned = json["is_banned"].intValue
	}

}
