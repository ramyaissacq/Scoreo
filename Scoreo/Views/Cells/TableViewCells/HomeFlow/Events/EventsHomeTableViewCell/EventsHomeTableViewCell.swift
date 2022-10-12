//
//  EventsHomeTableViewCell.swift
//  775775Sports
//
//  Created by Remya on 9/13/22.
//

import UIKit

class EventsHomeTableViewCell: UITableViewCell {
    @IBOutlet weak var lblEvent: UILabel!
    @IBOutlet weak var imgType: UIImageView!
    @IBOutlet weak var lblTime: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(index:Int,obj:Event?){
        var name = ""
        switch Utility.getCurrentLang(){
        case "en":
            name = obj?.nameEn ?? ""
        case "cn":
            name = obj?.nameCn ?? ""
        case "id":
            name = obj?.nameId ?? ""
        case "vi":
            name = obj?.nameVi ?? ""
            //No thai version available
        default:
            name = obj?.nameEn ?? ""
            
            break
        
        }
        lblEvent.text = "\(name) (\(EventsHomeTableViewCell.getType(kind: obj?.kind ?? 0)))"
        lblTime.text = obj?.time
        imgType.image = EventsHomeTableViewCell.getEventSectionImage(index: index)
    }
    
    static func getEventSectionImage(index:Int)->UIImage?{
        switch index{
        case 0:
            return UIImage(named: "goal")
        case 1:
            return UIImage(named: "subsitute")
        case 2:
            return UIImage(named: "whistle")
        default:
            return nil
        }
        
    }
    
    static func getType(kind:Int) -> String{
        switch kind{
        case 1:
            return "Goal".localized
        case 2:
            return "Red card".localized
        case 3:
            return "Yellow card".localized
        case 7:
            return "Penalty kick".localized
        case 8:
            return "Own goals".localized
        case 9:
            return "Two yellow to red".localized
        case 11:
            return "Substitution".localized
        case 13:
            return "Missed Penalty".localized
        default:
            return ""
        }
    }
    
   
    
  
}
