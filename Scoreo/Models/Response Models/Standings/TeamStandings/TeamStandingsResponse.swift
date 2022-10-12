//
//  TeamStandingsResponse.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 09, 2022
//
import Foundation
import SwiftyJSON

struct TeamStandingsResponse {

	let leagueInfo: LeagueInfo?
	let teamInfo: [TeamInfo]?
	let totalStandings: [TotalStandings]?
	let halfStandings: [HalfStandings]?
	let homeStandings: [HomeStandings]?
	let awayStandings: [AwayStandings]?
	let homeHalfStandings: [HomeHalfStandings]?
	let awayHalfStandings: [AwayHalfStandings]?
	let leagueColorInfos: [LeagueColorInfos]?
	let isConference: Bool?
	let lastUpdateTime: String?
	let scoreCountType: Int?

	init(_ json: JSON) {
		leagueInfo = LeagueInfo(json["leagueInfo"])
		teamInfo = json["teamInfo"].arrayValue.map { TeamInfo($0) }
		totalStandings = json["totalStandings"].arrayValue.map { TotalStandings($0) }
		halfStandings = json["halfStandings"].arrayValue.map { HalfStandings($0) }
		homeStandings = json["homeStandings"].arrayValue.map { HomeStandings($0) }
		awayStandings = json["awayStandings"].arrayValue.map { AwayStandings($0) }
		homeHalfStandings = json["homeHalfStandings"].arrayValue.map { HomeHalfStandings($0) }
		awayHalfStandings = json["awayHalfStandings"].arrayValue.map { AwayHalfStandings($0) }
		leagueColorInfos = json["leagueColorInfos"].arrayValue.map { LeagueColorInfos($0) }
		isConference = json["isConference"].boolValue
		lastUpdateTime = json["lastUpdateTime"].stringValue
		scoreCountType = json["scoreCountType"].intValue
	}

}
