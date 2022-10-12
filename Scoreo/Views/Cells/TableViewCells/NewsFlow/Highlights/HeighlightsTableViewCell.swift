//
//  HeighlightsTableViewCell.swift
//  775775Sports
//
//  Created by Remya on 9/2/22.
//

import UIKit

class HeighlightsTableViewCell: UITableViewCell {
    @IBOutlet weak var imgVideo: UIImageView!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(obj:VideoList?){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Utility.dateFormat.ddMMyyyyWithTimeZone.rawValue
        let dt = dateFormatter.date(from: obj?.createTime ?? "")
        lblTime.text = dt?.timeAgoDisplay()
        imgVideo.setImage(with: obj?.thumbnailPath, placeholder: Utility.getPlaceHolder())
        lblDescription.text = obj?.title
    }
    
}
