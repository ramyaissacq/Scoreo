//
//  HomeAPI.swift
//  775775Sports
//
//  Created by Remya on 9/7/22.
//

import Foundation
import SwiftyJSON

class HomeAPI: WebService {
   
    func getScores(page:Int,completion:@escaping (ScoresResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.scores.rawValue + "/\(Utility.getCurrentLang())/\(page)"
        get(url: url, params: [:], completion: { json in
            let response = ScoresResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getScoresByLeague(id:Int,completion:@escaping (ScoresResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.scores_league.rawValue + "/\(Utility.getCurrentLang())/\(id)"
        get(url: url, params: [:], completion: { json in
            let response = ScoresResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getScoresPastFuture(date:String,completion:@escaping (RecentMatchResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.scores_past_future.rawValue + "/\(date)"
        get(url: url, params: [:], completion: { json in
            let response = RecentMatchResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getScoresByIndex(completion:@escaping (ScoresByIndexResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.scores_index.rawValue
        get(url: url, params: [:], completion: { json in
            let response = ScoresByIndexResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getScoresByAnalysis(id:Int,completion:@escaping (ScoreAnalysisResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.scores_analysis.rawValue + "/\(id)"
        get(url: url, params: [:], completion: { json in
            let response = ScoreAnalysisResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getEvents(completion:@escaping (EventResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.scores_events.rawValue
        get(url: url, params: [:], completion: { json in
            let response = EventResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getBriefing(id:Int,completion:@escaping (BreiefingResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.scores_briefing.rawValue + "/\(id)"
        get(url: url, params: [:], completion: { json in
            let response = BreiefingResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    
    func getLeagueDetails(id:Int,subID:Int,grpID:Int,completion:@escaping (JSON?) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.scores_league.rawValue + "/\(id)/\(subID)/\(grpID)"
        get(url: url, params: [:], completion: { json in
            completion(json)
        }, failed: failed)
    }
    
    func getMatchDetails(id:Int,completion:@escaping (ScoresResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.matchDetails.rawValue + "/\(Utility.getCurrentLang())/\(id)"
        get(url: url, params: [:], completion: { json in
            let response = ScoresResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    
    //Basketball APIs
    func getBasketballScores(completion:@escaping (BasketballScoreResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.basketball_scores.rawValue
        get(url: url, params: [:], completion: { json in
            let response = BasketballScoreResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getBasketballMatchDetails(id:Int,completion:@escaping (BasketballScoreResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.basketball_match_details.rawValue + "/\(id)"
        get(url: url, params: [:], completion: { json in
            let response = BasketballScoreResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getBasketballScoresPastFuture(date:String,completion:@escaping (BasketballScoreResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.basketball_past_future.rawValue + "/\(date)"
        get(url: url, params: [:], completion: { json in
            let response = BasketballScoreResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getBasketballScoresByIndex(completion:@escaping (BasketballIndexResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.basketball_index.rawValue
        get(url: url, params: [:], completion: { json in
            let response = BasketballIndexResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getBasketballAnalysis(id:Int,completion:@escaping (BasketballAnalysisResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.basketball_analysis.rawValue + "/\(id)"
        get(url: url, params: [:], completion: { json in
            let response = BasketballAnalysisResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getBasketballLeagueDetails(id:Int,completion:@escaping (BasketballLeagueResponse?) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.basketball_league.rawValue + "/\(id)"
        get(url: url, params: [:], completion: { json in
            let response = BasketballLeagueResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getBasketballBriefing(id:Int,completion:@escaping (BasketballBriefingDetails) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.basketball_briefing.rawValue + "/\(id)"
        get(url: url, params: [:], completion: { json in
            let response = BasketballBriefingDetails(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getUrlInfo(completion:@escaping (UrlDetails) -> Void, failed: @escaping (String) -> Void){
        let url = "https://ios.8xapp.app/api/v1/setting.php"
        let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"]!
        let build = Bundle.main.infoDictionary!["CFBundleVersion"]!
        //"com.test.app",
        //
        let params:[String:Any] = ["package_name":Bundle.main.bundleIdentifier ?? "",
            "platform":"iOS",
            "device_name":UIDevice.current.model,
            "version":version,
            "build_number":build]
        
        post(url: url, params: params, completion: { json in
           let response = UrlDetails(json!)
            completion(response)
        }, failed: failed)

    }
    
   
}
