//
//  TypesCollectionViewCell.swift
//  775775Sports
//
//  Created by Remya on 9/2/22.
//

import UIKit

class TypesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func configureCell(title:String){
        lblTitle.text = title
//        let gradient1 = lblTitle.getGradientLayer(bounds: lblTitle.bounds)
//        lblTitle.textColor = lblTitle.gradientColor(bounds: lblTitle.bounds, gradientLayer: gradient1)
//        let gradient2 = backView.getGradientLayer(bounds: backView.bounds)
//        backView.borderColor = backView.gradientColor(bounds: backView.bounds, gradientLayer: gradient2)
        
        
    }

}
