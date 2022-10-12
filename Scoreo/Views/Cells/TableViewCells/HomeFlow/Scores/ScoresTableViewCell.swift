//
//  ScoresTableViewCell.swift
//  775775Sports
//
//  Created by Remya on 9/5/22.
//

import UIKit


class ScoresTableViewCell: UITableViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var viewIndex: UIView!
    
    @IBOutlet weak var viewAnalysis: UIView!
    
    @IBOutlet weak var viewLeague: UIView!
    
    @IBOutlet weak var viewEvent: UIView!
    
    @IBOutlet weak var viewBriefing: UIView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblHomeName: UILabel!
    
    @IBOutlet weak var lblAwayName: UILabel!
    
    @IBOutlet weak var lblScore: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblHalfScore: UILabel!
    @IBOutlet weak var lblCorner: UILabel!
    @IBOutlet weak var lblHandicap1: UILabel!
    @IBOutlet weak var lblHandicap2: UILabel!
    @IBOutlet weak var lblHandicap3: UILabel!
    @IBOutlet weak var lblOverUnder1: UILabel!
    @IBOutlet weak var lblOverUnder2: UILabel!
    @IBOutlet weak var lblOverUnder3: UILabel!
    @IBOutlet weak var indexViewYellow: UIView!
    @IBOutlet weak var odds2Stack: UIStackView!
    @IBOutlet weak var odds1Stack: UIStackView!
    
    @IBOutlet weak var cornerStack: UIStackView!
    @IBOutlet weak var cornerView: UIView!
    
    @IBOutlet weak var quartersStack: UIStackView!
    @IBOutlet weak var tableViewQuarters: UITableView!
    @IBOutlet weak var separator2: UIView!
    
    @IBOutlet weak var fixedIndex: UILabel!
    
    @IBOutlet weak var fixedAnalysis: UILabel!
    
    @IBOutlet weak var fixedEvent: UILabel!
    
    
    @IBOutlet weak var fixedLeague: UILabel!
    @IBOutlet weak var fixedBriefing: UILabel!
    
    
    //MARK: - Variables
    var callIndexSelection:(()->Void)?
    var callAnalysisSelection:(()->Void)?
    var callEventSelection:(()->Void)?
    var callBriefingSelection:(()->Void)?
    var callLeagueSelection:(()->Void)?
    var callLongPress:(()->Void)?
    var quarters = ["","1Q","2Q","3Q","4Q","F"]
    var homeScores = [String]()
    var awayScores = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tableViewQuarters.delegate = self
        tableViewQuarters.dataSource = self
        tableViewQuarters.register(UINib(nibName: "GeneralRowTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        setupLocalisation()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapIndex))
        viewIndex.addGestureRecognizer(tap)
        
        let tapAnls = UITapGestureRecognizer(target: self, action: #selector(tapAnalysis))
        viewAnalysis.addGestureRecognizer(tapAnls)
        
        let tapEvnt = UITapGestureRecognizer(target: self, action: #selector(tapEvent))
        viewEvent.addGestureRecognizer(tapEvnt)
        
        let tapBrf = UITapGestureRecognizer(target: self, action: #selector(tapBriefing))
        viewBriefing.addGestureRecognizer(tapBrf)
        
        let tapLg = UITapGestureRecognizer(target: self, action: #selector(tapLeague))
        viewLeague.addGestureRecognizer(tapLg)
        
        let tapLong = UILongPressGestureRecognizer(target: self, action: #selector(actionLongPress))
        self.addGestureRecognizer(tapLong)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupLocalisation(){
        fixedIndex.text = "Index".localized
        fixedAnalysis.text = "Analysis".localized
        fixedLeague.text = "League".localized
        fixedEvent.text = "Event".localized
        fixedBriefing.text = "Briefing".localized
    }
    
    @objc func actionLongPress(){
        callLongPress?()
    }
    
    @objc func tapIndex(){
        callIndexSelection?()
        
    }
    
    
    @objc func tapAnalysis(){
        callAnalysisSelection?()
        
    }
    
    @objc func tapEvent(){
        callEventSelection?()
        
    }
    
    @objc func tapBriefing(){
        callBriefingSelection?()
        
    }
    
    @objc func tapLeague(){
        callLeagueSelection?()
        
    }
    
    func configureCell(obj:MatchList?,timeIndex:Int){
        quartersStack.isHidden = true
        cornerStack.isHidden = false
        cornerView.isHidden = false
        viewEvent.isHidden = false
        lblName.text = obj?.leagueName
        lblHomeName.text = obj?.homeName
        lblAwayName.text = obj?.awayName
        lblScore.text = "\(obj?.homeScore ?? 0 ) : \(obj?.awayScore ?? 0)"
        //let timeDifference = Date() - Utility.getSystemTimeZoneTime(dateString: obj?.startTime ?? "")
        let mins = ScoresTableViewCell.timeInMins(startDate: obj?.startTime ?? "")
        let date = Utility.getSystemTimeZoneTime(dateString: obj?.matchTime ?? "")
        //ScoresTableViewCell.getMinutesFromTimeInterval(interval: timeDifference)
        if mins > 0{
        lblDate.text = "\(ScoresTableViewCell.getStatus(state: obj?.state ?? 0)) \(mins)'"
        }
        else{
            lblDate.text = Utility.formatDate(date: date, with: .eddmmm)
        }
        if obj?.state == 0 {
            lblScore.text = "SOON".localized
            lblDate.text = Utility.formatDate(date: date, with: .eddmmm)
        }
        let matchDate = Utility.getSystemTimeZoneTime(dateString: obj?.matchTime ?? "")
        lblTime.text = Utility.formatDate(date: matchDate, with: .hhmm2)
        if obj?.homeHalfScore == "0" && obj?.awayHalfScore == "0"{
            lblHalfScore.text = ""
        }
        else{
        lblHalfScore.text = "\(obj?.homeHalfScore ?? "") : \(obj?.awayHalfScore ?? "")"
        }
        if obj?.homeCorner == "0" && obj?.awayCorner == "0"{
            lblCorner.text = ""
        }
        else{
        lblCorner.text = "\(obj?.homeCorner ?? "") : \(obj?.awayCorner ?? "")"
        }
        if obj?.homeHalfScore == "" && obj?.awayHalfScore == "" && obj?.homeCorner == "" && obj?.awayCorner == ""{
            cornerView.isHidden = true
            cornerStack.isHidden = true
        }
        else{
            cornerView.isHidden = false
            cornerStack.isHidden = false
        }
        
        if obj?.odds?.handicap?.count ?? 0 > 7{
        lblHandicap1.text = String(obj?.odds?.handicap?[6] ?? 0)
        lblHandicap2.text = String(obj?.odds?.handicap?[5] ?? 0)
        lblHandicap3.text = String(obj?.odds?.handicap?[7] ?? 0)
            odds1Stack.isHidden = false
        }
        else{
            odds1Stack.isHidden = true
        }
        if obj?.odds?.overUnder?.count ?? 0 > 7{
        lblOverUnder1.text = String(obj?.odds?.overUnder?[6] ?? 0)
        lblOverUnder2.text = String(obj?.odds?.overUnder?[5] ?? 0)
        lblOverUnder3.text = String(obj?.odds?.overUnder?[7] ?? 0)
            odds2Stack.isHidden = false
        }
        else{
            odds2Stack.isHidden = true
        }
        
        if (obj?.odds?.overUnder?.isEmpty ?? true) && (obj?.odds?.handicap?.isEmpty ?? true){
            indexViewYellow.isHidden = true
        }
        else{
            indexViewYellow.isHidden = false
        }
        
        if timeIndex == 0{
            makeAllBottomViewsShow()
            
        }
        else{
            makeAllBottomViewsHide()
        }
        if timeIndex == 0{
            if obj?.havOdds ?? false{
                viewIndex.isHidden = false
            }
            else{
                viewIndex.isHidden = true
                
            }
            
        if obj?.havEvent ?? false{
            viewEvent.isHidden = false
        }
        else{
            viewEvent.isHidden = true
            
        }
        
        if obj?.havBriefing ?? false{
            viewBriefing.isHidden = false
        }
        else{
            viewBriefing.isHidden = true
            
        }
        }
        
    }
    
    
    func configureCell(obj:BasketballMatchList?,timeIndex:Int){
        cornerStack.isHidden = true
        cornerView.isHidden = true
        viewEvent.isHidden = true
        viewIndex.isHidden = false
        odds1Stack.isHidden = false
        odds2Stack.isHidden = false
        indexViewYellow.isHidden = false
        switch Utility.getCurrentLang(){
        case "en":
            lblName.text = obj?.leagueNameEn
            lblHomeName.text = obj?.homeTeamEn
            lblAwayName.text = obj?.awayTeamEn
        case "cn":
            lblName.text = obj?.leagueNameCn
            lblHomeName.text = obj?.homeTeamNameCn
            lblAwayName.text = obj?.awayTeamNameCn
        case "id":
            lblName.text = obj?.leagueNameId
            lblHomeName.text = obj?.homeTeamNameId
            lblAwayName.text = obj?.awayTeamNameId
        case "vi":
            lblName.text = obj?.leagueNameVi
            lblHomeName.text = obj?.homeTeamNameVi
            lblAwayName.text = obj?.awayTeamNameVi
        case "th":
            lblName.text = obj?.leagueNameTh
            lblHomeName.text = obj?.homeTeamNameTh
            lblAwayName.text = obj?.awayTeamNameTh
        default:
            break
        
        
        }
        if obj?.matchState == 0{
            lblScore.text = "SOON".localized
        }
        else{
        lblScore.text = "\(obj?.homeScore ?? "" ) : \(obj?.awayScore ?? "")"
        }
        let date = Utility.getSystemTimeZoneTime(dateString: obj?.matchTime ?? "")
        lblDate.text = Utility.formatDate(date: date, with: .eddmmm)
        
        let matchDate = Utility.getSystemTimeZoneTime(dateString: obj?.matchTime ?? "")
        lblTime.text = Utility.formatDate(date: matchDate, with: .hhmm2)
       
        lblHandicap1.text = String(obj?.odds?.moneyLineAverage?.liveHomeWinRate ?? 0)
        if obj?.odds?.spread?.count ?? 0 > 9{
            lblHandicap2.text = String(obj?.odds?.spread?[9] ?? 0)
        }
        else{
            lblHandicap2.text = ""
        }
        if obj?.odds?.total?.count ?? 0 > 9{
        lblHandicap3.text = String(obj?.odds?.total?[9] ?? 0)
        }
        else{
            lblHandicap3.text = ""
        }
        
        lblOverUnder1.text = String(obj?.odds?.moneyLineAverage?.liveAwayWinRate ?? 0)
    
        if obj?.odds?.spread?.count ?? 0 > 10{
        lblOverUnder2.text = String(obj?.odds?.spread?[10] ?? 0)
        }
        else{
            lblOverUnder2.text = ""
        }
        if obj?.odds?.total?.count ?? 0 > 10{
        lblOverUnder3.text = String(obj?.odds?.total?[10] ?? 0)
        }
        else{
            lblOverUnder3.text = ""
        }
        if timeIndex == 0{
            makeAllBottomViewsShow()
            
        }
        else{
            makeAllBottomViewsHide()
        }
       
        if timeIndex == 0{
        if obj?.havBriefing ?? false{
            viewBriefing.isHidden = false
        }
        else{
            viewBriefing.isHidden = true

        }
        }
        
        if (obj?.odds?.spread?.isEmpty ?? true) && (obj?.odds?.total?.isEmpty ?? true){
            odds1Stack.isHidden = true
            odds2Stack.isHidden = true
            indexViewYellow.isHidden = true
        }
        else{
            odds1Stack.isHidden = false
            odds2Stack.isHidden = false
            indexViewYellow.isHidden = false

        }
        homeScores = ["Home".localized,obj?.home1 ?? "",obj?.home2 ?? "",obj?.home3 ?? "",obj?.home4 ?? "",obj?.homeScore ?? ""]
        awayScores = ["Away".localized,obj?.away1 ?? "",obj?.away2 ?? "",obj?.away3 ?? "",obj?.away4 ?? "",obj?.awayScore ?? ""]
        tableViewQuarters.reloadData()
        quartersStack.isHidden = false
        
        
    }
    
    func makeAllBottomViewsHide(){
        viewIndex.isHidden = true
        viewEvent.isHidden = true
        viewAnalysis.isHidden = true
        viewLeague.isHidden = true
        viewBriefing.isHidden = true
        separator2.isHidden = true
    }
    
    func makeAllBottomViewsShow(){
        viewIndex.isHidden = false
        viewEvent.isHidden = false
        viewAnalysis.isHidden = false
        viewLeague.isHidden = false
        viewBriefing.isHidden = false
        separator2.isHidden = false
    }
    
    static func timeInMins(startDate: String) -> Double{
            if(startDate == ""){
                return 0.0
            }
            else{
                let date = Date().localDate()
                
                let dateFormatter = DateFormatter()
                let dateFormatter1 = DateFormatter()
                
                dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
                dateFormatter1.dateFormat = "yyyy-MM-dd HH:mm:ss"
                
               // let CDate = dateFormatter1.date(from: date)!
                let SDate = dateFormatter.date(from: startDate)!
                dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
                let timeInterval = date.timeIntervalSince(SDate)
                var hours = timeInterval / 3600
               // print("Hours: \(hours)")
                let hoursDouble = Double(hours)
                hours = hoursDouble.round(to:2)
                
                // return hours
               // print("HoursAfter: \(hours)")
                var minutes = hours * 60//(timeInterval - hours * 3600) / 60
                minutes = minutes.round(to: 0)
                
                return minutes
            }
        }
    
    
}
    
