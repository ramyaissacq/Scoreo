//
//  AwardsViewModel.swift
//  775775Sports
//
//  Created by Remya on 9/9/22.
//

import Foundation
import SwiftyJSON

protocol AwardsViewModeldelegate{
    func didFinishTeamStandingsFetch()
    func didFinishPlayerStandingsFetch()
}

class AwardsViewModel{
    var delegate:AwardsViewModeldelegate?
    //var teamStandings:LeagueStandingResponse?
    var leaguDetails:LeagueResponse?
    var playerStandings:[PlayerStandings]?
    var normalStandings:TeamStandingsResponse?
    var leaguStanding:LeagueStanding?
    var isNormalStanding = true
    
    func getTeamStandings2(leagueID:Int,subLeagueID:Int){
       // Utility.showProgress()
        AwardsAPI().getTeamStandingsList(leagueID: leagueID, subLeagueID: subLeagueID) { response in
            //self.teamStandings = response
            //self.delegate?.didFinishTeamStandingsFetch()
        } failed: { msg in
            Utility.showErrorSnackView(message: msg)
        }
        
    }
    func getTeamStandings(leagueID:Int,subLeagueID:Int){
        // Utility.showProgress()
        HomeAPI().getLeagueDetails(id: leagueID, subID: subLeagueID, grpID: 0) { json in
            let leagueJson = json?["leagueStanding"]
            self.analyseResponseJson(json: leagueJson, leagueID: leagueID)
            self.leaguDetails = LeagueResponse(json!)
            self.delegate?.didFinishTeamStandingsFetch()
            
        } failed: { _ in
            
        }
        
    }
    
    func getPlayerStandings(leagueID:Int){
       // Utility.showProgress()
        AwardsAPI().getPlayerStandingsList(leagueID: leagueID, subLeagueID: 0) { response in
            self.playerStandings = response.list
            self.delegate?.didFinishPlayerStandingsFetch()
        } failed: { msg in
            Utility.showErrorSnackView(message: msg)
        }
        
    }
    
  
    
    func analyseResponseJson(json:JSON?,leagueID:Int){
        if !(json?.arrayValue.first?["totalStandings"].isEmpty ?? true){
            normalStandings =  json?.arrayValue.map { TeamStandingsResponse($0) }.first
            isNormalStanding = true
            return
            
        }
        
        if json?.arrayValue.first?["list"].arrayValue.first?["subId"].intValue != 0{
            let subID = json?.arrayValue.first?["list"].arrayValue.first?["subId"].intValue ?? 0
            getTeamStandings(leagueID: leagueID, subLeagueID: subID)
            return
        }
        else{
            print("Empty json")
            leaguStanding = json?.arrayValue.map { LeagueStanding($0) }.first
            isNormalStanding = false
            
        }
        
        
    }
    
    //Methods for handling rare standing object display
    func getRareStandingRowByIndex(section:Int,row:Int)->[String]{
        var standings = [String]()
        let obj = leaguStanding?.list?.first?.score?.first?.groupScore?[section].scoreItems?[row]
        var teamName = ""
        switch Utility.getCurrentLang(){
        case "en":
           teamName = obj?.teamNameEn ?? ""
        case "cn":
            teamName = obj?.teamNameChs ?? ""
        
        default:
            teamName = obj?.teamNameEn ?? ""
        
        
        }
        standings.append(obj?.rank ?? "0")
        standings.append(teamName)
        standings.append(obj?.totalCount ?? "0")
        standings.append(obj?.winCount ?? "0")
        standings.append(obj?.drawCount ?? "0")
        standings.append(obj?.loseCount ?? "0")
        standings.append(obj?.getScore ?? "0")
        standings.append(obj?.loseScore ?? "0")
        standings.append(obj?.integral ?? "0")
        
        return standings
    }
    
