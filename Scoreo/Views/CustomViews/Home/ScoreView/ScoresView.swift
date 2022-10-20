//
//  ScoresView.swift
//  775775Sports
//
//  Created by Remya on 9/12/22.
//

import UIKit

class ScoresView: UIView {
    @IBOutlet var contentView: UIView!
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
    @IBOutlet weak var tableViewQuarters: UITableView!
    
    @IBOutlet weak var fixedIndex: UILabel!
    
    @IBOutlet weak var fixedAnalysis: UILabel!
    
    @IBOutlet weak var fixedLeague: UILabel!
    
    @IBOutlet weak var fixedEvent: UILabel!
    
    @IBOutlet weak var fixedBriefing: UILabel!
    
    //MARK: - Variables
    var callBackIndex:(()->Void)?
    var callBackEvent:(()->Void)?
    var callBackLeague:(()->Void)?
    var callBackAnalysis:(()->Void)?
    var callBackBreifing:(()->Void)?
    var quarters = ["","1Q","2Q","3Q","4Q","F"]
    var homeScores = [String]()
    var awayScores = [String]()
    
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           commonInit()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           commonInit()
       }
       
       func commonInit() {
           Bundle.main.loadNibNamed("ScoresView", owner: self, options: nil)
           contentView.fixInView(self)
           setupLocalisation()
           tableViewQuarters.delegate = self
           tableViewQuarters.dataSource = self
           tableViewQuarters.register(UINib(nibName: "GeneralRowTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
           let tap = UITapGestureRecognizer(target: self, action: #selector(indexTapped))
           viewIndex.addGestureRecognizer(tap)
           
           let tapAnls = UITapGestureRecognizer(target: self, action: #selector(analysisTapped))
           viewAnalysis.addGestureRecognizer(tapAnls)
           
           let tapEvnt = UITapGestureRecognizer(target: self, action: #selector(eventTapped))
           viewEvent.addGestureRecognizer(tapEvnt)
           
           let tapBrf = UITapGestureRecognizer(target: self, action: #selector(briefingTapped))
           viewBriefing.addGestureRecognizer(tapBrf)
           
           let tapLg = UITapGestureRecognizer(target: self, action: #selector(leagueTapped))
           viewLeague.addGestureRecognizer(tapLg)
       }
    
    func setupLocalisation(){
        fixedIndex.text = "Index".localized
        fixedAnalysis.text = "Analysis".localized
        fixedLeague.text = "League".localized
        fixedEvent.text = "Event".localized
        fixedBriefing.text = "Briefing".localized
    }
    
    func configureView(obj:MatchList?){
        tableViewQuarters.isHidden = true
        cornerStack.isHidden = false
        cornerView.isHidden = false
        viewEvent.isHidden = false
        lblName.text = obj?.leagueName
        lblHomeName.text = obj?.homeName
        lblAwayName.text = obj?.awayName
        lblScore.text = "\(obj?.homeScore ?? 0 ) : \(obj?.awayScore ?? 0)"
        //let timeDifference = Date() - Utility.getSystemTimeZoneTime(dateString: obj?.startTime ?? "")
        let mins = ScoresTableViewCell.timeInMins(startDate: obj?.startTime ?? "")
        //ScoresTableViewCell.getMinutesFromTimeInterval(interval: timeDifference)
        if obj?.state == -1{
            lblDate.text = ScoresTableViewCell.getStatus(state: obj?.state ?? 0)
        }
        else{
            lblDate.text = "\(ScoresTableViewCell.getStatus(state: obj?.state ?? 0)) \(mins)'"
            
        }
        
        if obj?.state == 0{
            lblScore.text = "SOON".localized
            let date = Utility.getSystemTimeZoneTime(dateString: obj?.matchTime ?? "")
            lblDate.text = Utility.formatDate(date: date, with: .eddmmm)
        }
        let matchDate = Utility.getSystemTimeZoneTime(dateString: obj?.matchTime ?? "")
        lblTime.text = Utility.formatDate(date: matchDate, with: .hhmm2)
        lblHalfScore.text = "\(obj?.homeHalfScore ?? "") : \(obj?.awayHalfScore ?? "")"
        lblCorner.text = "\(obj?.homeCorner ?? "") : \(obj?.awayCorner ?? "")"
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
    
    
    func configureView(obj:BasketballMatchList?){
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
            lblName.text = obj?.leagueNameEn
            lblHomeName.text = obj?.homeTeamEn
            lblAwayName.text = obj?.awayTeamEn
        
        
        }
        
        
        let date = Utility.getSystemTimeZoneTime(dateString: obj?.matchTime ?? "")
        lblDate.text = Utility.formatDate(date: date, with: .eddmmm)
        
        
        let mins = ScoresTableViewCell.timeInMins(startDate: obj?.matchTime ?? "")
        if obj?.matchState == -1{
            lblTime.text = ScoresTableViewCell.getBasketballStatus(state: obj?.matchState ?? 0)
        }
        else{
        lblTime.text = "\(ScoresTableViewCell.getBasketballStatus(state: obj?.matchState ?? 0)) \(mins)'"
        }
        
        if obj?.matchState == 0{
            let matchDate = Utility.getSystemTimeZoneTime(dateString: obj?.matchTime ?? "")
            lblTime.text = Utility.formatDate(date: matchDate, with: .hhmm2)
        }
        
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
       
        if obj?.havBriefing ?? false{
            viewBriefing.isHidden = false
        }
        else{
            viewBriefing.isHidden = true
            
        }
        homeScores = ["Home".localized,obj?.home1 ?? "",obj?.home2 ?? "",obj?.home3 ?? "",obj?.home4 ?? "",obj?.homeScore ?? ""]
        awayScores = ["Away".localized,obj?.away1 ?? "",obj?.away2 ?? "",obj?.away3 ?? "",obj?.away4 ?? "",obj?.awayScore ?? ""]
        tableViewQuarters.reloadData()
        tableViewQuarters.isHidden = false
        
      
    }
    
    
    @objc func indexTapped(){
       callBackIndex?()
    }
    @objc func eventTapped(){
        callBackEvent?()
    }
    @objc func leagueTapped(){
       callBackLeague?()
    }
    @objc func analysisTapped(){
        callBackAnalysis?()
    }
    @objc func briefingTapped(){
        callBackBreifing?()
    }
    
}

extension ScoresView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! GeneralRowTableViewCell
        
        if indexPath.row == 0{
            cell.titleType = .Header(color: .black)
            cell.backgroundColor = UIColor(named: "gray9")
        }
        else{
            cell.titleType = .Normal
            cell.backgroundColor = .clear
        }
        cell.headerSizes = calculateWidth()
        cell.height = 30
        cell.spacing = 0
        cell.collectionHeight.constant = 30
        cell.needBorder = true
        if indexPath.row == 0{
        cell.values = quarters
        }
        else if indexPath.row == 2{
            cell.values = homeScores
        }
        else{
            cell.values = awayScores
        }
        return cell
        
    }
    
    func calculateWidth()->[CGFloat]{
        let w = UIScreen.main.bounds.width - 10
        let width = w/CGFloat(quarters.count)
        var sizes = [CGFloat]()
        for _ in 0...quarters.count-1{
            sizes.append(width)
        }
        return sizes
    }
    
    
}


extension UIView
{
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
