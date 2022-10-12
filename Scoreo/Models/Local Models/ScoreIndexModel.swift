//
//  ScoreIndexModel.swift
//  775775Sports
//
//  Created by Remya on 9/8/22.
//

import Foundation

struct ScoreIndexModel{
    let companyID:Int?
    let home1:String?
    let liveHp1:String?
    let away1:String?
    let home2:String?
    let liveHp2:String?
    let away2:String?
    
    
    init(companyID:Int?,home1:String?,liveHp1:String?,away1:String?,home2:String?,liveHp2:String?,away2:String?){
        self.companyID = companyID
        self.home1 = home1
        self.liveHp1 = liveHp1
        self.away1 = away1
        self.home2 = home2
        self.liveHp2 = liveHp2
        self.away2 = away2
    }
    
    func getArrayValue()->[String]{
        var arr = [String]()
        let company = FootballCompany.getCompanyName(id: companyID ?? 0)
        arr.append(company)
        arr.append(home1 ?? "")
        arr.append(liveHp1 ?? "")
        arr.append(away1 ?? "")
        arr.append(home2 ?? "")
        arr.append(liveHp2 ?? "")
        arr.append(away2 ?? "")
        return arr
    }
    
    
}
