//
//  BasketOdds.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 21, 2022
//
import Foundation
import SwiftyJSON

struct BasketOdds {

	let spread: [Double]?
	let spreadHalf: [Double]?
	let spreadPart: [Double]?
	let moneyLine: [Double]?
	let moneyLineAverage: MoneyLineAverage?
	let total: [Double]?
	let totalHalf: [Double]?
	let totalPart: [Double]?

	init(_ json: JSON) {
		spread = json["spread"].arrayValue.map { $0.doubleValue }
        spreadHalf = json["spreadHalf"].arrayValue.map { $0.doubleValue }
        spreadPart = json["spreadPart"].arrayValue.map { $0.doubleValue }
        moneyLine = json["moneyLine"].arrayValue.map { $0.doubleValue }
        moneyLineAverage = MoneyLineAverage(json["moneyLineAverage"])
        total = json["total"].arrayValue.map { $0.doubleValue }
        totalHalf = json["totalHalf"].arrayValue.map { $0.doubleValue }
        totalPart = json["totalPart"].arrayValue.map { $0.doubleValue }
	}
    
    func toDictionary()->[String:Any]{
        var dict = [String:Any]()
        dict["spread"] = spread
        dict["spreadHalf"] = spreadHalf
        dict["spreadPart"] = spreadPart
        dict["moneyLine"] = moneyLine
        dict["moneyLineAverage"] = moneyLineAverage?.toDictionary()
        dict["total"] = total
        dict["totalHalf"] = totalHalf
        dict["totalPart"] = totalPart
        return dict
        
        
    }

}
