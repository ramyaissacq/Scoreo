//
//  MoneyLineAverage.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 21, 2022
//
import Foundation
import SwiftyJSON

struct MoneyLineAverage {

	let matchId: Int?
	let companyId: String?
	let homeTeamEn: String?
	let homeTeamChs: String?
	let homeTeamCht: String?
	let awayTeamEn: String?
	let awayTeamChs: String?
	let awayTeamCht: String?
	let initHomeWinRate: Double?
	let initAwayWinRate: Double?
	let liveHomeWinRate: Double?
	let liveAwayWinRate: Double?
	let changeTime: String?
	let totalCompany: Int?

	init(_ json: JSON) {
		matchId = json["matchId"].intValue
		companyId = json["companyId"].stringValue
		homeTeamEn = json["homeTeamEn"].stringValue
		homeTeamChs = json["homeTeamChs"].stringValue
		homeTeamCht = json["homeTeamCht"].stringValue
		awayTeamEn = json["awayTeamEn"].stringValue
		awayTeamChs = json["awayTeamChs"].stringValue
		awayTeamCht = json["awayTeamCht"].stringValue
		initHomeWinRate = json["initHomeWinRate"].doubleValue
		initAwayWinRate = json["initAwayWinRate"].doubleValue
		liveHomeWinRate = json["liveHomeWinRate"].doubleValue
		liveAwayWinRate = json["liveAwayWinRate"].doubleValue
		changeTime = json["changeTime"].stringValue
		totalCompany = json["totalCompany"].intValue
	}
    
    func toDictionary()->[String:Any]{
        var dict = [String:Any]()
        dict["matchId"] = matchId ?? 0
        dict["companyId"] = companyId ?? ""
        dict["homeTeamEn"] = homeTeamEn ?? ""
        dict["homeTeamChs"] = homeTeamChs ?? ""
        dict["homeTeamCht"] = homeTeamCht ?? ""
        dict["awayTeamEn"] = awayTeamEn ?? ""
        dict["awayTeamChs"] = awayTeamChs ?? ""
        dict["awayTeamCht"] = awayTeamCht ?? ""
        dict["initHomeWinRate"] = initHomeWinRate ?? 0
        dict["initAwayWinRate"] = initAwayWinRate ?? 0
        dict["liveHomeWinRate"] = liveHomeWinRate ?? 0
        dict["liveAwayWinRate"] = liveAwayWinRate ?? 0
        dict["changeTime"] = changeTime ?? ""
        dict["totalCompany"] = totalCompany ?? 0
        return dict
    }

}
