//
//  IndexViewModel.swift
//  775775Sports
//
//  Created by Remya on 9/8/22.
//

import Foundation

protocol IndexViewModelDelgate{
    func didFinishFetch()
    func didFinishBasketIndexFetch()
}

class IndexViewModel{
    var delegate:IndexViewModelDelgate?
    var scores:[List]?
    var currentScores = [ScoreIndexModel]()
    var basketBallCurrent = [[String]]()
    
    //basketball variables
    var basketballScores:BasketballIndexList?
    
    func getIndexData(){
        //Utility.showProgress()
        HomeAPI().getScoresByIndex { response in
            self.scores = response.list
            self.delegate?.didFinishFetch()
        } failed: { msg in
           // Utility.showErrorSnackView(message: msg)
        }

    }
    
    
    func getBasketballIndexData(){
        HomeAPI().getBasketballScoresByIndex { response in
            self.basketballScores = response.List?.first
            self.delegate?.didFinishBasketIndexFetch()
            
        } failed: { _ in
            
        }

    }
    
    func filterData(index:Int){
        currentScores.removeAll()
        let matchID:Double = Double(HomeCategoryViewController.matchID ?? 0)
        switch index{
        case 0:
            var filteredHandicaps = [[Double]]()
            filteredHandicaps = scores?.first?.handicap?.filter{$0.first == matchID} ?? []
            for m in filteredHandicaps{
                if m.count > 7{
                let obj = ScoreIndexModel(companyID: Int(m[1]), home1: String(m[6]), liveHp1: String(m[5]), away1: String(m[7]), home2: String(m[3]), liveHp2: String(m[2]), away2: String(m[4]))
                currentScores.append(obj)
                }
            }
        case 1:
            var filteredEuroOdds = [[Double]]()
            filteredEuroOdds = scores?.first?.europeOdds?.filter{$0.first == matchID} ?? []
            for m in filteredEuroOdds{
                if m.count > 7{
                let obj = ScoreIndexModel(companyID: Int(m[1]), home1: String(m[5]), liveHp1: String(m[6]), away1: String(m[7]), home2: String(m[4]), liveHp2: String(m[3]), away2: String(m[4]))
                currentScores.append(obj)
                }
            }
        case 2:
            var filteredOverUnder = [[Double]]()
            filteredOverUnder = scores?.first?.overUnder?.filter{$0.first == matchID} ?? []
            for m in filteredOverUnder{
                if m.count > 7{
                let obj = ScoreIndexModel(companyID: Int(m[1]), home1: String(m[6]), liveHp1:String(m[5]), away1:String( m[7]), home2: String(m[3]), liveHp2: String(m[2]), away2:String( m[4]))
                currentScores.append(obj)
                }
            }
        case 3:
            var filteredHandiHalf = [[Double]]()
            filteredHandiHalf = scores?.first?.handicapHalf?.filter{$0.first == matchID} ?? []
            for m in filteredHandiHalf{
                if m.count > 7{
                let obj = ScoreIndexModel(companyID: Int(m[1]), home1: String(m[6]), liveHp1: String(m[5]), away1: String(m[7]), home2: String(m[3]), liveHp2: String(m[2]), away2: String(m[4]))
                currentScores.append(obj)
                }
            }

        case 4:
            var filteredOverUnderHalf = [[Double]]()
            filteredOverUnderHalf = scores?.first?.overUnderHalf?.filter{$0.first == matchID} ?? []
            for m in filteredOverUnderHalf{
                if m.count > 7{
                let obj = ScoreIndexModel(companyID: Int(m[1]), home1: String(m[6]), liveHp1: String(m[5]), away1: String(m[7]), home2: String(m[3]), liveHp2: String(m[2]), away2: String(m[4]))
                currentScores.append(obj)
                }
            }
        default:
            break
        }
    }
    
    func filterBasketballScores(index:Int){
        basketBallCurrent.removeAll()
        let matchID:Double = Double(HomeCategoryViewController.matchID ?? 0)
        switch index{
        case 0:
            let spread:[[Double]] = basketballScores?.spread?.filter{$0.first == matchID} ?? []
            for m in spread{
                if m.count > 10{
                    let company = FootballCompany.getCompanyName(id: Int(m[1]))
                    let arr1 = [company,String(m[9]),String(m[8]),String(m[10]),String(m[6]),String(m[5]),String(m[7]),String(m[3]),String(m[2]),String(m[4])]
                    basketBallCurrent.append(arr1)
                    
                }
            }
            
        case 1:
            let total:[[Double]] = basketballScores?.total?.filter{$0.first == matchID} ?? []
            for m in total{
                if m.count > 10{
                    let company = FootballCompany.getCompanyName(id: Int(m[1]))
                    let arr1 = [company,String(m[9]),String(m[8]),String(m[10]),String(m[6]),String(m[5]),String(m[7]),String(m[3]),String(m[2]),String(m[4])]
                    basketBallCurrent.append(arr1)
                    
                }
            }
            
        default:
            break
        }
        
    }
    
    
}
