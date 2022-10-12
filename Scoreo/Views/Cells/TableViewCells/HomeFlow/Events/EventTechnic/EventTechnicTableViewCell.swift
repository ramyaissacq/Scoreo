//
//  EventTechnicTableViewCell.swift
//  775775Sports
//
//  Created by Remya on 9/13/22.
//

import UIKit

class EventTechnicTableViewCell: UITableViewCell {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAwayCount: UILabel!
    @IBOutlet weak var lblHomeCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(obj:EventTechnic?){
        lblName.text = EventTechnicTableViewCell.getTechnicName(index: obj?.id ?? 0)
        if obj?.type == .percent{
        lblHomeCount.text = "\(obj?.homeCount ?? 0) %"
        lblAwayCount.text = "\(obj?.awayCount ?? 0) %"
        }
        else{
            lblHomeCount.text = "\(obj?.homeCount ?? 0)"
            lblAwayCount.text = "\(obj?.awayCount ?? 0)"
        }
        let tot = (obj?.homeCount ?? 0) + (obj?.awayCount ?? 0)
        let per:Float = Float(obj?.homeCount ?? 0) / Float(tot)
        progressView.progress = per
        
    }
    
    static func getTechnicName(index:Int)->String{
        switch index{
        case 1:
            return "Tee off First".localized
        case 2:
            return "First Corner Kick".localized
        case 3:
            return "First Yellow Card".localized
        case 4:
            return "Number of Shots".localized
        case 5:
            return "Number of Shots on target".localized
        case 6:
            return "Number of Fouls".localized
        case 7:
            return "Number of Corners".localized
        case 8:
            return "Number of Corners (Overtime)".localized
        case 9:
            return "Free Kicks".localized
        case 10:
            return "Number of Offsides".localized
        case 11:
            return  "Own Goals".localized
        case 12:
            return "Yellow Cards".localized
        case 13:
            return "Yellow Cards (Overtime)".localized
        case 14:
            return  "Red Cards".localized
        case 15:
            return  "Ball Control".localized
        case 16:
            return  "Header".localized
        case 17:
            return  "Save the Ball".localized
        case 18:
            return  "Goalkeeper Strikes".localized
        case 19:
            return  "Lose the Ball".localized
        case 20:
            return "Successful Steal".localized
        case 21:
            return  "Block".localized
        case 22:
            return  "Long Pass".localized
        case 23:
            return  "Short Pass".localized
        case 24:
            return  "Assist".localized
        case 25:
            return  "Successful Pass".localized
        case 26:
            return  "First Substitution".localized
        case 27:
            return  "Last Substitution".localized
        case 28:
            return  "First Offside".localized
        case 29:
            return  "Last Offside".localized
        case 30:
            return  "Change the number of players".localized
        case 31:
            return   "Last Corner Kick".localized
        case 32:
            return  "Last Yellow Card".localized
        case 33:
            return "Change The number of players (Overtime)".localized
        case 34:
            return  "Number of Offsides (Overtime)".localized
        case 35:
            return  "Missing a Goal".localized
        case 36:
            return  "Middle Column".localized
        case 37:
            return  "Number of Successful headers".localized
        case 38:
            return  "Blocked Shots".localized
        case 39:
            return   "Tackles".localized
        case 40:
            return  "Exceeding Times".localized
        case 41:
            return  "Out-of-Bounds".localized
        case 42:
            return  "Number of Passes".localized
        case 43:
            return  "Pass Success Rate".localized
        case 44:
            return  "Number of Attacks".localized
        case 45:
            return  "Number of Dangerous Attacks".localized
        case 46:
            return  "Half-Time Corner Kick".localized
        case 47:
            return  "Half Court Possession".localized
            
        default:
            return ""
        }
    }
    
}
