//
//  TeamCollectionViewCell.swift
//  775775Sports
//
//  Created by Remya on 9/3/22.
//

import UIKit
import Kingfisher

class TeamCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var imgLogo:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(team:String){
        let arr = team.components(separatedBy: ",")
        lblName.text = arr.first
        imgLogo.setImage(with: arr.last, placeholder: Utility.getPlaceHolder())
        
    }

}
