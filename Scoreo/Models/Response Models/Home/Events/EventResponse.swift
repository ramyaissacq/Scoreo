//
//  EventResponse.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 13, 2022
//
import Foundation
import SwiftyJSON

struct EventResponse {

	let eventList: [EventList]?
	let technic: [Technic]?

	init(_ json: JSON) {
		eventList = json["eventList"].arrayValue.map { EventList($0) }
		technic = json["technic"].arrayValue.map { Technic($0) }
	}

}
