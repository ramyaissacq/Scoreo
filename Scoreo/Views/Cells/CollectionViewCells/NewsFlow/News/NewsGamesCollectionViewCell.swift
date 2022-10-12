//
//  NewsGamesCollectionViewCell.swift
//  775775Sports
//
//  Created by Remya on 9/1/22.
//

import UIKit

class NewsGamesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var imgGame: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(obj:NewsList?){
        lblTitle.text = obj?.keywords?.components(separatedBy: ",").first
        lblDescription.text = obj?.title
        imgGame.setImage(with: obj?.path, placeholder: Utility.getPlaceHolder())
    }

}
