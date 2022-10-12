//
//  BasketballAnalysisResponse.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 24, 2022
//
import Foundation
import SwiftyJSON

struct BasketballAnalysisResponse {

	let list: [BasketballAnalysisList]?

	init(_ json: JSON) {
		list = json["list"].arrayValue.map { BasketballAnalysisList($0) }
	}

}
