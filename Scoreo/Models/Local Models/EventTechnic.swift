//
//  EventTechnic.swift
//  775775Sports
//
//  Created by Remya on 9/13/22.
//

import Foundation

enum EvenTechnicType{
    case normal
    case percent
}

class EventTechnic{
    var id:Int?
    var homeCount:Int?
    var awayCount:Int?
    var type:EvenTechnicType?
    init(id:Int,homeCount:Int,awayCount:Int,type:EvenTechnicType){
        self.id = id
        self.homeCount = homeCount
        self.awayCount = awayCount
        self.type = type
    }
}
