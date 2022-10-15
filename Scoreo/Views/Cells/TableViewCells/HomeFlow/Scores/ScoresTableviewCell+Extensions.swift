//
//  ScoresTableviewCell+Extensions.swift
//  775775Sports
//
//  Created by Remya on 9/21/22.
//

import Foundation
import UIKit

extension ScoresTableViewCell{
    
    class func getStatus(state:Int)->String{
        var value = ""
        switch state{
        case 0:
            value = "SOON".localized
        case 1:
            value = "FH"
        case 2:
            value = "HT"
        case 3:
            value = "SH"
        case 4:
            value = "OT"
        case 5:
            value = "PT"
        case -1:
            value = "FT"
        case -10:
            value = "C"
        case -11:
            value = "TBD"
        case -12:
            value = "CIH"
        case -13:
            value = "INT"
        case -14:
            value = "DEL"
            
        default:
            break
        }
        return value
    }
    
   
    class func getBasketballStatus(state:Int)->String{
        var value = ""
        switch state{
        case 0:
            value = "SOON".localized
        case 1:
            value = "Q1"
        case 2:
            value = "Q2"
        case 3:
            value = "Q3"
        case 4:
            value = "Q4"
        case 5:
            value = "1OT"
        case 6:
            value = "2OT"
        case 7:
            value = "3OT"
        case 50:
            value = "HT"
        case -1:
            value = "FT"
        case -2:
            value = "TBD"
        case -3:
            value = "INT"
        case -4:
            value = "CANCEL".localized
        case -5:
            value = "DELAY".localized
        default:
            break
        }
        return value
        }
    
    class func getMinutesFromTimeInterval(interval: TimeInterval)->Int{
          let time = NSInteger(interval)
          //let seconds = time % 60
          let minutes = (time / 60) % 60
          //let hours = (time / 3600)
          return minutes
        }
    

    
}


extension ScoresTableViewCell:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! GeneralRowTableViewCell
        
        if indexPath.row == 0{
            cell.titleType = .Header(color: Colors.violet1Color())
            cell.backgroundColor = .clear
        }
        else{
            cell.titleType = .Normal
            cell.backgroundColor = .clear
        }
        cell.headerSizes = calculateWidth()
        cell.height = 30
        cell.spacing = 0
        cell.collectionHeight.constant = 30
        if indexPath.row == 0{
        cell.values = quarters
        }
        else if indexPath.row == 1{
            cell.values = homeScores
        }
        else{
            cell.values = awayScores
        }
        return cell
        
    }
    
    func calculateWidth()->[CGFloat]{
        let w = UIScreen.main.bounds.width - 10
        let width = w/CGFloat(quarters.count)
        var sizes = [CGFloat]()
        for _ in 0...quarters.count-1{
            sizes.append(width)
        }
        return sizes
    }
    
    
}


