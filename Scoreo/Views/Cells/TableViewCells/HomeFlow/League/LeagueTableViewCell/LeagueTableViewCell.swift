//
//  LeagueTableViewCell.swift
//  775775Sports
//
//  Created by Remya on 9/14/22.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(obj:League?){
        lblTitle.text = obj?.key
        lblValue.text = obj?.value
        
    }
    
}
