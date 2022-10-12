//
//  RootClass.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 24, 2022
//
import Foundation
import SwiftyJSON

struct BasketballBriefingDetails {

	let matchId: Int?
	let homeRecentFive: String?
	let homeRecentFiveSpread: String?
	let homeRecentFiveTotal: String?
	let awayRecentFive: String?
	let awayRecentFiveSpread: String?
	let awayRecentFiveTotal: String?
	let analyseCn: String?
	let injuryCn: String?
	let confidenceCn: String?
	let headToHeadCn: String?
	let explainCn: String?
	let analyseEn: String?
	let injuryEn: String?
	let confidenceEn: String?
	let headToHeadEn: String?
	let explainEn: String?
	let analyseId: String?
	let injuryId: String?
	let confidenceId: String?
	let headToHeadId: String?
	let explainId: String?
	let analyseVi: String?
	let injuryVi: String?
	let confidenceVi: String?
	let headToHeadVi: String?
	let explainVi: String?
	let analyseTh: String?
	let injuryTh: String?
	let confidenceTh: String?
	let headToHeadTh: String?
	let explainTh: String?

	init(_ json: JSON) {
		matchId = json["matchId"].intValue
		homeRecentFive = json["homeRecentFive"].stringValue
		homeRecentFiveSpread = json["homeRecentFiveSpread"].stringValue
		homeRecentFiveTotal = json["homeRecentFiveTotal"].stringValue
		awayRecentFive = json["awayRecentFive"].stringValue
		awayRecentFiveSpread = json["awayRecentFiveSpread"].stringValue
		awayRecentFiveTotal = json["awayRecentFiveTotal"].stringValue
		analyseCn = json["analyseCn"].stringValue
		injuryCn = json["injuryCn"].stringValue
		confidenceCn = json["confidenceCn"].stringValue
		headToHeadCn = json["headToHeadCn"].stringValue
		explainCn = json["explainCn"].stringValue
		analyseEn = json["analyseEn"].stringValue
		injuryEn = json["injuryEn"].stringValue
		confidenceEn = json["confidenceEn"].stringValue
		headToHeadEn = json["headToHeadEn"].stringValue
		explainEn = json["explainEn"].stringValue
		analyseId = json["analyseId"].stringValue
		injuryId = json["injuryId"].stringValue
		confidenceId = json["confidenceId"].stringValue
		headToHeadId = json["headToHeadId"].stringValue
		explainId = json["explainId"].stringValue
		analyseVi = json["analyseVi"].stringValue
		injuryVi = json["injuryVi"].stringValue
		confidenceVi = json["confidenceVi"].stringValue
		headToHeadVi = json["headToHeadVi"].stringValue
		explainVi = json["explainVi"].stringValue
		analyseTh = json["analyseTh"].stringValue
		injuryTh = json["injuryTh"].stringValue
		confidenceTh = json["confidenceTh"].stringValue
		headToHeadTh = json["headToHeadTh"].stringValue
		explainTh = json["explainTh"].stringValue
	}

}
