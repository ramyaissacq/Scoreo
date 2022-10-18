//
//  LanguageTableViewCell.swift
//  Core Score
//
//  Created by Remya on 9/29/22.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {

    @IBOutlet weak var imgSelection: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var lblLanguage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        handleSelection()

        // Configure the view for the selected state
    }
    
    
    
    func handleSelection(){
        if isSelected{
            imgSelection.image = UIImage(named: "selectedRound")
        }
        else{
            imgSelection.image = UIImage(named: "deselectedRound")
        }
    }
    
}
