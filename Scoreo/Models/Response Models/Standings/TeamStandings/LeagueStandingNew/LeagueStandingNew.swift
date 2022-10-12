//
//  LeagueStanding.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 27, 2022
//
import Foundation
import SwiftyJSON

struct LeagueStandingNew {

	let leagueInfo: LeagueInfo?
	let teamInfo: [TeamInfo]?
	let totalStandings: [TotalStandings]?

	init(_ json: JSON) {
		leagueInfo = LeagueInfo(json["leagueInfo"])
		teamInfo = json["teamInfo"].arrayValue.map { TeamInfo($0) }
		totalStandings = json["totalStandings"].arrayValue.map { TotalStandings($0) }
	}

}
