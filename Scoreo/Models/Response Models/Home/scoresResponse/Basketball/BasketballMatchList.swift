//
//  BasketballMatchList.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 21, 2022
//
import Foundation
import SwiftyJSON

struct BasketballMatchList {

	let matchId: Int?
	let leagueId: Int?
	let leagueEn: String?
	let leagueChs: String?
	let leagueCht: String?
	let leagueType: Int?
	let color: String?
	let matchTime: String?
	let matchState: Int?
	let remainTime: String?
	let homeTeamId: Int?
	let homeTeamEn: String?
	let homeTeamChs: String?
	let homeTeamCht: String?
	let homeRankEn: String?
	let homeRankCn: String?
	let awayTeamId: Int?
	let awayTeamEn: String?
	let awayTeamChs: String?
	let awayTeamCht: String?
	let awayRankEn: String?
	let awayRankCn: String?
	let overtimeCount: Int?
	let homeScore: String?
	let home1: String?
	let home2: String?
	let home3: String?
	let home4: String?
	let homeOT1: String?
	let homeOT2: String?
	let homeOT3: String?
	let awayScore: String?
	let away1: String?
	let away2: String?
	let away3: String?
	let away4: String?
	let awayOT1: String?
	let awayOT2: String?
	let awayOT3: String?
	let hasStats: Bool?
	let explainEn: String?
	let explainCn: String?
	let tv: String?
	let isNeutral: Bool?
	let season: String?
	let matchKind: String?
	let cupQualifyId: Int?
	let roundTypeEn: String?
	let roundTypeChs: String?
	let group: String?
	let updateTime: String?
	let leagueCn: String?
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
	let homeLogo: String?
    var homeTeamNameCn: String?
	let homeTeamNameEn: String?
    var homeTeamNameId: String?
	var homeTeamNameVi: String?
    var homeTeamNameTh: String?
	let awayLogo: String?
    var awayTeamNameCn: String?
	let awayTeamNameEn: String?
    var awayTeamNameId: String?
    var awayTeamNameVi: String?
    var awayTeamNameTh: String?
	let havLiveText: Bool?
	let havLiveTextEn: Bool?
	let havLineup: Bool?
	let havBriefing: Bool?
	let havAnimate: Bool?
	let havAnim: Bool?
	let havAnimCompareHome: String?
	let havAnimCompareAway: String?
	let havAnimComparePercent: Int?
	let animateURLEn: String?
	let animateURLCn: String?
	let havLiveVideo: Bool?
	let videoId: Int?
	let videoDetail: VideoDetail?
	let havLiveAnchor: Bool?
	let havLiveAnchorId: String?
	let havLiveAnchorLocale: String?
	let odds: BasketOdds?

