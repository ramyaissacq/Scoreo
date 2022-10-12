//
//  RootClass.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 12, 2022
//
import Foundation
import SwiftyJSON

struct ScoreAnalysisResponse {

	let list: [ScoreAnalysis]?

	init(_ json: JSON) {
		list = json["list"].arrayValue.map { ScoreAnalysis($0) }
	}

}
