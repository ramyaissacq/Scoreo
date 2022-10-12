//
//  FootballLeague.swift
//  775775Sports
//
//  Created by Remya on 9/9/22.
//

import Foundation

class FootballLeague{
    let id:Int?
    let name:String?
        init(id:Int,name:String){
            self.id = id
            self.name = name
        }
        static var leagues:[FootballLeague]?

        static func populateFootballLeagues(){
            if leagues?.count ?? 0 == 0{
            let ids = [36,31,34,8,11,60,192,648,652,650,75,67,88,224]
                let names = ["Premier League".localized, "La Liga".localized, "Serie A".localized,"Bundesliga".localized, "Ligue 1".localized, "Chinese Super League".localized, "AFC Champions League".localized, "Asian Qualifiers".localized, "South American Qualifier".localized, "European Qualifier".localized, "World Cup".localized, "European Cup".localized, "Confederations Cup".localized, "America's Cup".localized]
            var leagues = [FootballLeague]()
            for i in 0 ... ids.count - 1{
                let obj = FootballLeague(id: ids[i], name: names[i])
                leagues.append(obj)
            }
            FootballLeague.leagues = leagues
            }
        }
        
       
    
}
