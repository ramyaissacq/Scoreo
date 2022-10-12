//
//  Odds.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 07, 2022
//
import Foundation
import SwiftyJSON

struct Odds {

	let handicap: [Double]?
	let handicapHalf: [Double]?
	let europeOdds: [Double]?
	let overUnder: [Double]?
	let overUnderHalf: [Double]?

	init(_ json: JSON) {
		handicap = json["handicap"].arrayValue.map { $0.doubleValue }
		handicapHalf = json["handicapHalf"].arrayValue.map { $0.doubleValue }
		europeOdds = json["europeOdds"].arrayValue.map { $0.doubleValue }
		overUnder = json["overUnder"].arrayValue.map { $0.doubleValue }
		overUnderHalf = json["overUnderHalf"].arrayValue.map { $0.doubleValue }
	}
    
    func toDictionary()->[String:Any]{
        var dict = [String:Any]()
        dict["handicap"] = handicap ?? []
        dict["handicapHalf"] = handicapHalf ?? []
        dict["europeOdds"] = europeOdds ?? []
        dict["overUnder"] = overUnder ?? []
        dict["overUnderHalf"] = overUnderHalf ?? []
        return dict
       
    }

}
