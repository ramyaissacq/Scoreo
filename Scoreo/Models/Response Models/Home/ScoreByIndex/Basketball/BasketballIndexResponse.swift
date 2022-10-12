//
//  BasketballIndexResponse.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 23, 2022
//
import Foundation
import SwiftyJSON

struct BasketballIndexResponse {

	let List: [BasketballIndexList]?

	init(_ json: JSON) {
		List = json["List"].arrayValue.map { BasketballIndexList($0) }
	}

}
