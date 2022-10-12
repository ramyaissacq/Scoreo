//
//  EventsHeaderTableViewCell.swift
//  775775Sports
//
//  Created by Remya on 9/13/22.
//

import UIKit

class EventsHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgType: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(index:Int,heading:String){
        lblTitle.text = heading
        switch index{
        case 0:
            imgType.image = UIImage(named: "goalGray")
        case 1:
            imgType.image = UIImage(named: "subsitute")
        case 2:
            imgType.image = UIImage(named: "whistle")
        default:
            break
        }
    }
    
}
