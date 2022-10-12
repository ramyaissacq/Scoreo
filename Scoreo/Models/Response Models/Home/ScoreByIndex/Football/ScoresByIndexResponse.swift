//
//  ScoresByIndexResponse.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 08, 2022
//
import Foundation
import SwiftyJSON

struct ScoresByIndexResponse {

	let list: [List]?

	init(_ json: JSON) {
		list = json["list"].arrayValue.map { List($0) }
	}

}
