//
//  List.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 08, 2022
//
import Foundation
import SwiftyJSON

struct VideoList {

	let id: Int?
	let cfHlsUrl: String?
	let video: String?
	let createTime: String?
	let thumbnailPath: String?
	let title: String?
	let path: String?

	init(_ json: JSON) {
		id = json["id"].intValue
		cfHlsUrl = json["cf_hls_url"].stringValue
		video = json["video"].stringValue
		createTime = json["create_time"].stringValue
		thumbnailPath = json["thumbnail_path"].stringValue
		title = json["title"].stringValue
		path = json["path"].stringValue
	}

}
