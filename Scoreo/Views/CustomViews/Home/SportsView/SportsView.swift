//
//  SportsView.swift
//  Scoreo
//
//  Created by Remya on 10/15/22.
//

import Foundation
import UIKit

class SportsView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lblSports: UILabel!
    override init(frame: CGRect) {
           super.init(frame: frame)
           commonInit()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           commonInit()
       }
       
       func commonInit() {
           Bundle.main.loadNibNamed("SportsView", owner: self, options: nil)
           contentView.fixInView(self)
           let gradient = lblSports.getGradientLayer(bounds: lblSports.bounds)
           lblSports.textColor = lblSports.gradientColor(bounds: lblSports.bounds, gradientLayer: gradient)
       }
    
    
}
