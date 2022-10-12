//
//  BasketballAnalysisList.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 24, 2022
//
import Foundation
import SwiftyJSON

struct BasketballAnalysisList {

	let headToHead: [BasketballAnalysisData]?
	let homeLastMatches: [BasketballAnalysisData]?
	let awayLastMatches: [BasketballAnalysisData]?
	let homeSchedule: [BasketballAnalysisData]?
	let awaySchedule: [BasketballAnalysisData]?

	init(_ json: JSON) {
		headToHead = json["headToHead"].arrayValue.map { BasketballAnalysisData($0) }
		homeLastMatches = json["homeLastMatches"].arrayValue.map { BasketballAnalysisData($0) }
		awayLastMatches = json["awayLastMatches"].arrayValue.map { BasketballAnalysisData($0) }
		homeSchedule = json["homeSchedule"].arrayValue.map { BasketballAnalysisData($0) }
		awaySchedule = json["awaySchedule"].arrayValue.map { BasketballAnalysisData($0) }
	}

}
