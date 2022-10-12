//
//  MoreCollectionViewCell.swift
//  775775Sports
//
//  Created by Remya on 9/3/22.
//

import UIKit

class MoreCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgArrow:UIImageView!
    
    var cellIndex = 0
    var isTeamStandings = true

    override func awakeFromNib() {
        super.awakeFromNib()
       
       
        // Initialization code
    }
    
    func configureCell(index:Int,isTeamStandings:Bool){
        cellIndex = index
        self.isTeamStandings = isTeamStandings
        setupViews()
        imgArrow.isHidden = false
    }
    
    func setupViews(){
        if isTeamStandings{
            if AwardsViewController.selectedTeamMoreIndices.contains(cellIndex){
                imgArrow.transform = CGAffineTransform(rotationAngle: .pi)
                
            }
            else{
                imgArrow.transform = .identity
            }
        } // teamStandings if ends
        else{ //for playerstandings
            if AwardsViewController.selectedPlayerMoreIndices.contains(cellIndex){
                imgArrow.transform = CGAffineTransform(rotationAngle: .pi)
                
            }
            else{
                imgArrow.transform = .identity
            }
            
        }
    }

}
