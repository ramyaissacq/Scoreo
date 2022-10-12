//
//  BasketballIndexList.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 23, 2022
//
import Foundation
import SwiftyJSON

struct BasketballIndexList {

	let match: [BasketballMatchList]?
	let spread: [[Double]]?
	let moneyLine: [[Double]]?
	let total: [[Double]]?

	init(_ json: JSON) {
		match = json["match"].arrayValue.map { BasketballMatchList($0) }
        spread = json["spread"].arrayValue.map { $0.arrayValue.map{$0.doubleValue} }
        moneyLine = json["moneyLine"].arrayValue.map { $0.arrayValue.map{$0.doubleValue} }
        total = json["total"].arrayValue.map { $0.arrayValue.map{$0.doubleValue} }
	}

}
