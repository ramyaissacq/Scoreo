//
//  MatchList.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 07, 2022
//
import Foundation
import SwiftyJSON

struct MatchList {

	let matchId: Int?
	let color: String?
	let kind: Int?
	let leagueId: Int?
	let subLeagueId: String?
	let matchTime: String?
	let startTime: String?
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
	let isNeutral: Bool?
	let hasLineup: String?
	let season: String?
	let grouping: String?
    let groupId:Int?
	let temp: String?
	let extraExplain: String?
	let isHidden: Bool?
	let havEvent: Bool?
	let havTech: Bool?
	let havAnim: Bool?
	let animateURL: String?
	let havBriefing: Bool?
	let havPlayerDetails: Bool?
	let havLineup: Bool?
	let havTextLive: Bool?
	let havLiveVideo: Bool?
	let videoId: Int?
	let videoDetail: VideoDetail?
	let havLiveAnchor: Bool?
	let havLiveAnchorId: String?
	let havLiveAnchorLocale: String?
	let homeLogo: String?
	let awayLogo: String?
	let havOdds: Bool?
	let odds: Odds?
	let leagueName: String?
	let leagueNameShort: String?
	let subLeagueName: String?
	let homeName: String?
	let awayName: String?
	let homeRank: String?
	let awayRank: String?
	let round: String?
	let location: String?
	let weather: String?
	let explain: String?

	init(_ json: JSON) {
		matchId = json["matchId"].intValue
		color = json["color"].stringValue
		kind = json["kind"].intValue
		leagueId = json["leagueId"].intValue
		subLeagueId = json["subLeagueId"].stringValue
		matchTime = json["matchTime"].stringValue
		startTime = json["startTime"].stringValue
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
		isNeutral = json["isNeutral"].boolValue
		hasLineup = json["hasLineup"].stringValue
		season = json["season"].stringValue
		grouping = json["grouping"].stringValue
        groupId = json["groupId"].intValue
		temp = json["temp"].stringValue
		extraExplain = json["extraExplain"].stringValue
		isHidden = json["isHidden"].boolValue
		havEvent = json["havEvent"].boolValue
		havTech = json["havTech"].boolValue
		havAnim = json["havAnim"].boolValue
		animateURL = json["animateURL"].stringValue
		havBriefing = json["havBriefing"].boolValue
		havPlayerDetails = json["havPlayerDetails"].boolValue
		havLineup = json["havLineup"].boolValue
		havTextLive = json["havTextLive"].boolValue
		havLiveVideo = json["havLiveVideo"].boolValue
		videoId = json["videoId"].intValue
		videoDetail = VideoDetail(json["videoDetail"])
		havLiveAnchor = json["havLiveAnchor"].boolValue
		havLiveAnchorId = json["havLiveAnchorId"].stringValue
		havLiveAnchorLocale = json["havLiveAnchorLocale"].stringValue
		homeLogo = json["homeLogo"].stringValue
		awayLogo = json["awayLogo"].stringValue
		havOdds = json["havOdds"].boolValue
		odds = Odds(json["odds"])
		leagueName = json["leagueName"].stringValue
		leagueNameShort = json["leagueNameShort"].stringValue
		subLeagueName = json["subLeagueName"].stringValue
		homeName = json["homeName"].stringValue
		awayName = json["awayName"].stringValue
		homeRank = json["homeRank"].stringValue
		awayRank = json["awayRank"].stringValue
		round = json["round"].stringValue
		location = json["location"].stringValue
		weather = json["weather"].stringValue
		explain = json["explain"].stringValue
	}
    
