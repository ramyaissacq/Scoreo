//
//  LeagueStandingResponse.swift
//  Jet Score
//
//  Created by Remya on 9/27/22.
//

import Foundation
import SwiftyJSON

struct LeagueStandingResponse {

    let leagueData01: [LeagueData01]?
    let leagueData02: [LeagueData02]?
    let leagueData04: [LeagueData04]?
    let leagueStanding: LeagueStanding?

    init(_ json: JSON) {
        leagueData01 = json["leagueData01"].arrayValue.map { LeagueData01($0) }
        leagueData02 = json["leagueData02"].arrayValue.map { LeagueData02($0) }
        leagueData04 = json["leagueData04"].arrayValue.map { LeagueData04($0) }
        leagueStanding = LeagueStanding(json["leagueStanding"])
       // leagueStanding = json["leagueStanding"].arrayValue.map { LeagueStandingNew($0) }
    }

}
