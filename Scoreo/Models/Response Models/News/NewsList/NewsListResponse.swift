//
//  NewsListResponse.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on September 08, 2022
//
import Foundation
import SwiftyJSON

struct NewsListResponse {

	let list: [NewsList]?
	let meta: Meta?

	init(_ json: JSON) {
		list = json["list"].arrayValue.map { NewsList($0) }
		meta = Meta(json["meta"])
	}

}
