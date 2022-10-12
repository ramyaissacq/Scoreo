//
//  HomeCategoryViewController.swift
//  775775Sports
//
//  Created by Remya on 9/7/22.
//

import UIKit

enum HomeCategory{
    case index
    case analysis
    case league
    case event
    case breifing
    
}

class HomeCategoryViewController: BaseViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var indexContainerView: UIView!
    @IBOutlet weak var analysisContainerView: UIView!
    @IBOutlet weak var eventContainerView: UIView!
    @IBOutlet weak var briefingView: UIView!
    @IBOutlet weak var leagueView: UIView!
    @IBOutlet weak var scoreView: ScoresView!
    @IBOutlet weak var scoreViewHeight: NSLayoutConstraint!
    
    //MARK: - Variables
    static var matchID:Int?
    var selectedMatch:MatchList?
    var selectedCategory = HomeCategory.index
    static var selectedSport:SportsType?
    var basketMatch:BasketballMatchList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
       
    }
    
    func initialSetup(){
        setBackButton()
        configureContainers()
        FootballCompany.populateFootballCompanies()
        configureScoreView()
    }
    
    func configureScoreView(){
        if HomeCategoryViewController.selectedSport == .soccer{
            scoreViewHeight.constant = 180
            scoreView.configureView(obj: selectedMatch)
        }
        else{
            scoreViewHeight.constant = 263
            scoreView.configureView(obj: basketMatch)
        }
        scoreView.callBackIndex = {
            self.selectedCategory = .index
            self.configureContainers()
        }
        scoreView.callBackEvent = {
            self.selectedCategory = .event
            self.configureContainers()
        }
        scoreView.callBackLeague = {
            self.selectedCategory = .league
            self.configureContainers()
        }
        scoreView.callBackAnalysis = {
            self.selectedCategory = .analysis
            self.configureContainers()
        }
        scoreView.callBackBreifing = {
            self.selectedCategory = .breifing
            self.configureContainers()
        }
    }
    
    
    func configureContainers(){
        analysisContainerView.isHidden = true
        eventContainerView.isHidden = true
        briefingView.isHidden = true
        leagueView.isHidden = true
        indexContainerView.isHidden = true
        
        scoreView.viewAnalysis.backgroundColor = .white
        scoreView.viewEvent.backgroundColor = .white
        scoreView.viewBriefing.backgroundColor = .white
        scoreView.viewLeague.backgroundColor = .white
        scoreView.viewIndex.backgroundColor = .white
        
        switch selectedCategory{
        case .index:
            indexContainerView.isHidden = false
            scoreView.viewIndex.backgroundColor = Colors.accentColor()
            
        case .analysis:
            
            analysisContainerView.isHidden = false
            scoreView.viewAnalysis.backgroundColor = Colors.accentColor()
            
        case .league:
            
            leagueView.isHidden = false
            scoreView.viewLeague.backgroundColor = Colors.accentColor()
            
        case .event:
           
            eventContainerView.isHidden = false
            scoreView.viewEvent.backgroundColor = Colors.accentColor()
        case .breifing:
            
            briefingView.isHidden = false
            scoreView.viewBriefing.backgroundColor = Colors.accentColor()
            
        }
        
    }
    
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEvents"{
            let vc = segue.destination as? EventViewController
                vc?.homeName = selectedMatch?.homeName
                vc?.awayName = selectedMatch?.awayName
            
        }
        else if segue.identifier == "league"{
            let vc = segue.destination as? LeagueViewController
            vc?.groupID = selectedMatch?.groupId ?? 0
            vc?.leagueID = selectedMatch?.leagueId ?? 0
            vc?.subLeagueID = Int(selectedMatch?.subLeagueId ?? "") ?? 0
            if HomeCategoryViewController.selectedSport == .basketball{
                vc?.leagueID = basketMatch?.leagueId
            }
            
    }
    }
    

}
