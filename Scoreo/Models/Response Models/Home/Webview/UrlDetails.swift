//
//  RootClass.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on October 11, 2022
//
import Foundation
import SwiftyJSON

struct UrlDetails {

	let status: Int?
	let message: String?
	let version: String?
	let buildNumber: String?
	let whatsNew: String?
	let lastUpdated: String?
	let map: String?
	let data: UrlData?
	let packageName: String?
	let promptFrequency: String?
	let promptTitle: String?
	let promptMessage: String?
    var key = ""
    var url = ""

	init(_ json: JSON) {
		status = json["status"].intValue
		message = json["message"].stringValue
		version = json["version"].stringValue
		buildNumber = json["build_number"].stringValue
		whatsNew = json["whats_new"].stringValue
		lastUpdated = json["last_updated"].stringValue
		map = json["map"].stringValue
		data = UrlData(json["data"])
		packageName = json["package_name"].stringValue
		promptFrequency = json["prompt_frequency"].stringValue
		promptTitle = json["prompt_title"].stringValue
		promptMessage = json["prompt_message"].stringValue
        let strArr = map?.components(separatedBy: "=>")
        key = strArr?.first ?? ""
        url = strArr?.last?.components(separatedBy: ";").first ?? ""
	}

}
