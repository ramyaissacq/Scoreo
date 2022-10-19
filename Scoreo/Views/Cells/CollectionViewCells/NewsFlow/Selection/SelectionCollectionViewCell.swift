//
//  SelectionCollectionViewCell.swift
//  775775Sports
//
//  Created by Remya on 9/1/22.
//

import UIKit

class SelectionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var underLineView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var stack: UIStackView!
    
    @IBOutlet weak var underLineTrailing: NSLayoutConstraint!
    @IBOutlet weak var underLineLeading: NSLayoutConstraint!
    
    var callSelection:(()->Void)?
    var selectionColor = Colors.appVioletColor()
    var deSelectionColor = Colors.newGrayColor1()
    var titleColor1 = UIColor.white
    var titleColor2 = Colors.newGrayColor2()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        let tap = UITapGestureRecognizer(target: self, action: #selector(tapCall))
//        stack.addGestureRecognizer(tap)
        handleSelection()
    }
    
    override var isSelected: Bool{
        didSet{
          handleSelection()
        }
        
    }
    
    @objc func tapCall(){
         callSelection?()
    }
    
    func handleSelection(){
        if isSelected{
            self.underLineView.backgroundColor = selectionColor
            lblTitle.textColor = titleColor1
        }
        else{
            self.underLineView.backgroundColor = deSelectionColor
            lblTitle.textColor = titleColor2
        }
    }

}
