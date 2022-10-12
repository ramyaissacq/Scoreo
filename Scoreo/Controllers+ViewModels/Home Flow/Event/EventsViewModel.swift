//
//  EventsViewModel.swift
//  775775Sports
//
//  Created by Remya on 9/13/22.
//

import Foundation

protocol EventsViewModelDelegate{
    func didFinishEventsFetch()
}

class EventsViewModel{
    var delegate:EventsViewModelDelegate?
    var eventData:EventResponse?
    var goalsArray:[Event]?
    var substitutionsArray:[Event]?
    var foulsArray:[Event]?
    var technic:Technic?
    var goalsKind = [1,7,8,13]
    var foulsKind = [2,3,9]
    var technicArray:[EventTechnic]?
    
    func getEvents(){
       // Utility.showProgress()
        HomeAPI().getEvents { response in
            self.eventData = response
            self.filterData()
            self.delegate?.didFinishEventsFetch()
            
        } failed: { msg in
           // Utility.showErrorSnackView(message: msg)
        }

    }
    
    func filterData(){
        let filteredArray:[Event] = eventData?.eventList?.filter{$0.matchId == HomeCategoryViewController.matchID!}.first?.event ?? []
        goalsArray = filteredArray.filter{goalsKind.contains($0.kind ?? 0)}
        substitutionsArray = filteredArray.filter{$0.kind == 11}
        foulsArray = filteredArray.filter{foulsKind.contains($0.kind ?? 0)}
        technic = eventData?.technic?.filter{$0.matchId == HomeCategoryViewController.matchID!}.first
        
        //populating technic array
        let tStr = technic?.technicCount ?? ""
        let arr = tStr.components(separatedBy: ";")
        var tempTechnic = [EventTechnic]()
        for m in arr{
            var tcArr = m.components(separatedBy: ",")
            if tcArr.count >= 3{
                var type = EvenTechnicType.normal
                
                let id = Int(tcArr[0]) ?? 0
                if tcArr[1].contains("%"){
                    tcArr[1] = tcArr[1].replacingOccurrences(of: "%", with: "")
                    tcArr[2] = tcArr[2].replacingOccurrences(of: "%", with: "")
                    type = .percent
                }
                
               let home = Int(tcArr[1]) ?? 0
               let away = Int(tcArr[2]) ?? 0
                
                let obj = EventTechnic(id: id, homeCount: home, awayCount: away, type: type)
                tempTechnic.append(obj)
            }
        }
        
        technicArray = tempTechnic
        
    }
}
