//
//  NewsAPI.swift
//  775775Sports
//
//  Created by Remya on 9/8/22.
//

import Foundation

class NewsAPI:WebService{
    
    func getNews(page:Int,completion:@escaping (NewsListResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.newsList.rawValue + "/\(Utility.getCurrentLang())/\(page)"
        get(url: url, params: [:], completion: { json in
            let response = NewsListResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getVideos(page:Int,completion:@escaping (VideoListResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.videoList.rawValue + "/\(Utility.getCurrentLang())/\(page)"
        get(url: url, params: [:], completion: { json in
            let response = VideoListResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getNewsDetails(id:Int,completion:@escaping (NewsDetails) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl() + EndPoints.newsDetails.rawValue + "/\(Utility.getCurrentLang())/\(id)"
        get(url: url, params: [:], completion: { json in
            let response = NewsDetails(json!)
            completion(response)
        }, failed: failed)
    }
    
    
}
