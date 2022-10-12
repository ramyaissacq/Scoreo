//
//  AwardsViewController.swift
//  775775Sports
//
//  Created by Remya on 9/2/22.
//

import UIKit
import DropDown
import Lottie

class AwardsViewController: BaseViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var lblSports: UILabel!
    @IBOutlet weak var lblLeague: UILabel!
    @IBOutlet weak var collectionViewTop: UICollectionView!
    @IBOutlet weak var collectionViewHeading: UICollectionView!
    @IBOutlet weak var tableViewStandings: UITableView!
    @IBOutlet weak var tableViewStandingsHeight: NSLayoutConstraint!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblSelectedLeague: UILabel!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var leagueView: UIView!
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var animationView: AnimationView!
    //MARK: - Variables
    var topTitles = ["Team Standings".localized,"Player Standings".localized]
    var normalTeamHeadings = ["Ranking".localized,"Team Name".localized,"MP","W","D","L","GF","GA","PTs","More".localized]
    var headings2 = ["Rank".localized,"Team Name".localized,"Player Name".localized,"Goals".localized,"Home".localized,"Away".localized,"More".localized]
    var rareTeamHeadings = ["Ranking".localized,"Team Name".localized,"MP","W","D","L","GF","GA","PTs"]
    var normalHeaderSizes = [CGFloat]()
    var rareHeaderSizes = [CGFloat]()
    var secondHeaderSizes = [CGFloat]()
    var headers = [String]()
    var headerSizes = [CGFloat]()
    var selectedTopTitleIndex = 0
    var sportsDropDown:DropDown?
    var leagueDropDown:DropDown?
    static var selectedPlayerMoreIndices = [Int]()
    static var selectedTeamMoreIndices = [Int]()
    var selectedLeagueID:Int?
    var viewModel = AwardsViewModel()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettings()

    }
    
    //MARK: - IBActions
    
    @IBAction func actionTapSports(_ sender: Any) {
        sportsDropDown?.show()
    }
    
    
    @IBAction func actionTapLeague(_ sender: Any) {
        leagueDropDown?.show()
        
    }
    
    func initialSettings(){
        configureLottieAnimation()
        FootballLeague.populateFootballLeagues()
        configureSportsDropDown()
        configureLeagueDropDown()
        lblSports.text = "Football".localized
        lblLeague.text = FootballLeague.leagues?.first?.name
        selectedLeagueID = FootballLeague.leagues?.first?.id
        //headers = headings1
        collectionViewTop.registerCell(identifier: "SelectionCollectionViewCell")
        collectionViewHeading.registerCell(identifier: "TitleCollectionViewCell")
        tableViewStandings.register(UINib(nibName: "StandingsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableViewStandings.register(UINib(nibName: "GeneralRowTableViewCell", bundle: nil), forCellReuseIdentifier: "cell1")
        tableViewStandings.register(UINib(nibName: "LeagueHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "headerCell")

        collectionViewTop.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .left)
        
        //Calculating cell widths for normalTeamHeadings
        normalHeaderSizes = [40,85,15,15,15,15,15,15,20,25]
        var itemSpacing:CGFloat = CGFloat((normalTeamHeadings.count - 1) * 5)
        var total_widths:CGFloat = normalHeaderSizes.reduce(0, +)
        var totalSpace:CGFloat = total_widths + itemSpacing
        var balance = (UIScreen.main.bounds.width - totalSpace)/CGFloat(normalTeamHeadings.count)
        normalHeaderSizes = normalHeaderSizes.map{$0+balance}
        headerSizes = normalHeaderSizes
        
        //Calculating cell widths for rareTeamHeadings
        rareHeaderSizes = [40,85,15,15,15,15,15,15,20]
         itemSpacing = CGFloat((rareTeamHeadings.count - 1) * 5)
         total_widths = rareHeaderSizes.reduce(0, +)
         totalSpace = total_widths + itemSpacing
         balance = (UIScreen.main.bounds.width - totalSpace)/CGFloat(rareTeamHeadings.count)
        rareHeaderSizes = rareHeaderSizes.map{$0+balance}
      
        //Calculating cell widths for headings2
        secondHeaderSizes = [25,85,85,25,25,25,25]
       itemSpacing = CGFloat((headings2.count - 1) * 5)
        total_widths = secondHeaderSizes.reduce(0, +)
        totalSpace = total_widths + itemSpacing
        balance = (UIScreen.main.bounds.width - totalSpace)/CGFloat(headings2.count)
        secondHeaderSizes = secondHeaderSizes.map{$0+balance}
        
        
        
        viewModel.delegate = self
        viewModel.getTeamStandings(leagueID: selectedLeagueID!, subLeagueID: 0)
        viewModel.getPlayerStandings(leagueID: selectedLeagueID!)
        
    }
    
    func configureLottieAnimation(){
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animationView.play()
        
    }
    
    func setupViews(){
        if selectedTopTitleIndex == 0{
            if viewModel.isNormalStanding{
            headers = normalTeamHeadings
            headerSizes = normalHeaderSizes
            
                collectionViewHeading.isHidden = false
            }
            else{
                headers = rareTeamHeadings
                headerSizes = rareHeaderSizes
                collectionViewHeading.isHidden = true
            }
            imgLogo.isHidden = false
            
        }
        else{
            headers = headings2
            headerSizes = secondHeaderSizes
            imgLogo.isHidden = true
            collectionViewHeading.isHidden = false
            
        }
       
            self.collectionViewHeading.reloadData()
            self.tableViewStandings.reloadData()
            self.emptyChecks()
        
    }
    
    func emptyChecks(){
        if selectedTopTitleIndex == 0{
            if (viewModel.isNormalStanding && viewModel.normalStandings?.totalStandings?.isEmpty ?? true) || (!viewModel.isNormalStanding &&  viewModel.leaguStanding?.list?.first?.score?.first?.groupScore?.isEmpty ?? true){
                collectionViewHeading.isHidden = true
                tableViewStandings.isHidden = true
                leagueView.isHidden = true
                animationView.play()
                emptyLabel.text = "Sorry!...No standings found".localized
                emptyView.isHidden = false
                
            }
            else{
                if viewModel.isNormalStanding{
                collectionViewHeading.isHidden = false
                }
                else{
                    collectionViewHeading.isHidden = true
                }
                tableViewStandings.isHidden = false
                leagueView.isHidden = false
                animationView.stop()
                emptyView.isHidden = true
                
            }
        }
        else{
            if viewModel.playerStandings?.count ?? 0 > 0{
                collectionViewHeading.isHidden = false
                tableViewStandings.isHidden = false
                leagueView.isHidden = false
                animationView.stop()
                emptyView.isHidden = true
            }
            else{
                collectionViewHeading.isHidden = true
                tableViewStandings.isHidden = true
                leagueView.isHidden = true
                animationView.play()
                emptyLabel.text = "Sorry!...No standings found".localized
                emptyView.isHidden = false
                
            }
        }
        
    }
    
    func configureSportsDropDown(){
        sportsDropDown = DropDown()
        sportsDropDown?.dataSource = ["Football".localized]
        sportsDropDown?.anchorView = lblSports
        sportsDropDown?.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            lblSports.text = item
        }
    }
    
    func configureLeagueDropDown(){
        leagueDropDown = DropDown()
        leagueDropDown?.dataSource = FootballLeague.leagues?.map{$0.name ?? ""} ?? []
        leagueDropDown?.anchorView = lblLeague
        leagueDropDown?.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            lblLeague.text = item
            selectedLeagueID = FootballLeague.leagues?[index].id
            if selectedTopTitleIndex == 1{
            self.viewModel.playerStandings?.removeAll()
            }
            else{
                self.viewModel.normalStandings = nil
                self.viewModel.leaguStanding = nil
            }
            self.collectionViewHeading.reloadData()
            self.tableViewStandings.reloadData()
            self.emptyChecks()
            viewModel.getTeamStandings(leagueID: selectedLeagueID!, subLeagueID: 0)
            viewModel.getPlayerStandings(leagueID: selectedLeagueID!)
        }
    }
    

}

