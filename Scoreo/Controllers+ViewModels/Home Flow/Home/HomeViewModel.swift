//
//  HomeViewModel.swift
//  775775Sports
//
//  Created by Remya on 9/7/22.
//

import Foundation
protocol HomeViewModelDelegate{
    
    func diFinisfFetchMatches()
    func getCurrentPage()->Int
    func didFinishFetchRecentMatches()
    func didFinishFilterByLeague()
    func didFinishFetchMatchDetails()
    func didFinishFetchBasketballScores()
    func didFinishFetchBasketballRecentMatches()
    func didFinishFetchBasketballScoreDetails()
    
}

 extension HomeViewModelDelegate{
     func getCurrentPage()->Int{return 0}
     func didFinishFetchRecentMatches(){}
     func didFinishFilterByLeague(){}
     func didFinishFetchBasketballScores(){}
     func didFinishFetchBasketballRecentMatches(){}
     func didFinishFetchBasketballScoreDetails(){}
     func didFinishFetchMatchDetails(){}
     
}

class HomeVieModel{
    var delegate:HomeViewModelDelegate?
    var matches:[MatchList]?
    var originals:[MatchList]?
    var pageData:Meta?
    var scoreResponse:ScoresResponse?
    var pastDates = getRecentDates(isPast: true, limit: 10)
    var futureDates = getRecentDates(isPast: false, limit: 10)
    var todayCategories = ["ALL".localized,"LIVE".localized,"SOON".localized,"FT".localized]
    //,"OTHER"
    var categories = [String]()
    
    //basketball models
    var basketballMatches:[BasketballMatchList]?
    var originaBasketballMatches:[BasketballMatchList]?
    
    
    func getMatchesList(page:Int){
        // Utility.showProgress()
        print("PAGE::\(page)")
        HomeAPI().getScores(page: page) { response in
            self.scoreResponse = response
            if page > 1 {
                var tempMatches = self.originals ?? []
                tempMatches.append(contentsOf: response.matchList ?? [])
                self.originals = tempMatches
            }
            else{
               
                self.originals?.removeAll()
                self.originals = response.matchList
            }
            self.pageData = response.meta
            self.delegate?.diFinisfFetchMatches()
            print("count::\(self.matches?.count ?? 0)")
        } failed: { msg in
            Utility.showErrorSnackView(message: msg)
        }
        
    }
    
    
    
    func getRecentMatches(date:String){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Utility.dateFormat.ddMMyyyy.rawValue
        let dt = dateFormatter.date(from: date)
        let date = Utility.formatDate(date: dt, with: .yyyyMMdd)
        HomeAPI().getScoresPastFuture(date: date) { response in
            self.matches = response.matchList?.map{MatchList(obj: $0)}
            self.originals = self.matches
            self.delegate?.didFinishFetchRecentMatches()
        } failed: { msg in
            Utility.showErrorSnackView(message: msg)
        }
        
    }
    
    func getMatchDetails(id:Int){
        HomeAPI().getMatchDetails(id: id) { response in
            if let obj = response.matchList?.first{
               // self.updatePins(obj: obj)
                self.updateFootballHilights(obj: obj)
            }
            else{
                AppPreferences.removeFromHilights(id: id)
            }
            self.delegate?.didFinishFetchMatchDetails()
            
        } failed: { _ in
            
        }

    }
    
    // Basketball apis
    func getBasketballScores(){
        HomeAPI().getBasketballScores { response in
            self.originaBasketballMatches = response.matchList
            self.delegate?.didFinishFetchBasketballScores()
            
        } failed: { msg in
            Utility.showErrorSnackView(message: msg)
        }

    }
    
    
    func getBasketballMatchDetails(id:Int){
        HomeAPI().getBasketballMatchDetails(id: id) { response in
            if let obj = response.matchList?.first{
                self.updateBasketballHighlights(obj: obj)
            }
            else{
                AppPreferences.removeBasketballhilight(id: id)
            }
            self.delegate?.didFinishFetchBasketballScoreDetails()
            
        } failed: { _ in
            
        }
        
    }
    
    
    func getBasketballRecentMatches(date:String){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Utility.dateFormat.ddMMyyyy.rawValue
        let dt = dateFormatter.date(from: date)
        let date = Utility.formatDate(date: dt, with: .yyyyMMdd)
        HomeAPI().getBasketballScoresPastFuture(date: date) { response in
            self.originaBasketballMatches = response.matchList
            self.basketballMatches = response.matchList
            self.delegate?.didFinishFetchBasketballRecentMatches()
        } failed: { msg in
            Utility.showErrorSnackView(message: msg)
        }
        
    }
   
}


