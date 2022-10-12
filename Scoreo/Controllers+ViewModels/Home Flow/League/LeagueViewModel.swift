//
//  LeagueViewModel.swift
//  775775Sports
//
//  Created by Remya on 9/14/22.
//

import Foundation
import SwiftyJSON

protocol LeagueViewModelProtocol{
    func didFinishFetch()
    func didFinishFetchBasketballLeague()
}
class LeagueViewModel{
    var delegate:LeagueViewModelProtocol?
    var leaguDetails:LeagueResponse?
    var leagueInfoArray:[League]?
    var normalStandings:TeamStandingsResponse?
    var leaguStanding:LeagueStanding?
    var isNormalStanding = true
    var basketballLeague:BasketballLeagueResponse?
    
    func getLeagueDetails(id:Int,subID:Int,grpID:Int){
       // Utility.showProgress()
        HomeAPI().getLeagueDetails(id: id, subID: subID, grpID: grpID) { json in
            let leagueJson = json?["leagueStanding"]
            self.analyseResponseJson(json: leagueJson)
            self.leaguDetails = LeagueResponse(json!)
            self.populateData()
            self.delegate?.didFinishFetch()
        } failed: { _ in
            
        }

    }
    
    func fetchBasketballLeagueDetails(id:Int){
        HomeAPI().getBasketballLeagueDetails(id: id) { response in
            self.basketballLeague = response
            self.populateData()
            self.delegate?.didFinishFetchBasketballLeague()
        } failed: { _ in
            
        }

    }
    
    func analyseResponseJson(json:JSON?){
        if json?.arrayValue.first?["totalStandings"].isEmpty ?? true{
            print("Empty json")
            leaguStanding = json?.arrayValue.map { LeagueStanding($0) }.first
            isNormalStanding = false
        }
        else{
        normalStandings =  json?.arrayValue.map { TeamStandingsResponse($0) }.first
            isNormalStanding = true
        }
    }
    
    
    
    func populateData(){
        var tmpArr = [League]()
        let keys = ["Full Name :".localized,"Abbreviation :".localized,"Type :".localized,"Current Sub-League :".localized,"Total Rounds :".localized,"Current Round :".localized,"Current Season :".localized,"Country :".localized]
        var values = getFootballLeagueValues()
        if HomeCategoryViewController.selectedSport == .basketball{
          values = getBasketballLeagueValues()
        }
        
        for i in 0...values.count-1{
            let obj = League(key: keys[i], value: values[i])
            tmpArr.append(obj)
        }
        leagueInfoArray = tmpArr
        
    }
    
    func getFootballLeagueValues()->[String]{
        var values = [String]()
        var leagueName = ""
        var shortName = ""
        var subName  = ""
        var country = ""
        switch Utility.getCurrentLang(){
        case "en":
        leagueName = leaguDetails?.leagueData01?.first?.nameEn ?? ""
        shortName = leaguDetails?.leagueData01?.first?.nameEnShort ?? ""
        subName  = leaguDetails?.leagueData02?.first?.subNameEn ?? ""
        country = leaguDetails?.leagueData01?.first?.countryEn ?? ""
        case "cn":
            leagueName = leaguDetails?.leagueData01?.first?.nameCn ?? ""
            shortName = leaguDetails?.leagueData01?.first?.nameCnShort ?? ""
            subName  = leaguDetails?.leagueData02?.first?.subNameEn ?? ""
            country = leaguDetails?.leagueData01?.first?.countryCn ?? ""
            
        case "id":
            leagueName = leaguDetails?.leagueData01?.first?.nameId ?? ""
            shortName = leaguDetails?.leagueData01?.first?.nameIdShort ?? ""
            subName  = leaguDetails?.leagueData02?.first?.subNameId ?? ""
            country = leaguDetails?.leagueData01?.first?.countryId ?? ""
            
        case "vi":
            leagueName = leaguDetails?.leagueData01?.first?.nameVi ?? ""
            shortName = leaguDetails?.leagueData01?.first?.nameViShort ?? ""
            subName  = leaguDetails?.leagueData02?.first?.subNameVi ?? ""
            country = leaguDetails?.leagueData01?.first?.countryNameVi ?? ""
            
        case "th":
            leagueName = leaguDetails?.leagueData01?.first?.nameTh ?? ""
            shortName = leaguDetails?.leagueData01?.first?.nameThShort ?? ""
            subName  = leaguDetails?.leagueData02?.first?.subNameTh ?? ""
            country = leaguDetails?.leagueData01?.first?.countryNameTh ?? ""
           
        default:
            break
        
        
        }
        values.append(leagueName)
        values.append(shortName)
        values.append(leaguDetails?.leagueData01?.first?.type ?? "")
        values.append(subName)
        values.append(leaguDetails?.leagueData02?.first?.totalRound ?? "")
        values.append(leaguDetails?.leagueData01?.first?.currRound ?? "")
        values.append(leaguDetails?.leagueData01?.first?.currSeason ?? "")
        values.append(country)
        return values
    }
    func getBasketballLeagueValues()->[String]{
        var values = [String]()
        var leagueName = ""
        var shortName = ""
        var country = ""
        switch Utility.getCurrentLang(){
        case "en":
            leagueName = basketballLeague?.leagueData?.first?.nameEn ?? ""
          shortName = basketballLeague?.leagueData?.first?.nameEnShort ?? ""
         country = basketballLeague?.leagueData?.first?.countryEn ?? ""
       
        case "cn":
            leagueName = basketballLeague?.leagueData?.first?.nameCn ?? ""
          shortName = basketballLeague?.leagueData?.first?.nameCnShort ?? ""
         country = basketballLeague?.leagueData?.first?.countryCn ?? ""
           
            
        case "id":
            leagueName = basketballLeague?.leagueData?.first?.nameId ?? ""
          shortName = basketballLeague?.leagueData?.first?.nameIdShort ?? ""
         country = basketballLeague?.leagueData?.first?.countryId ?? ""
           
            
        case "vi":
            leagueName = basketballLeague?.leagueData?.first?.nameVi ?? ""
          shortName = basketballLeague?.leagueData?.first?.nameViShort ?? ""
         country = basketballLeague?.leagueData?.first?.countryNameVi ?? ""
            // No thai version
           
        default:
            leagueName = basketballLeague?.leagueData?.first?.nameEn ?? ""
          shortName = basketballLeague?.leagueData?.first?.nameEnShort ?? ""
         country = basketballLeague?.leagueData?.first?.countryEn ?? ""
        
        }
        values.append(leagueName)
        values.append(shortName)
        values.append(basketballLeague?.leagueData?.first?.leagueType ?? "")
        values.append("League".localized)
        values.append("")
        values.append("")
        values.append(basketballLeague?.leagueData?.first?.currentSeason ?? "")
        values.append(country)
        return values
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
    
    
    //Methods for handling rare standing object display
    func getRareStandingRowByIndex(section:Int,row:Int)->[String]{
        var standings = [String]()
        var teamName = ""
        let obj = leaguStanding?.list?.first?.score?.first?.groupScore?[section].scoreItems?[row]
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
        if Utility.getCurrentLang() == "cn"{
            return obj?.groupCn
        }
        return obj?.groupEn
        
    }
}
