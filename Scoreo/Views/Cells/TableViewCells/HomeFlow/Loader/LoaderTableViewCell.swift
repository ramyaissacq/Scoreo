//
//  LoaderTableViewCell.swift
//  Core Score
//
//  Created by Remya on 9/30/22.
//

import UIKit

class LoaderTableViewCell: UITableViewCell {

    @IBOutlet weak var activity: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
