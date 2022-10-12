//
//  LanguageTableViewCell.swift
//  Core Score
//
//  Created by Remya on 9/29/22.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {

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
            self.backView.backgroundColor = Colors.accentColor()
            lblLanguage.textColor = .white
        }
        else{
            self.backView.backgroundColor = .white
            lblLanguage.textColor = Colors.accentColor()
        }
    }
    
}
