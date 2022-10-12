//
//  BasketballAnalysisData.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 24, 2022
//
import Foundation
import SwiftyJSON

struct BasketballAnalysisData {

	let matchId: Int?
	let leagueId: Int?
	let leagueEn: String?
	let leagueChs: String?
	let leagueCht: String?
	let color: String?
	let matchTime: String?
	let matchKindEn: String?
	let matchKindCn: String?
	let homeTeamId: Int?
	let homeTeamEn: String?
	let homeTeamChs: String?
	let homeTeamCht: String?
	let awayTeamId: Int?
	let awayTeamEn: String?
	let awayTeamChs: String?
	let awayTeamCht: String?
	let homeScore: Int?
	let homeHalfScore: Int?
	let awayScore: Int?
	let awayHalfScore: Int?
	let moneyLine: Int?
	let margin: Int?
	let spreadOdds: String?
	let spreadResult: String?
	let total: Int?
	let totalOdds: String?
	let totalResult: String?
	let leagueNameEn: String?
	let leagueNameCn: String?
	let leagueNameId: String?
	let leagueNameVi: String?
	let leagueNameTh: String?
	let homeTeamNameEn: String?
	let homeTeamNameCn: String?
	let homeTeamNameId: String?
	let homeTeamNameVi: String?
	let homeTeamNameTh: String?
	let awayTeamNameEn: String?
	let awayTeamNameCn: String?
	let awayTeamNameId: String?
	let awayTeamNameVi: String?
	let awayTeamNameTh: String?

	init(_ json: JSON) {
		matchId = json["matchId"].intValue
		leagueId = json["leagueId"].intValue
		leagueEn = json["leagueEn"].stringValue
		leagueChs = json["leagueChs"].stringValue
		leagueCht = json["leagueCht"].stringValue
		color = json["color"].stringValue
		matchTime = json["matchTime"].stringValue
		matchKindEn = json["matchKindEn"].stringValue
		matchKindCn = json["matchKindCn"].stringValue
		homeTeamId = json["homeTeamId"].intValue
		homeTeamEn = json["homeTeamEn"].stringValue
		homeTeamChs = json["homeTeamChs"].stringValue
		homeTeamCht = json["homeTeamCht"].stringValue
		awayTeamId = json["awayTeamId"].intValue
		awayTeamEn = json["awayTeamEn"].stringValue
		awayTeamChs = json["awayTeamChs"].stringValue
		awayTeamCht = json["awayTeamCht"].stringValue
		homeScore = json["homeScore"].intValue
		homeHalfScore = json["homeHalfScore"].intValue
		awayScore = json["awayScore"].intValue
		awayHalfScore = json["awayHalfScore"].intValue
		moneyLine = json["moneyLine"].intValue
		margin = json["margin"].intValue
		spreadOdds = json["spreadOdds"].stringValue
		spreadResult = json["spreadResult"].stringValue
		total = json["total"].intValue
		totalOdds = json["totalOdds"].stringValue
		totalResult = json["totalResult"].stringValue
		leagueNameEn = json["leagueNameEn"].stringValue
		leagueNameCn = json["leagueNameCn"].stringValue
		leagueNameId = json["leagueNameId"].stringValue
		leagueNameVi = json["leagueNameVi"].stringValue
		leagueNameTh = json["leagueNameTh"].stringValue
		homeTeamNameEn = json["homeTeamNameEn"].stringValue
		homeTeamNameCn = json["homeTeamNameCn"].stringValue
		homeTeamNameId = json["homeTeamNameId"].stringValue
		homeTeamNameVi = json["homeTeamNameVi"].stringValue
		homeTeamNameTh = json["homeTeamNameTh"].stringValue
		awayTeamNameEn = json["awayTeamNameEn"].stringValue
		awayTeamNameCn = json["awayTeamNameCn"].stringValue
		awayTeamNameId = json["awayTeamNameId"].stringValue
		awayTeamNameVi = json["awayTeamNameVi"].stringValue
		awayTeamNameTh = json["awayTeamNameTh"].stringValue
	}

}