	init(_ json: JSON) {
		matchId = json["matchId"].intValue
		leagueId = json["leagueId"].intValue
		leagueEn = json["leagueEn"].stringValue
		leagueChs = json["leagueChs"].stringValue
		leagueCht = json["leagueCht"].stringValue
		leagueType = json["leagueType"].intValue
		color = json["color"].stringValue
		matchTime = json["matchTime"].stringValue
		matchState = json["matchState"].intValue
		remainTime = json["remainTime"].stringValue
		homeTeamId = json["homeTeamId"].intValue
		homeTeamEn = json["homeTeamEn"].stringValue
		homeTeamChs = json["homeTeamChs"].stringValue
		homeTeamCht = json["homeTeamCht"].stringValue
		homeRankEn = json["homeRankEn"].stringValue
		homeRankCn = json["homeRankCn"].stringValue
		awayTeamId = json["awayTeamId"].intValue
		awayTeamEn = json["awayTeamEn"].stringValue
		awayTeamChs = json["awayTeamChs"].stringValue
		awayTeamCht = json["awayTeamCht"].stringValue
		awayRankEn = json["awayRankEn"].stringValue
		awayRankCn = json["awayRankCn"].stringValue
		overtimeCount = json["overtimeCount"].intValue
		homeScore = json["homeScore"].stringValue
		home1 = json["home1"].stringValue
		home2 = json["home2"].stringValue
		home3 = json["home3"].stringValue
		home4 = json["home4"].stringValue
		homeOT1 = json["homeOT1"].stringValue
		homeOT2 = json["homeOT2"].stringValue
		homeOT3 = json["homeOT3"].stringValue
		awayScore = json["awayScore"].stringValue
		away1 = json["away1"].stringValue
		away2 = json["away2"].stringValue
		away3 = json["away3"].stringValue
		away4 = json["away4"].stringValue
		awayOT1 = json["awayOT1"].stringValue
		awayOT2 = json["awayOT2"].stringValue
		awayOT3 = json["awayOT3"].stringValue
		hasStats = json["hasStats"].boolValue
		explainEn = json["explainEn"].stringValue
		explainCn = json["explainCn"].stringValue
		tv = json["tv"].stringValue
		isNeutral = json["isNeutral"].boolValue
		season = json["season"].stringValue
		matchKind = json["matchKind"].stringValue
		cupQualifyId = json["cupQualifyId"].intValue
		roundTypeEn = json["roundTypeEn"].stringValue
		roundTypeChs = json["roundTypeChs"].stringValue
		group = json["group"].stringValue
		updateTime = json["updateTime"].stringValue
		leagueCn = json["leagueCn"].stringValue
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
		homeLogo = json["homeLogo"].stringValue
		homeTeamNameCn = json["homeTeamNameCn"].stringValue
		homeTeamNameEn = json["homeTeamNameEn"].stringValue
		homeTeamNameId = json["homeTeamNameId"].stringValue
		homeTeamNameVi = json["homeTeamNameVi"].stringValue
		homeTeamNameTh = json["homeTeamNameTh"].stringValue
		awayLogo = json["awayLogo"].stringValue
		awayTeamNameCn = json["awayTeamNameCn"].stringValue
		awayTeamNameEn = json["awayTeamNameEn"].stringValue
		awayTeamNameId = json["awayTeamNameId"].stringValue
		awayTeamNameVi = json["awayTeamNameVi"].stringValue
		awayTeamNameTh = json["awayTeamNameTh"].stringValue
		havLiveText = json["havLiveText"].boolValue
		havLiveTextEn = json["havLiveTextEn"].boolValue
		havLineup = json["havLineup"].boolValue
		havBriefing = json["havBriefing"].boolValue
		havAnimate = json["havAnimate"].boolValue
		havAnim = json["havAnim"].boolValue
		havAnimCompareHome = json["havAnimCompareHome"].stringValue
		havAnimCompareAway = json["havAnimCompareAway"].stringValue
		havAnimComparePercent = json["havAnimComparePercent"].intValue
		animateURLEn = json["animateURLEn"].stringValue
		animateURLCn = json["animateURLCn"].stringValue
		havLiveVideo = json["havLiveVideo"].boolValue
		videoId = json["videoId"].intValue
		videoDetail = VideoDetail(json["videoDetail"])
		havLiveAnchor = json["havLiveAnchor"].boolValue
		havLiveAnchorId = json["havLiveAnchorId"].stringValue
		havLiveAnchorLocale = json["havLiveAnchorLocale"].stringValue
		odds = BasketOdds(json["odds"])
        if homeTeamNameCn?.count == 0{
            homeTeamNameCn = json["homeTeamCn"].stringValue
        }
        if homeTeamNameId?.count == 0{
            homeTeamNameId = json["homeTeamId"].stringValue
        }
        if homeTeamNameVi?.count == 0{
            homeTeamNameVi = json["homeTeamVi"].stringValue
        }
        if homeTeamNameTh?.count == 0{
            homeTeamNameTh = json["homeTeamTh"].stringValue
        }
        
        if awayTeamNameCn?.count == 0{
            awayTeamNameCn = json["awayTeamCn"].stringValue
        }
        if awayTeamNameId?.count == 0{
            awayTeamNameId = json["awayTeamId"].stringValue
        }
        if awayTeamNameVi?.count == 0{
            awayTeamNameVi = json["awayTeamVi"].stringValue
        }
        if awayTeamNameTh?.count == 0{
            awayTeamNameTh = json["awayTeamTh"].stringValue
            
        }
	}
    
