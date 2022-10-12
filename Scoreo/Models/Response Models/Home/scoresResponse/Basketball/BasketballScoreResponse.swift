//
//  BasketballScoreResponse.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 21, 2022
//
import Foundation
import SwiftyJSON

struct BasketballScoreResponse {

	let matchList: [BasketballMatchList]?

	init(_ json: JSON) {
		matchList = json["matchList"].arrayValue.map { BasketballMatchList($0) }
	}

}
