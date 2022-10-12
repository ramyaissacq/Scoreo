//
//  VideoHeighlightsCollectionViewCell.swift
//  775775Sports
//
//  Created by Remya on 9/2/22.
//

import UIKit
import AVKit

class VideoHeighlightsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var imgHighlights: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(obj:VideoList?){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Utility.dateFormat.ddMMyyyyWithTimeZone.rawValue
        //Utility.formatDate(date: dateFormatter.date(from: obj?.createTime ?? ""), with: .ddMMMyyyy)
        lblTitle.text = obj?.title
        imgHighlights.setImage(with: obj?.thumbnailPath, placeholder: Utility.getPlaceHolder())
        let queue1 = DispatchQueue(label: "q1", attributes: .concurrent)
        queue1.async {
            let (h,m,s) = self.getVideoDuration(url: obj?.cfHlsUrl ?? "")
            DispatchQueue.main.async {
                self.lblTime.text = "\(h):\(m):\(s)"
            }
            
        }
       
    
    }

    
    func getVideoDuration(url:String) -> (Int, Int, Int){
        guard let videoURL = URL(string: url) else{ return (0,0,0)}
        let asset = AVAsset(url: videoURL)
        let duration = asset.duration
        let durationTime = CMTimeGetSeconds(duration)
        let (h,m,s) = Utility.secondsToHoursMinutesSeconds(Int(durationTime))
        return (h,m,s)
    }
}
