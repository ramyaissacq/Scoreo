//
//  ResultCollectionViewCell.swift
//  775775Sports
//
//  Created by Remya on 9/3/22.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var backView:UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(status:String){
        lblTitle.text = status
        backView.backgroundColor = getColor(status: status)
    }
    
    func configureWithBriefing(status:String){
        lblTitle.text = status
        backView.backgroundColor = getBriefingColor(status: status)
    }
    
    func getColor(status:String)->UIColor?{
        switch status{
        case "L":
            return UIColor(named: "red1")
        case "W":
            return UIColor(named: "blue4")
        case "D":
            return UIColor(named: "brown")
        case "TBD":
            return UIColor(named: "green1")
            
        default:
            return UIColor(named: "green1")
        }
    }
    
    func getBriefingColor(status:String)->UIColor?{
        switch status{
        case "L","O":
            return UIColor(named: "green2")
        case "W","U":
            return UIColor(named: "blue10")
        default:
            return UIColor(named: "gray10")
        }
    }

}
