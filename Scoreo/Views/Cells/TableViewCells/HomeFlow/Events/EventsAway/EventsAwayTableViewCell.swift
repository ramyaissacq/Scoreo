//
//  EventsAwayTableViewCell.swift
//  775775Sports
//
//  Created by Remya on 9/13/22.
//

import UIKit

class EventsAwayTableViewCell: UITableViewCell {

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
            
        
        }
        lblEvent.text = "\(name) (\(EventsHomeTableViewCell.getType(kind: obj?.kind ?? 0)))"
        lblTime.text = obj?.time
        imgType.image = EventsHomeTableViewCell.getEventSectionImage(index: index)
    }
    
}