extension HomeVieModel{
    
    func updateFootballHilights(obj:MatchList){
        AppPreferences.addToHighlights(obj: obj)
        
    }
    
    func updateBasketballHighlights(obj:BasketballMatchList){
        AppPreferences.addToBasketballHighlights(obj: obj)
    }
    
    func updatePins(obj:MatchList){
        let pins = AppPreferences.getPinList()
        if let old = pins.filter({$0.matchId == obj.matchId}).first{
            if old.homeScore != obj.homeScore || old.awayScore != obj.awayScore{
                Utility.scheduleLocalNotificationNow(time: 1, title: "\(obj.homeName ?? "") Vs \(obj.awayName ?? "")", subTitle: "GOAL!!", body: "Scores - \(obj.homeScore ?? 0):\(obj.awayScore ?? 0), C - \(obj.homeCorner ?? ""):\(obj.awayCorner ?? ""), HT - \(obj.homeHalfScore ?? ""):\(obj.awayHalfScore ?? "")", data: ["id" : obj.matchId ?? 0], repeats: false)
            }
        }
//        let index = pins.firstIndex(where: {$0.matchId == obj.matchId})!
//        if pins.count > index{
//            pins[index] = obj
//        }
        AppPreferences.addToPinlist(obj: obj)
    }
    
    func getMatchesByLeague(leagueID:Int){
        self.originals?.removeAll()
        self.matches?.removeAll()
        self.originals = scoreResponse?.todayHotLeagueList?.filter{$0.leagueId == leagueID}
        self.matches = self.originals
        delegate?.didFinishFilterByLeague()
    }
    
    
    func getModelCount(sport:SportsType)->Int{
        if sport == .soccer{
        return matches?.count ?? 0
        }
        else if sport == .basketball{
            return basketballMatches?.count ?? 0
        }
        return 0
    }
    
    func filterMatches(type:Int){
        matches?.removeAll()
        switch type{
        case 0:
            matches = originals
        case 1:
            matches = originals?.filter{!($0.state == 0 || $0.state == -1)}
        case 2:
            matches = originals?.filter{$0.state == 0}
            let page = delegate!.getCurrentPage()
            if matches?.count == 0 && page <= (pageData?.lastPage ?? 0){
                getMatchesList(page: page)
                
            }
        case 3:
            matches = originals?.filter{$0.state == -1}
            let page = delegate!.getCurrentPage()
            if matches?.count == 0 && page <= (pageData?.lastPage ?? 0){
                getMatchesList(page: page)
                
            }
        default:
            break
        }
        
    }
    
    func filterBasketballMatches(type:Int){
        basketballMatches?.removeAll()
        switch type{
        case 0:
            basketballMatches = originaBasketballMatches
        case 1:
            basketballMatches = originaBasketballMatches?.filter{!($0.matchState == 0 || $0.matchState == -1)}
        case 2:
            basketballMatches = originaBasketballMatches?.filter{$0.matchState == 0}
        case 3:
            basketballMatches = originaBasketballMatches?.filter{$0.matchState == -1}
            
        default:
            break
        }
        
    }
    
    
    class func getRecentDates(isPast:Bool,limit:Int) -> [String]{
        let calendar = Calendar.current as NSCalendar
        var dates = [String]()
        if isPast{
            for i in -limit ... -1{
                let dt = calendar.date(byAdding: .day, value: i, to: Date(), options: [])!
                let date = Utility.formatDate(date: dt, with: .ddMMyyyy)
                dates.append(date)
            }
            dates = dates.reversed()
            
        }
        else{
            for i in 1...limit{
                let dt = calendar.date(byAdding: .day, value: i, to: Date(), options: [])!
                let date = Utility.formatDate(date: dt, with: .ddMMyyyy)
                dates.append(date)
            }
            
        }
        
        return dates
        
        
    }
}
