//
//  PlayerStandingsResponse.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 10, 2022
//
import Foundation
import SwiftyJSON

struct PlayerStandingsResponse {

	let list: [PlayerStandings]?

	init(_ json: JSON) {
		list = json["list"].arrayValue.map { PlayerStandings($0) }
	}

}
