//
//  LeagueStanding.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 15, 2022
//
import Foundation
import SwiftyJSON

struct LeagueStanding {

	let list: [LeagueStandingList]?

	init(_ json: JSON) {
		list = json["list"].arrayValue.map { LeagueStandingList($0) }
	}

}
