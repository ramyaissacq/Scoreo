//
//  List.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 12, 2022
//
import Foundation
import SwiftyJSON

struct ScoreAnalysis {

	let headToHead: [[String]]?
	let homeLastMatches: [[String]]?
	let awayLastMatches: [[String]]?
	let homeSchedule: [[String]]?
	let awaySchedule: [[String]]?
	var homeOdds: [[String]]?
	var awayOdds: [[String]]?
	let homeGoals: [[String]]?
	let awayGoals: [[String]]?
	let homeHT:[[String]]?
	let awayHT: [[String]]?
	let homeShootTime: [[String]]?
	let awayShootTime: [[String]]?

	init(_ json: JSON) {
        headToHead = json["headToHead"].arrayValue.map { $0.arrayValue.map{$0.stringValue} }
        homeLastMatches = json["homeLastMatches"].arrayValue.map { $0.arrayValue.map{$0.stringValue}}
        awayLastMatches = json["awayLastMatches"].arrayValue.map { $0.arrayValue.map{$0.stringValue}}
        homeSchedule = json["homeSchedule"].arrayValue.map { $0.arrayValue.map{$0.stringValue}}
        awaySchedule = json["awaySchedule"].arrayValue.map { $0.arrayValue.map{$0.stringValue}}
        homeOdds = json["homeOdds"].arrayValue.map { $0.arrayValue.map{$0.stringValue}}
        awayOdds = json["awayOdds"].arrayValue.map { $0.arrayValue.map{$0.stringValue}}
        homeGoals = json["homeGoals"].arrayValue.map { $0.arrayValue.map{$0.stringValue}}
        awayGoals = json["awayGoals"].arrayValue.map { $0.arrayValue.map{$0.stringValue}}
        homeHT = json["homeHT"].arrayValue.map { $0.arrayValue.map{$0.stringValue}}
        awayHT = json["awayHT"].arrayValue.map { $0.arrayValue.map{$0.stringValue}}
        homeShootTime = json["homeShootTime"].arrayValue.map { $0.arrayValue.map{$0.stringValue}}
        awayShootTime = json["awayShootTime"].arrayValue.map { $0.arrayValue.map{$0.stringValue}}
	}

}