    init(obj:RecentMatchList?){
        matchId = obj?.matchId
        color = obj?.color
        kind = obj?.kind
        leagueId = obj?.leagueId
        subLeagueId = obj?.subLeagueId
        matchTime = obj?.matchTime
        startTime = obj?.startTime
        homeId = obj?.homeId
        awayId = obj?.awayId
        state = obj?.state
        homeScore = obj?.homeScore
        awayScore = obj?.awayScore
        homeHalfScore = obj?.homeHalfScore
        awayHalfScore = obj?.awayHalfScore
        homeRed = obj?.homeRed
        awayRed = obj?.awayRed
        homeYellow = obj?.homeYellow
        awayYellow = obj?.awayYellow
        homeCorner = obj?.homeCorner
        awayCorner = obj?.awayCorner
        isNeutral = obj?.isNeutral
        hasLineup = obj?.hasLineup
        season = obj?.season
        grouping = obj?.grouping
        groupId = obj?.groupId
        temp = obj?.temp
        extraExplain = obj?.extraExplain
        isHidden = obj?.isHidden
        havEvent = nil
        havTech = nil
        havAnim = nil
        animateURL = nil
        havBriefing = nil
        havPlayerDetails = nil
        havLineup = nil
        havTextLive = nil
        havLiveVideo = nil
        videoId = nil
        videoDetail = nil
        havLiveAnchor = nil
        havLiveAnchorId = nil
        havLiveAnchorLocale = nil
        homeLogo = obj?.homeLogo
        awayLogo = obj?.awayLogo
        havOdds = nil
        odds = nil
        switch Utility.getCurrentLang(){
        case "en":
            leagueName = obj?.leagueNameEn
            leagueNameShort = obj?.leagueNameShortEn
            subLeagueName = obj?.subLeagueEn
            homeName = obj?.homeNameEn
            awayName = obj?.awayNameEn
            homeRank = obj?.homeRankEn
            awayRank = obj?.awayRankEn
            round = obj?.roundEn
           
        case "cn":
            leagueName = obj?.leagueNameCn
            leagueNameShort = obj?.leagueNameShortCn
            subLeagueName = obj?.subLeagueCn
            homeName = obj?.homeNameCn
            awayName = obj?.awayNameCn
            homeRank = obj?.homeRankCn
            awayRank = obj?.awayRankCn
            round = obj?.roundCn
            
        case "id":
            leagueName = obj?.leagueNameId
            leagueNameShort = obj?.leagueNameShortId
            subLeagueName = obj?.subLeagueId
            homeName = obj?.homeNameId
            awayName = obj?.awayNameId
            homeRank = obj?.homeRankEn
            awayRank = obj?.awayRankEn
            round = obj?.roundEn
            
        case "vi":
            leagueName = obj?.leagueNameVi
            leagueNameShort = obj?.leagueNameShortVi
            subLeagueName = obj?.subLeagueEn
            homeName = obj?.homeNameVi
            awayName = obj?.awayNameVi
            homeRank = obj?.homeRankEn
            awayRank = obj?.awayRankEn
            round = obj?.roundEn
        case "th":
            leagueName = obj?.leagueNameTh
            leagueNameShort = obj?.leagueNameShortTh
            subLeagueName = obj?.subLeagueEn
            homeName = obj?.homeNameTh
            awayName = obj?.awayNameTh
            homeRank = obj?.homeRankEn
            awayRank = obj?.awayRankEn
            round = obj?.roundEn
            
        default:
            leagueName = obj?.leagueNameEn
            leagueNameShort = obj?.leagueNameShortEn
            subLeagueName = obj?.subLeagueEn
            homeName = obj?.homeNameEn
            awayName = obj?.awayNameEn
            homeRank = obj?.homeRankEn
            awayRank = obj?.awayRankEn
            round = obj?.roundEn
        
        
        }
        
        location = obj?.locationEn
        weather = obj?.weatherEn
        explain = obj?.explainEn
    }
    
    
    func toDictionary() ->[String:Any]{
        var dict = [String:Any]()
        dict["matchId"] = matchId ?? 0
        dict["color"] = color ?? ""
        dict["kind"] = kind ?? 0
        dict["leagueId"] = leagueId ?? 0
        dict["subLeagueId"] = subLeagueId ?? ""
        dict["matchTime"] = matchTime ?? ""
        dict["startTime"] = startTime ?? ""
        dict["homeId"] = homeId ?? 0
        dict["awayId"] = awayId ?? 0
        dict["state"] = state ?? 0
        dict["homeScore"] = homeScore ?? 0
        dict["awayScore"] = awayScore ?? 0
        dict["homeHalfScore"] = homeHalfScore ?? ""
        dict["awayHalfScore"] = awayHalfScore ?? ""
        dict["homeRed"] = homeRed ?? 0
        dict["awayRed"] = awayRed ?? 0
        dict["homeYellow"] = homeYellow ?? 0
        dict["awayYellow"] = awayYellow ?? 0
        dict["homeCorner"] = homeCorner ?? ""
        dict["awayCorner"] = awayCorner ?? ""
        dict["isNeutral"] = isNeutral ?? false
        dict["hasLineup"] = hasLineup ?? ""
        dict["season"] = season ?? ""
        dict["grouping"] = grouping ?? ""
        dict["groupId"] = groupId ?? 0
        dict["temp"] = temp ?? ""
        dict["extraExplain"] = extraExplain ?? ""
        dict["isHidden"] = isHidden ?? false
        dict["havEvent"] = havEvent ?? false
        dict["havTech"] = havTech ?? false
        dict["havAnim"] = havAnim ?? false
        dict["animateURL"] = animateURL ?? ""
        dict["havBriefing"] = havBriefing ?? false
        dict["havPlayerDetails"] = havPlayerDetails ?? false
        dict["havLineup"] = havLineup ?? false
        dict["havTextLive"] = havTextLive ?? false
        dict["havLiveVideo"] = havLiveVideo ?? false
        dict["videoId"] = videoId ?? 0
        dict["videoDetail"] = videoDetail?.toDictionary()
        dict["havLiveAnchor"] = havLiveAnchor ?? false
        dict["havLiveAnchorId"] = havLiveAnchorId ?? ""
        dict["havLiveAnchorLocale"] = havLiveAnchorLocale ?? ""
        dict["homeLogo"] = homeLogo ?? ""
        dict["awayLogo"] = awayLogo ?? ""
        dict["havOdds"] = havOdds ?? false
        dict["odds"] = odds?.toDictionary()
        dict["leagueName"] = leagueName ?? ""
        dict["leagueNameShort"] = leagueNameShort ?? ""
        dict["subLeagueName"] = subLeagueName ?? ""
        dict["homeName"] = homeName ?? ""
        dict["awayName"] = awayName ?? ""
        dict["homeRank"] = homeRank ?? ""
        dict["awayRank"] = awayRank ?? ""
        dict["round"] = round ?? ""
        dict["location"] = location ?? ""
        dict["weather"] = weather ?? ""
        dict["explain"] = explain ?? ""
        return dict
        
    }

}
