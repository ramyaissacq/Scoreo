//
//  OnboardingCollectionViewCell.swift
//  Core Score
//
//  Created by Remya on 9/30/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var orangeView: UIView!
    
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var nextView: UIView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgCurrent: UIImageView!
    
    @IBOutlet weak var fixedNext: UILabel!
    var callSkip:(()->Void)?
    var callNext:(()->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func configureCell(title:String,description:String,image:UIImage,index:Int){
        lblTitle.text = title
        lblDescription.text = description
        pageControl.currentPage = index
        imgCurrent.image = image
        let tap = UITapGestureRecognizer(target: self, action: #selector(actionCallNext))
        nextView.addGestureRecognizer(tap)
    }
    
    @IBAction func actionSkip(){
        Utility.gotoHome()
       // callSkip?()
    }
    
    @objc func actionCallNext(){
        callNext?()
    }

}
