//
//  HighlightsCollectionViewCell.swift
//  775775Sports
//
//  Created by Remya on 9/20/22.
//

import UIKit

class HighlightsCollectionViewCell: UICollectionViewCell {
    var callDeletion:(()->Void)?

    @IBOutlet weak var scoresView: ScoresView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(actionLongTap))
        self.addGestureRecognizer(longTap)
        
    }
    
    func configureCell(obj:MatchList?){
        scoresView.configureView(obj: obj)
    }
    
    func configureCell(obj:BasketballMatchList?){
        scoresView.configureView(obj: obj)
    }
    
    @objc func actionLongTap(){
        callDeletion?()
    }
   
}
