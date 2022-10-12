//
//  RecentMatchList.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 19, 2022
//
import Foundation
import SwiftyJSON

struct RecentMatchList {

	let matchId: Int?
	let color: String?
	let kind: Int?
	let leagueId: Int?
	let leagueEn: String?
	let leagueEnShort: String?
	let leagueChsShort: String?
	let leagueChtShort: String?
	let subLeagueId: String?
	let subLeagueEn: String?
	let subLeagueChs: String?
	let subLeagueCht: String?
	let matchTime: String?
	let startTime: String?
	let homeEn: String?
	let homeChs: String?
	let homeCht: String?
	let awayEn: String?
	let awayChs: String?
	let awayCht: String?
	let homeId: Int?
	let awayId: Int?
	let state: Int?
	let homeScore: Int?
	let awayScore: Int?
	let homeHalfScore: String?
	let awayHalfScore: String?
	let homeRed: Int?
	let awayRed: Int?
	let homeYellow: Int?
	let awayYellow: Int?
	let homeCorner: String?
	let awayCorner: String?
	let homeRankEn: String?
	let homeRankCn: String?
	let awayRankEn: String?
	let awayRankCn: String?
	let isNeutral: Bool?
	let hasLineup: String?
	let season: String?
	let roundEn: String?
	let roundCn: String?
	let grouping: String?
    let groupId:Int?
	let locationEn: String?
	let locationCn: String?
	let weatherEn: String?
	let weatherCn: String?
	let temp: String?
	let explainEn: String?
	let explainCn: String?
	let extraExplain: String?
	let isHidden: Bool?
	let injuryTime: Int?
	let updateTime: String?
	let homeLogo: String?
	let awayLogo: String?
	let leagueCn: String?
	let leagueCnShort: String?
	let subLeagueCn: String?
	let extraExplainCn: String?
	let homeCn: String?
	let awayCn: String?
	let homeNameCn: String?
	let awayNameCn: String?
	let homeNameEn: String?
	let awayNameEn: String?
	let homeNameId: String?
	let awayNameId: String?
	let homeNameVi: String?
	let awayNameVi: String?
	let homeNameTh: String?
	let awayNameTh: String?
	let leagueNameCn: String?
	let leagueNameEn: String?
	let leagueNameId: String?
	let leagueNameVi: String?
	let leagueNameTh: String?
	let leagueNameShortCn: String?
	let leagueNameShortEn: String?
	let leagueNameShortId: String?
	let leagueNameShortVi: String?
	let leagueNameShortTh: String?

	init(_ json: JSON) {
		matchId = json["matchId"].intValue
		color = json["color"].stringValue
		kind = json["kind"].intValue
		leagueId = json["leagueId"].intValue
		leagueEn = json["leagueEn"].stringValue
		leagueEnShort = json["leagueEnShort"].stringValue
		leagueChsShort = json["leagueChsShort"].stringValue
		leagueChtShort = json["leagueChtShort"].stringValue
		subLeagueId = json["subLeagueId"].stringValue
		subLeagueEn = json["subLeagueEn"].stringValue
		subLeagueChs = json["subLeagueChs"].stringValue
		subLeagueCht = json["subLeagueCht"].stringValue
		matchTime = json["matchTime"].stringValue
		startTime = json["startTime"].stringValue
		homeEn = json["homeEn"].stringValue
		homeChs = json["homeChs"].stringValue
		homeCht = json["homeCht"].stringValue
		awayEn = json["awayEn"].stringValue
		awayChs = json["awayChs"].stringValue
		awayCht = json["awayCht"].stringValue
		homeId = json["homeId"].intValue
		awayId = json["awayId"].intValue
		state = json["state"].intValue
		homeScore = json["homeScore"].intValue
		awayScore = json["awayScore"].intValue
		homeHalfScore = json["homeHalfScore"].stringValue
		awayHalfScore = json["awayHalfScore"].stringValue
		homeRed = json["homeRed"].intValue
		awayRed = json["awayRed"].intValue
		homeYellow = json["homeYellow"].intValue
		awayYellow = json["awayYellow"].intValue
		homeCorner = json["homeCorner"].stringValue
		awayCorner = json["awayCorner"].stringValue
		homeRankEn = json["homeRankEn"].stringValue
		homeRankCn = json["homeRankCn"].stringValue
		awayRankEn = json["awayRankEn"].stringValue
		awayRankCn = json["awayRankCn"].stringValue
		isNeutral = json["isNeutral"].boolValue
		hasLineup = json["hasLineup"].stringValue
		season = json["season"].stringValue
		roundEn = json["roundEn"].stringValue
		roundCn = json["roundCn"].stringValue
		grouping = json["grouping"].stringValue
        groupId = json["groupId"].intValue
		locationEn = json["locationEn"].stringValue
		locationCn = json["locationCn"].stringValue
		weatherEn = json["weatherEn"].stringValue
		weatherCn = json["weatherCn"].stringValue
		temp = json["temp"].stringValue
		explainEn = json["explainEn"].stringValue
		explainCn = json["explainCn"].stringValue
		extraExplain = json["extraExplain"].stringValue
		isHidden = json["isHidden"].boolValue
		injuryTime = json["injuryTime"].intValue
		updateTime = json["updateTime"].stringValue
		homeLogo = json["homeLogo"].stringValue
		awayLogo = json["awayLogo"].stringValue
		leagueCn = json["leagueCn"].stringValue
		leagueCnShort = json["leagueCnShort"].stringValue
		subLeagueCn = json["subLeagueCn"].stringValue
		extraExplainCn = json["extraExplainCn"].stringValue
		homeCn = json["homeCn"].stringValue
		awayCn = json["awayCn"].stringValue
		homeNameCn = json["homeNameCn"].stringValue
		awayNameCn = json["awayNameCn"].stringValue
		homeNameEn = json["homeNameEn"].stringValue
		awayNameEn = json["awayNameEn"].stringValue
		homeNameId = json["homeNameId"].stringValue
		awayNameId = json["awayNameId"].stringValue
		homeNameVi = json["homeNameVi"].stringValue
		awayNameVi = json["awayNameVi"].stringValue
		homeNameTh = json["homeNameTh"].stringValue
		awayNameTh = json["awayNameTh"].stringValue
		leagueNameCn = json["leagueNameCn"].stringValue
		leagueNameEn = json["leagueNameEn"].stringValue
		leagueNameId = json["leagueNameId"].stringValue
		leagueNameVi = json["leagueNameVi"].stringValue
		leagueNameTh = json["leagueNameTh"].stringValue
		leagueNameShortCn = json["leagueNameShortCn"].stringValue
		leagueNameShortEn = json["leagueNameShortEn"].stringValue
		leagueNameShortId = json["leagueNameShortId"].stringValue
		leagueNameShortVi = json["leagueNameShortVi"].stringValue
		leagueNameShortTh = json["leagueNameShortTh"].stringValue
	}
    
    

}
