//
//  AnalysisTableViewCell.swift
//  775775Sports
//
//  Created by Remya on 9/12/22.
//

import UIKit

class AnalysisTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCorner: UILabel!
    @IBOutlet weak var lblLeague: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblAway: UILabel!
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblHT: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    
    @IBOutlet weak var fixedLblCorner: UILabel!
    
    @IBOutlet weak var fixedLblHT: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(match:String?){
        let arr = match?.components(separatedBy: ",")
        let scoreArray = arr?[9].components(separatedBy: "^")
        let dateArray = arr?[3].components(separatedBy: "^")
        lblLeague.text = arr?[2]
        lblHome.text = arr?[5]
        lblAway.text = arr?[8]
        lblScore.text = "\(scoreArray?[1] ?? "") : \(scoreArray?[2] ?? "")"
        lblCorner.text = "\(scoreArray?[7] ?? "") : \(scoreArray?[8] ?? "")"
        lblHT.text = "\(scoreArray?[3] ?? "") : \(scoreArray?[4] ?? "")"
        lblDate.text = dateArray?[1]
        
    }
    
    func configureCell(obj:BasketballAnalysisData?){
        fixedLblCorner.text = "Total Points".localized
        fixedLblHT.text = "Half".localized
        
        switch Utility.getCurrentLang(){
        case "en":
            lblLeague.text = obj?.leagueNameEn
            lblHome.text = obj?.homeTeamEn
            lblAway.text = obj?.awayTeamEn
        case "cn":
            lblLeague.text = obj?.leagueNameCn
            lblHome.text = obj?.homeTeamNameCn
            lblAway.text = obj?.awayTeamNameCn
        case "id":
            lblLeague.text = obj?.leagueNameId
            lblHome.text = obj?.homeTeamNameId
            lblAway.text = obj?.awayTeamNameId
        case "vi":
            lblLeague.text = obj?.leagueNameVi
            lblHome.text = obj?.homeTeamNameVi
            lblAway.text = obj?.awayTeamNameVi
        case "th":
            lblLeague.text = obj?.leagueNameTh
            lblHome.text = obj?.homeTeamNameTh
            lblAway.text = obj?.awayTeamNameTh
        default:
            lblLeague.text = obj?.leagueNameEn
            lblHome.text = obj?.homeTeamEn
            lblAway.text = obj?.awayTeamEn
        
        
        }
        lblScore.text = "\(obj?.homeScore ?? 0) : \(obj?.awayScore ?? 0)"
        lblCorner.text = String(obj?.total ?? 0)
        lblHT.text = "\(obj?.homeHalfScore ?? 0) : \(obj?.awayHalfScore ?? 0)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Utility.dateFormat.yyyyMMddHHmm.rawValue
        let dt = dateFormatter.date(from: obj?.matchTime ?? "")
        lblDate.text = Utility.formatDate(date: dt, with: .edmmmHHmm)
        
    }
    
    
}
