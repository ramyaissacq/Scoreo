//
//  List.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 08, 2022
//
import Foundation
import SwiftyJSON

struct NewsList {

	let id: Int?
	let adminId: Int?
	let category: Int?
	let cover: Int?
	let browse: Int?
	let sort: Int?
	let status: Int?
	let translate: Int?
	let createTime: String?
	let updateTime: String?
	let title: String?
	let description: String?
	let keywords: String?
	let path: String?

	init(_ json: JSON) {
		id = json["id"].intValue
		adminId = json["admin_id"].intValue
		category = json["category"].intValue
		cover = json["cover"].intValue
		browse = json["browse"].intValue
		sort = json["sort"].intValue
		status = json["status"].intValue
		translate = json["translate"].intValue
		createTime = json["create_time"].stringValue
		updateTime = json["update_time"].stringValue
		title = json["title"].stringValue
		description = json["description"].stringValue
		keywords = json["keywords"].stringValue
		path = json["path"].stringValue
	}

}
