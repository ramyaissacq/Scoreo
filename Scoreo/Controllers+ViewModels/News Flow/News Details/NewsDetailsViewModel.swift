//
//  NewsDetailsViewModel.swift
//  775775Sports
//
//  Created by Remya on 9/8/22.
//

import Foundation

protocol NewsDetailsViewModelDelegates{
  func didFinishFetch()
}

class NewsDetailsViewModel{
    var delegate:NewsDetailsViewModelDelegates?
    var newsDetails:NewsDetails?
    
     func getNewsDetails(newsID:Int){
        Utility.showProgress()
        NewsAPI().getNewsDetails(id: newsID) { response in
            self.newsDetails = response
            self.delegate?.didFinishFetch()
            
        } failed: { msg in
            Utility.showErrorSnackView(message: msg)
        }

        
    }
}
