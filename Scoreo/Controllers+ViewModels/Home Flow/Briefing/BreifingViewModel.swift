//
//  BreifingViewModel.swift
//  775775Sports
//
//  Created by Remya on 9/14/22.
//

import Foundation

protocol BreifingViewModelDelegate{
    func didFinishFetch()
    func didFinishFetchBriefing()
}

class BreifingViewModel{
    var delegate:BreifingViewModelDelegate?
    var briefingData:BreiefingResponse?
    var basketballBriefing:BasketballBriefingDetails?
    var home1 = [String]()
    var home2 = [String]()
    var home3 = [String]()
    var away1 = [String]()
    var away2 = [String]()
    var away3 = [String]()
    
    
    func getBriefingDetails(){
       // Utility.showProgress()
        HomeAPI().getBriefing(id: HomeCategoryViewController.matchID!) { response in
            self.briefingData = response
            self.delegate?.didFinishFetch()
        } failed: { msg in
            //Utility.showErrorSnackView(message: msg)
        }

    }
    
    
    func getBasketballBriefing(){
        HomeAPI().getBasketballBriefing(id: HomeCategoryViewController.matchID!) { response in
            self.basketballBriefing = response
            self.home1 = response.homeRecentFive?.map{String($0)} ?? []
            self.home2 = response.homeRecentFiveSpread?.map{String($0)} ?? []
            self.home3 = response.homeRecentFiveTotal?.map{String($0)} ?? []
            
            self.away1 = response.awayRecentFive?.map{String($0)} ?? []
            self.away2 = response.awayRecentFiveSpread?.map{String($0)} ?? []
            self.away3 = response.awayRecentFiveTotal?.map{String($0)} ?? []
            
            self.delegate?.didFinishFetchBriefing()
            
        } failed: { _ in
            
        }

    }
    
}
