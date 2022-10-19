//
//  HomeViewController.swift
//  775775Sports
//
//  Created by Remya on 9/2/22.
//

import UIKit
import DropDown
import Lottie

enum SportsType{
    case soccer
    case basketball
}

class HomeViewController: BaseViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var collectionViewCategory: UICollectionView!
    @IBOutlet weak var noDataView: UIView!
    @IBOutlet weak var leagueView: UIView!
    @IBOutlet weak var lblLeague: UILabel!
    @IBOutlet weak var highlightsStack: UIStackView!
    @IBOutlet weak var collectionViewHighlights: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionViewHighlightsHeight: NSLayoutConstraint!
    @IBOutlet weak var animationView: AnimationView!
    
    
    @IBOutlet weak var collectionViewTime: UICollectionView!
    
    //MARK: - Variables
    var viewModel = HomeVieModel()
    var page = 1
    var refreshControl:UIRefreshControl?
    var categorySizes = [CGFloat]()
    var selectedType = 0
    var leagueDropDown:DropDown?
    var sportDropDown:DropDown?
    var selectedLeagueID:Int?
    var selectedTimeIndex = 0
    var selectedDate = ""
    var longPressId:Int?
    var current = 0
    var selectedSportsType = SportsType.soccer
    var timerPinsRefresh = Timer()
    var timerPinsAlert = Timer()
    var timerHighlightsRefresh = Timer()
    var isHighlights = false
    static var urlDetails:UrlDetails?
    var timeArray = ["Today".localized,"Result".localized,"Schedule".localized]
    var sportsView:SportsView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettings()
    }
    
    
    
    func initialSettings(){
        
        //        Utility.scheduleLocalNotificationNow(time: 1, title: "Hon Kong Vs Myanmar", subTitle: "", body: "Scores - 2:1, C - 3:1, HT - 1:0")
        //        Utility.scheduleLocalNotificationNow(time: 5, title: "Hon Kong Vs Myanmar", subTitle: "GOAL!!", body: "Scores - 3:1, C - 3:1, HT - 1:0")
        //        setupTimerForpinRefresh()
        //        setupTimerForPinAlert()
        
        setupHilightsTimer()
        setupNavButtons()
        setupGestures()
        configureLottieAnimation()
        // FootballLeague.populateFootballLeagues()
        configureLeagueDropDown()
        configureSportsDropDown()
        viewModel.categories = viewModel.todayCategories
        collectionViewTime.registerCell(identifier: "SelectionCollectionViewCell")
        collectionViewCategory.registerCell(identifier: "RoundSelectionCollectionViewCell")
        collectionViewHighlights.registerCell(identifier: "HighlightsCollectionViewCell")
        collectionViewCategory.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .left)
        tableView.register(UINib(nibName: "ScoresTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.register(UINib(nibName: "LoaderTableViewCell", bundle: nil), forCellReuseIdentifier: "loaderCell")
        refreshControl = UIRefreshControl()
        //refreshControl?.tintColor = .clear
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        if AppPreferences.getMatchHighlights().isEmpty{
            highlightsStack.isHidden = true
        }
        else{
            pageControl.numberOfPages = AppPreferences.getMatchHighlights().count
            highlightsStack.isHidden = false
        }
        collectionViewTime.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .left)
        viewModel.delegate = self
        viewModel.getMatchesList(page: page)
        viewModel.getBasketballScores()
    }
    
    func configureLottieAnimation(){
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animationView.play()
        
    }
    
    
    
    
    
    
    func configureSportsDropDown(){
        
        sportDropDown = DropDown()
        sportDropDown?.anchorView = sportsView?.lblSports
        sportDropDown?.dataSource = ["Football".localized,"Basketball".localized]
        sportsView?.lblSports.text = "Football".localized
        sportDropDown?.selectionAction = { [unowned self] (index: Int, item: String) in
            sportsView?.lblSports.text = item
            if index == 0{
                selectedSportsType = .soccer
            }
            else{
                selectedSportsType = .basketball
            }
            configureSportSelection()
        }
        
        
    }
    
    func configureSportSelection(){
        resetSportType()
        if selectedSportsType == .soccer{
            if AppPreferences.getMatchHighlights().count > 0{
                collectionViewHighlightsHeight.constant = 180
                collectionViewHighlights.reloadData()
                highlightsStack.isHidden = false
                pageControl.numberOfPages = AppPreferences.getMatchHighlights().count
            }
            else{
                highlightsStack.isHidden = true
            }
        }
        else{
            if AppPreferences.getBasketBallHighlights().count > 0{
                collectionViewHighlightsHeight.constant = 263
                collectionViewHighlights.reloadData()
                highlightsStack.isHidden = false
                pageControl.numberOfPages = AppPreferences.getBasketBallHighlights().count
            }
            else{
                highlightsStack.isHidden = true
            }
            
        }
        
    }
    
    func configureLeagueDropDown(){
        leagueDropDown = DropDown()
        leagueDropDown?.anchorView = lblLeague
        //        var arr:[String] = FootballLeague.leagues?.map{"League: " + ($0.name ?? "") } ?? []
        //        arr.insert("All Leagues", at: 0)
        //        leagueDropDown?.dataSource = arr
        //        lblLeague.text = arr.first
        lblLeague.text = "All Leagues".localized
        leagueDropDown?.selectionAction = { [unowned self] (index: Int, item: String) in
            lblLeague.text = item
            if index == 0{
                selectedLeagueID = nil
                if selectedTimeIndex == 0 && selectedSportsType == .soccer{
                    page = 1
                    viewModel.getMatchesList(page: page)
                }
            }
            else{
                selectedLeagueID = viewModel.scoreResponse?.todayHotLeague?[index-1].leagueId
                //FootballLeague.leagues?[index-1].id
                viewModel.getMatchesByLeague(leagueID: selectedLeagueID!)
            }
        }
        
    }
    
    func resetSportType(){
        viewModel.categories = viewModel.todayCategories
        collectionViewCategory.reloadData()
        selectedTimeIndex = 0
        collectionViewTime.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .left)
        if selectedSportsType == .soccer{
            let frequency = Int(HomeViewController.urlDetails?.promptFrequency ?? "") ?? 0
            if frequency > 0{
                
                var arr:[String] = viewModel.scoreResponse?.todayHotLeague?.map{$0.leagueName ?? ""} ?? []
                arr.insert("All Leagues".localized, at: 0)
                self.leagueDropDown?.dataSource = arr
                lblLeague.text = arr.first
            }
            else{
                leagueDropDown?.dataSource = ["All Leagues".localized]
                lblLeague.text = "All Leagues".localized
            }
            
            page = 1
            viewModel.getMatchesList(page: page)
        }
        else{
            viewModel.getBasketballScores()
        }
        categorySizes.removeAll()
        collectionViewCategory.reloadData()
        collectionViewCategory.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    
    func handleTimeSelection(index:Int){
        
        selectedTimeIndex = index
        switch index{
        case 0:
            viewModel.categories = viewModel.todayCategories
            collectionViewCategory.reloadData()
            if selectedSportsType == .soccer{
                let frequency = Int(HomeViewController.urlDetails?.promptFrequency ?? "") ?? 0
                if frequency > 0{
                    var arr:[String] = viewModel.scoreResponse?.todayHotLeague?.map{$0.leagueName ?? ""} ?? []
                    arr.insert("All Leagues".localized, at: 0)
                    self.leagueDropDown?.dataSource = arr
                    lblLeague.text = arr.first
                }
                else{
                    leagueDropDown?.dataSource = ["All Leagues".localized]
                    lblLeague.text = "All Leagues".localized
                }
                
                page = 1
                viewModel.getMatchesList(page: page)
            }
            else{
                viewModel.getBasketballScores()
            }
        case 1:
            viewModel.categories = viewModel.pastDates
            leagueDropDown?.dataSource = ["All Leagues".localized]
            lblLeague.text = "All Leagues".localized
        case 2:
            viewModel.categories = viewModel.futureDates
            leagueDropDown?.dataSource = ["All Leagues".localized]
            lblLeague.text = "All Leagues".localized
            
        default:
            break
        }
        categorySizes.removeAll()
        collectionViewCategory.reloadData()
        collectionViewCategory.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        collectionViewCategory.delegate?.collectionView?(collectionViewCategory, didSelectItemAt: IndexPath(row: 0, section: 0))
        
    }
    
    func setupGestures(){
        let tapLg = UITapGestureRecognizer(target: self, action: #selector(tapLeague))
        leagueView.addGestureRecognizer(tapLg)
        
        let tapSp = UITapGestureRecognizer(target: self, action: #selector(tapSports))
        sportsView!.addGestureRecognizer(tapSp)
        
        let left = UISwipeGestureRecognizer(target: self, action: #selector(swipe(sender:)))
        left.direction = .left
        left.delegate = self
        collectionViewHighlights.addGestureRecognizer(left)
        
        let right = UISwipeGestureRecognizer(target: self, action: #selector(swipe(sender:)))
        right.direction = .right
        right.delegate = self
        collectionViewHighlights.addGestureRecognizer(right)
        
    }
    
    
    @objc func tapLeague(){
        leagueDropDown?.show()
        
    }
    
    @objc func tapSports(){
        sportDropDown?.show()
    }
    
    
    
    @objc func swipe(sender:UISwipeGestureRecognizer){
        if sender.direction == .left{
            var total = AppPreferences.getMatchHighlights().count
            if self.selectedSportsType == .basketball{
                total = AppPreferences.getBasketBallHighlights().count
            }
            if current < (total - 1){
                current += 1
                collectionViewHighlights.scrollToItem(at: IndexPath(row: current, section: 0), at: .centeredHorizontally, animated: true)
                pageControl.currentPage = current
            }
        }
        else{
            if current > 0{
                current -= 1
                collectionViewHighlights.scrollToItem(at: IndexPath(row: current, section: 0), at: .centeredHorizontally, animated: true)
                pageControl.currentPage = current
                
            }
        }
        
    }
    
    
    
    @objc func refresh(){
        if selectedTimeIndex == 0 && selectedLeagueID == nil{
            page = 1
            viewModel.getMatchesList(page: page)
        }
        refreshControl?.endRefreshing()
    }
    
    func setupNavButtons(){
        sportsView = SportsView(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: sportsView!)
        
        let rightBtn = getButton(image: UIImage(named: "search")!)
        rightBtn.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: rightBtn)]
    }
    
    @objc func menuTapped(){
        BaseViewController.openSideMenu(vc: self)
        //openVC(storyBoard: "SideMenu", identifier: "SideMenuViewController")
    }
    
    @objc func searchTapped(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        vc.viewModel.originals = viewModel.originals
        vc.viewModel.pageData = viewModel.pageData
        vc.page = page
        vc.viewModel.originaBasketballMatches = viewModel.originaBasketballMatches
        vc.selectedSport = self.selectedSportsType
        vc.selectedTimeIndex = selectedTimeIndex
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func setupHilightsTimer(){
        if !(AppPreferences.getMatchHighlights().isEmpty) || !(AppPreferences.getBasketBallHighlights().isEmpty){
            timerHighlightsRefresh = Timer.scheduledTimer(timeInterval: 15, target: self, selector: #selector(refreshHilights), userInfo: nil, repeats: true)
        }
    }
    
    @objc func refreshHilights(){
        for m in AppPreferences.getMatchHighlights(){
            print("football id: \(m.matchId ?? 0)")
            viewModel.getMatchDetails(id: m.matchId ?? 0)
        }
        
        for m in AppPreferences.getBasketBallHighlights(){
            print("basketball id: \(m.matchId ?? 0)")
            viewModel.getBasketballMatchDetails(id: m.matchId ?? 0)
        }
        
    }
    
    
    static func showPopup(){
        let frequency = AppPreferences.getPopupFrequency()
        let promptFrequency = Int(HomeViewController.urlDetails?.promptFrequency ?? "") ?? 0
        if frequency < promptFrequency{
            let title = HomeViewController.urlDetails?.promptTitle ?? ""
            let message = HomeViewController.urlDetails?.promptMessage ?? ""
            if title.count > 0{
                Dialog.openSuccessDialog(buttonLabel: "OK".localized, title: title, msg: message, completed: {})
                AppPreferences.setPopupFrequency(frequency: frequency+1)
            }
        }
    }
    
    //    func setupTimerForpinRefresh(){
    //        if !AppPreferences.getPinList().isEmpty{
    //            timerPinsRefresh = Timer.scheduledTimer(timeInterval: 15, target: self, selector: #selector(refreshPins), userInfo: nil, repeats: true)
    //
    //        }
    //    }
    //
    //    @objc func refreshPins(){
    //        let pins = AppPreferences.getPinList()
    //        for m in pins{
    //            viewModel.getMatchDetails(id: m.matchId ?? 0)
    //
    //        }
    //
    //    }
    //
    //    func setupTimerForPinAlert(){
    //        if !AppPreferences.getPinList().isEmpty{
    //            timerPinsAlert = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(showAlert), userInfo: nil, repeats: true)
    //        }
    //    }
    //
    //    @objc func showAlert(){
    //        let pins = AppPreferences.getPinList()
    //        if let obj = pins.filter({!($0.state == 0 || $0.state == -1)}).first{
    //            Utility.scheduleLocalNotificationNow(time: 1, title: "\(obj.homeName ?? "") Vs \(obj.awayName ?? "")", subTitle: "", body: "Scores - \(obj.homeScore ?? 0):\(obj.awayScore ?? 0), C - \(obj.homeCorner ?? ""):\(obj.awayCorner ?? ""), HT - \(obj.homeHalfScore ?? ""):\(obj.awayHalfScore ?? "")", data: ["id" : obj.matchId ?? 0], repeats: false)
    //
    //        }
    //    }
    
    
}


