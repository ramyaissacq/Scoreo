//
//  VideoListResponse.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 08, 2022
//
import Foundation
import SwiftyJSON

struct VideoListResponse {

	let list: [VideoList]?
	let meta: Meta?

	init(_ json: JSON) {
		list = json["list"].arrayValue.map { VideoList($0) }
		meta = Meta(json["meta"])
	}

}
