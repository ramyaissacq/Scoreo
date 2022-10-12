//
//  NewsTableViewCell.swift
//  775775Sports
//
//  Created by Remya on 9/1/22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var imgNews: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(obj:NewsList?){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Utility.dateFormat.ddMMyyyyWithTimeZone.rawValue
        let dt = dateFormatter.date(from: obj?.createTime ?? "")
        lblDate.text = dt?.timeAgoDisplay()
        imgNews.setImage(with: obj?.path, placeholder: Utility.getPlaceHolder())
        lblDescription.text = obj?.title
        
    }
    
}
