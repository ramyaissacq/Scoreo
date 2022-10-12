//
//  LeagueResponse.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 14, 2022
//
import Foundation
import SwiftyJSON

struct LeagueResponse {

	let leagueData01: [LeagueData01]?
	let leagueData02: [LeagueData02]?
	let leagueData04: [LeagueData04]?
   // let leagueStanding: [TeamStandingsResponse]?

	init(_ json: JSON) {
		leagueData01 = json["leagueData01"].arrayValue.map { LeagueData01($0) }
		leagueData02 = json["leagueData02"].arrayValue.map { LeagueData02($0) }
		leagueData04 = json["leagueData04"].arrayValue.map { LeagueData04($0) }
        //leagueStanding = json["leagueStanding"].arrayValue.map { TeamStandingsResponse($0) }
	}

}
