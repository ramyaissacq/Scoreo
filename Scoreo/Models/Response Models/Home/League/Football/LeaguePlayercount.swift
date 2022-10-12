//
//  LeaguePlayercount.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 15, 2022
//
import Foundation
import SwiftyJSON

struct LeaguePlayercount {

	let list: Any?

	init(_ json: JSON) {
		list = json["list"]
	}

}