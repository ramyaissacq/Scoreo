//
//  FoodballCompany.swift
//  775775Sports
//
//  Created by Remya on 9/8/22.
//

import Foundation

struct FootballCompany{
let id:Int?
let name:String?
    init(id:Int,name:String){
        self.id = id
        self.name = name
    }
    static var companies:[FootballCompany]?

    static func populateFootballCompanies(){
        let ids = [1,3,4,7,8,9,12,14,17,19,22,23,24,31,35,42,45,47,48]
        let names = ["Macauslot".localized,"Crown".localized,"Ladbrokes".localized,"SNAI".localized,"Bet365".localized,"William Hill".localized,"Easybets".localized,"Vcbet".localized,"Mansion88".localized,"Interwetten".localized,"10BET".localized,"188Bet".localized,"12bet".localized,"SBOBET".localized,"Wewbet".localized,"18bet".localized,"ManbetX".localized,"Pinnacle".localized,"HK Jockey Club".localized]
        var companies = [FootballCompany]()
        for i in 0 ... ids.count - 1{
            let obj = FootballCompany(id: ids[i], name: names[i])
            companies.append(obj)
        }
        FootballCompany.companies = companies
    }
    
    static func getCompanyName(id:Int)->String{
       return companies?.filter{$0.id == id}.first?.name ?? "Company".localized
        
    }
    
}