    func getGroupName(section:Int)->String?{
        let obj = leaguStanding?.list?.first?.score?.first?.groupScore?[section]
        return obj?.groupEn
        
    }
    
    
    //Methods for handling teamstandings display
    func getTeamRowByIndex(index:Int)->[String]{
        var standings = [String]()
        let obj = normalStandings?.totalStandings?[index]
        standings.append("\(obj?.rank ?? 0)")
        var team = ""
        if let teamID = obj?.teamId{
            let teamObj = normalStandings?.teamInfo?.filter{$0.teamId == teamID}.first
            var teamName = ""
            switch Utility.getCurrentLang(){
            case "en":
               teamName = teamObj?.nameEn ?? ""
            case "cn":
                teamName = teamObj?.nameChs ?? ""
            
            default:
                teamName = teamObj?.nameEn ?? ""
            
            
            }
            
            team = (teamName) + "," + (teamObj?.flag ?? "")
        }
        print(team)
        standings.append(team)
        standings.append("\(obj?.totalCount ?? 0)")
        standings.append("\(obj?.winCount ?? 0)")
        standings.append("\(obj?.drawCount ?? 0)")
        standings.append("\(obj?.loseCount ?? 0)")
        standings.append("\(obj?.getScore ?? 0)")
        standings.append("\(obj?.loseScore ?? 0)")
        standings.append("\(obj?.integral ?? 0)")
        
        return standings
    }
    
    func getResultsPercentageStringByIndex(index:Int)->String{
        let obj = normalStandings?.totalStandings?[index]
        let percentageString = "W%=\(obj?.winRate ?? "")% / L%=\(obj?.loseRate ?? "")% / AVA=\(obj?.loseAverage ?? 0) / D%=\(obj?.drawRate ?? "")% / AVF=\(obj?.winAverage ?? 0)"
        return percentageString
    }
    
    func getResultsArrayByIndex(index:Int)->[String]{
        var results = [String]()
        let obj = normalStandings?.totalStandings?[index]
        if let status = Int(obj?.recentFirstResult ?? ""){
            results.append(getStatusName(status: status))
        }
        if let status = Int(obj?.recentSecondResult ?? ""){
            results.append(getStatusName(status: status))
        }
        if let status = Int(obj?.recentThirdResult ?? ""){
            results.append(getStatusName(status: status))
        }
        if let status = Int(obj?.recentFourthResult ?? ""){
            results.append(getStatusName(status: status))
        }
        if let status = Int(obj?.recentFifthResult ?? ""){
            results.append(getStatusName(status: status))
        }
        if let status = Int(obj?.recentSixthResult ?? ""){
            results.append(getStatusName(status: status))
        }
        return results
    }
    
    func getStatusName(status:Int)->String{
        switch status{
        case 0:
            return "W"
        case 1:
            return "D"
        case 2:
            return "L"
        case 3:
            return "TBD"
        default:
            return ""
        }
    }
    
    //Methods for handling player standings display
    
    func getPlayerRowByIndex(index:Int)->[String]{
        var standings = [String]()
        let obj = playerStandings?[index]
        var teamName = ""
        var playerName = ""
        switch Utility.getCurrentLang(){
        case "en":
           teamName = obj?.teamNameEn ?? ""
            playerName = obj?.playerNameEn ?? ""
        case "cn":
            teamName = obj?.teamNameChs ?? ""
            playerName = obj?.playerNameChs ?? ""
        
        default:
            teamName = obj?.teamNameEn ?? ""
            playerName = obj?.playerNameEn ?? ""
        
        
        }
        standings.append("\(index+1)")
        standings.append(teamName)
        standings.append(playerName)
        standings.append("\(obj?.goals ?? 0)")
        standings.append("\(obj?.homeGoals ?? 0)")
        standings.append("\(obj?.awayGoals ?? 0)")
        return standings
    }
    
    func getPlayerPointsByIndex(index:Int)->[String]{
        var points = [String]()
        let obj = playerStandings?[index]
        points.append("\("Home Penalty".localized) : \(obj?.homePenalty ?? 0)")
        points.append("\("Away Penalty".localized) : \(obj?.awayPenalty ?? 0)")
                      points.append("\("Match Number".localized) : \(obj?.matchNum ?? 0)")
        points.append("\("Sub Number".localized) : \(obj?.subNum ?? 0)")
        return points
    }
    
}