    func toDictionary() -> [String:Any]{
        var dict = [String:Any]()
        dict["matchId"] = matchId ?? 0
        dict["leagueId"] = leagueId ?? 0
        dict["leagueEn"] = leagueEn ?? ""
        dict["leagueChs"] = leagueChs ?? ""
        dict["leagueCht"] = leagueCht ?? ""
        dict["leagueType"] = leagueType ?? 0
        dict["color"] = color ?? ""
        dict["matchTime"] = matchTime ?? ""
        dict["matchState"] = matchState ?? 0
        dict["remainTime"] = remainTime ?? ""
        dict["homeTeamId"] = homeTeamId ?? 0
        dict["homeTeamEn"] = homeTeamEn ?? ""
        dict["homeTeamChs"] = homeTeamChs ?? ""
        dict["homeTeamCht"] = homeTeamCht ?? ""
        dict["homeRankEn"] = homeRankEn ?? ""
        dict["homeRankCn"] = homeRankCn ?? ""
        dict["awayTeamId"] = awayTeamId ?? 0
        dict["awayTeamEn"] = awayTeamEn ?? ""
        dict["awayTeamChs"] = awayTeamChs ?? ""
        dict["awayTeamCht"] = awayTeamCht ?? ""
        dict["awayRankEn"] = awayRankEn ?? ""
        dict["awayRankCn"] = awayRankCn ?? ""
        dict["overtimeCount"] = overtimeCount ?? 0
        dict["homeScore"] = homeScore ?? ""
        dict["home1"] = home1 ?? ""
        dict["home2"] = home2 ?? ""
        dict["home3"] = home3 ?? ""
        dict["home4"] = home4 ?? ""
        dict["homeOT1"] = homeOT1 ?? ""
        dict["homeOT2"] = homeOT2 ?? ""
        dict["homeOT3"] = homeOT3 ?? ""
        dict["awayScore"] = awayScore ?? ""
        dict["away1"] = away1 ?? ""
        dict["away2"] = away2 ?? ""
        dict["away3"] = away3 ?? ""
        dict["away4"] = away4 ?? ""
        dict["awayOT1"] = awayOT1 ?? ""
        dict["awayOT2"] = awayOT2 ?? ""
        dict["awayOT3"] = awayOT3 ?? ""
        dict["hasStats"] = hasStats ?? false
        dict["explainEn"] = explainEn ?? ""
        dict["explainCn"] = explainCn ?? ""
        dict["tv"] = tv ?? ""
        dict["isNeutral"] = isNeutral ?? false
        dict["season"] = season ?? ""
        dict["matchKind"] = matchKind ?? ""
        dict["cupQualifyId"] = cupQualifyId ?? 0
        dict["roundTypeEn"] = roundTypeEn ?? ""
        dict["roundTypeChs"] = roundTypeChs ?? ""
        dict["group"] = group ?? ""
        dict["updateTime"] = updateTime ?? ""
        dict["leagueCn"] = leagueCn ?? ""
        dict["leagueNameCn"] = leagueNameCn ?? ""
        dict["leagueNameEn"] = leagueNameEn ?? ""
        dict["leagueNameId"] = leagueNameId ?? ""
        dict["leagueNameVi"] = leagueNameVi ?? ""
        dict["leagueNameTh"] = leagueNameTh ?? ""
        dict["leagueNameShortCn"] = leagueNameShortCn ?? ""
        dict["leagueNameShortEn"] = leagueNameShortEn ?? ""
        dict["leagueNameShortId"] = leagueNameShortId ?? ""
        dict["leagueNameShortVi"] = leagueNameShortVi ?? ""
        dict["leagueNameShortTh"] = leagueNameShortTh ?? ""
        dict["homeLogo"] = homeLogo ?? ""
        dict["homeTeamNameCn"] = homeTeamNameCn ?? ""
        dict["homeTeamNameEn"] = homeTeamNameEn ?? ""
        dict["homeTeamNameId"] = homeTeamNameId ?? ""
        dict["homeTeamNameVi"] = homeTeamNameVi ?? ""
        dict["homeTeamNameTh"] = homeTeamNameTh ?? ""
        dict["awayLogo"] = awayLogo ?? ""
        dict["awayTeamNameCn"] = awayTeamNameCn ?? ""
        dict["awayTeamNameEn"] = awayTeamNameEn ?? ""
        dict["awayTeamNameId"] = awayTeamNameId ?? ""
        dict["awayTeamNameVi"] = awayTeamNameVi ?? ""
        dict["awayTeamNameTh"] = awayTeamNameTh ?? ""
        dict["havLiveText"] = havLiveText ?? ""
        dict["havLiveTextEn"] = havLiveTextEn ?? ""
        dict["havLineup"] = havLineup ?? ""
        dict["havBriefing"] = havBriefing ?? ""
        dict["havAnimate"] = havAnimate ?? ""
        dict["havAnim"] = havAnim ?? ""
        dict["havAnimCompareHome"] = havAnimCompareHome ?? ""
        dict["havAnimCompareAway"] = havAnimCompareAway ?? ""
        dict["havAnimComparePercent"] = havAnimComparePercent ?? 0
        dict["animateURLEn"] = animateURLEn ?? ""
        dict["animateURLCn"] = animateURLCn ?? ""
        dict["havLiveVideo"] = havLiveVideo ?? false
        dict["videoId"] = videoId ?? 0
        dict["videoDetail"] = videoDetail?.toDictionary()
        dict["havLiveAnchor"] = havLiveAnchor ?? false
        dict["havLiveAnchorId"] = havLiveAnchorId ?? ""
        dict["havLiveAnchorLocale"] = havLiveAnchorLocale ?? ""
        dict["odds"] = odds?.toDictionary()
        
        return dict
    }

}
