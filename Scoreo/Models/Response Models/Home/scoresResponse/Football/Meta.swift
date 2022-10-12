//
//  Meta.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 07, 2022
//
import Foundation
import SwiftyJSON

struct Meta {

	let currentPage: Int?
	let lastPage: Int?
	let perPage: Int?
	let total: Int?

	init(_ json: JSON) {
		currentPage = json["currentPage"].intValue
		lastPage = json["lastPage"].intValue
		perPage = json["perPage"].intValue
		total = json["total"].intValue
	}

}