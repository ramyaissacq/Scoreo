//
//  EventList.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 13, 2022
//
import Foundation
import SwiftyJSON

struct EventList {

	let matchId: Int?
	let event: [Event]?

	init(_ json: JSON) {
		matchId = json["matchId"].intValue
		event = json["event"].arrayValue.map { Event($0) }
	}

}