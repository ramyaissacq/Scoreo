//
//  AwardsAPI.swift
//  775775Sports
//
//  Created by Remya on 9/9/22.
//

import Foundation

class AwardsAPI:WebService{
    
    func getTeamStandingsList(leagueID:Int,subLeagueID:Int,completion:@escaping (TeamStandingsResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.teamStandings.rawValue + "/\(leagueID)/sub/\(subLeagueID)"
        get(url: url, params: [:], completion: { json in
            let response = TeamStandingsResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getPlayerStandingsList(leagueID:Int,subLeagueID:Int,completion:@escaping (PlayerStandingsResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.playerStandings.rawValue + "/\(leagueID)/season/\(subLeagueID)"
        get(url: url, params: [:], completion: { json in
            let response = PlayerStandingsResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    
}
