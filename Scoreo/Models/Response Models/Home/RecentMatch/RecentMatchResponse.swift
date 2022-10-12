//
//  RecentMatchResponse.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 19, 2022
//
import Foundation
import SwiftyJSON

struct RecentMatchResponse {

	let matchList: [RecentMatchList]?

	init(_ json: JSON) {
		matchList = json["matchList"].arrayValue.map { RecentMatchList($0) }
	}

}
