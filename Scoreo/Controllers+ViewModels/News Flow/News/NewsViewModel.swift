//
//  NewsViewModel.swift
//  775775Sports
//
//  Created by Remya on 9/8/22.
//

import Foundation

protocol NewsViewModelDelegates{
    func didFinishFetchNews()
    func didFinishFetchVideos()
}

class NewsViewModel{
    var delegate:NewsViewModelDelegates?
    var newsList:[NewsList]?
    var videoList:[VideoList]?
    var newsPageData:Meta?
    var videoPageData:Meta?
    var originalNewsList:[NewsList]?
    var originalVideoList:[VideoList]?
    func getNews(page:Int){
        //Utility.showProgress()
        NewsAPI().getNews(page: page) { response in
            self.newsPageData = response.meta
            if page == 1{
            self.newsList = response.list
                self.originalNewsList = response.list
            }
            else{
                var tempList:[NewsList] = self.originalNewsList ?? []
                tempList.append(contentsOf: response.list ?? [])
                self.originalNewsList = tempList
            }
            self.delegate?.didFinishFetchNews()
            
        } failed: { msg in
            Utility.showErrorSnackView(message: msg)
        }

        
    }
    
    func getVideos(page:Int){
       // Utility.showProgress()
        NewsAPI().getVideos(page: page) { response in
            self.videoPageData = response.meta
            if page == 1{
                self.videoList = response.list
                self.originalVideoList = response.list
            }
            else{
                var tmpList:[VideoList] = self.originalVideoList ?? []
                tmpList.append(contentsOf: response.list ?? [])
                self.originalVideoList = tmpList
            }
            self.delegate?.didFinishFetchVideos()
        } failed: { msg in
            Utility.showErrorSnackView(message: msg)
        }

        
    }
    
}
