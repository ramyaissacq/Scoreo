//
//  LeagueViewController.swift
//  775775Sports
//
//  Created by Remya on 9/14/22.
//

import UIKit
import Lottie

class LeagueViewController: UIViewController {

    @IBOutlet weak var collectionViewTypes: UICollectionView!
    @IBOutlet weak var leagueStack: UIStackView!
    @IBOutlet weak var standingsStack: UIStackView!
    @IBOutlet weak var tableViewLeague: UITableView!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var tableViewLeagueHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeadings: UICollectionView!
    @IBOutlet weak var tableViewStandings: UITableView!
    @IBOutlet weak var tableViewStandingsHeight: NSLayoutConstraint!
    @IBOutlet weak var tableViewRareStandings: UITableView!
    @IBOutlet weak var tableViewRareStandingsHeight: NSLayoutConstraint!
    @IBOutlet weak var lblRule: UILabel!
    @IBOutlet weak var ruleView: UIView!
    @IBOutlet weak var normalStandingsStack: UIStackView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var lblEmpty: UILabel!
    //@IBOutlet weak var animationView: AnimationView!
    
    
    
    //MARK: - Variables
    var types = ["League / Cup Information".localized,"Match".localized]
    var headings = ["Ranking".localized,"Team Name".localized,"MP","W","D","L","GF","GA","PTs","More".localized]
    var secondHeadings = ["Ranking".localized,"Team Name".localized,"MP","W","D","L","GF","GA","PTs"]
    var headerSizes = [CGFloat]()
    var secondHeaderSizes = [CGFloat]()
    var tableViewRareStandingsObserver: NSKeyValueObservation?
    var tableViewStandingsObserver: NSKeyValueObservation?
    var tableViewLeagueObserver: NSKeyValueObservation?
    var selectedType = 0
    var leagueID:Int?
    var subLeagueID:Int?
    var groupID:Int?
    var viewModel = LeagueViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetting()
    }
    
    
    func initialSetting(){
        //configureLottieAnimation()
        if HomeCategoryViewController.selectedSport == .basketball{
            types = ["League / Cup Information".localized]
        }
        collectionViewTypes.registerCell(identifier: "SelectionCollectionViewCell")
        tableViewLeague.register(UINib(nibName: "LeagueTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        collectionViewTypes.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .left)
        collectionViewHeadings.registerCell(identifier: "TitleCollectionViewCell")
        tableViewStandings.register(UINib(nibName: "StandingsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableViewRareStandings.register(UINib(nibName: "GeneralRowTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableViewRareStandings.register(UINib(nibName: "LeagueHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "headerCell")
        
        tableViewStandingsObserver = tableViewStandings.observe(\.contentSize, options: .new) { (_, change) in
            guard let height = change.newValue?.height else { return }
            self.tableViewStandingsHeight.constant = height
        }
        
        tableViewLeagueObserver = tableViewLeague.observe(\.contentSize, options: .new) { (_, change) in
            guard let height = change.newValue?.height else { return }
            self.tableViewLeagueHeight.constant = height
        }
        
        tableViewRareStandingsObserver = tableViewRareStandings.observe(\.contentSize, options: .new) { (_, change) in
            guard let height = change.newValue?.height else { return }
            self.tableViewRareStandingsHeight.constant = height
        }
        
        
        //Calculating cell widths for headings1
        headerSizes = [40,85,15,15,15,15,15,15,20,25]
        var itemSpacing:CGFloat = CGFloat((headings.count - 1) * 5)
        var total_widths:CGFloat = headerSizes.reduce(0, +)
        var totalSpace:CGFloat = total_widths + itemSpacing
        var balance = (UIScreen.main.bounds.width - totalSpace)/CGFloat(headings.count)
        headerSizes = headerSizes.map{$0+balance}
        
        //Calculating cell widths for secondHeadings
        secondHeaderSizes = [40,85,15,15,15,15,15,15,20]
         itemSpacing = CGFloat((secondHeadings.count - 1) * 5)
         total_widths = secondHeaderSizes.reduce(0, +)
         totalSpace = total_widths + itemSpacing
         balance = (UIScreen.main.bounds.width - totalSpace)/CGFloat(secondHeadings.count)
        secondHeaderSizes = secondHeaderSizes.map{$0+balance}
        
        viewModel.delegate = self
        if HomeCategoryViewController.selectedSport == .soccer{
        viewModel.getLeagueDetails(id: leagueID ?? 0, subID: subLeagueID ?? 0, grpID: groupID ?? 0)
        }
        else{
            viewModel.fetchBasketballLeagueDetails(id: leagueID ?? 0)
        }
    }
    
    func setupBasketballLeagueDetails(){
        tableViewLeague.reloadData()
        imgLogo.setImage(with: viewModel.basketballLeague?.leagueData?.first?.logo, placeholder: Utility.getPlaceHolder())
        lblRule.text = viewModel.basketballLeague?.leagueData?.first?.ruleEn
        if viewModel.basketballLeague?.leagueData?.first?.ruleEn?.trim().count ?? 0 == 0{
            ruleView.isHidden = true
        }
    }
    
    func setupDetails(){
        tableViewStandings.reloadData()
        tableViewRareStandings.reloadData()
        tableViewLeague.reloadData()
        imgLogo.setImage(with: viewModel.leaguDetails?.leagueData01?.first?.leagueLogo, placeholder: Utility.getPlaceHolder())
        switch Utility.getCurrentLang(){
        case "en":
            lblRule.text = viewModel.leaguDetails?.leagueData04?.first?.ruleEn
            if viewModel.leaguDetails?.leagueData04?.first?.ruleEn?.trim().count ?? 0 == 0{
                ruleView.isHidden = true
            }
            
        case "cn":
            lblRule.text = viewModel.leaguDetails?.leagueData04?.first?.ruleCn
            if viewModel.leaguDetails?.leagueData04?.first?.ruleCn?.trim().count ?? 0 == 0{
                ruleView.isHidden = true
            }
            
        case "id":
            lblRule.text = viewModel.leaguDetails?.leagueData04?.first?.ruleId
            if viewModel.leaguDetails?.leagueData04?.first?.ruleId?.trim().count ?? 0 == 0{
                ruleView.isHidden = true
            }
            
        case "vi":
            lblRule.text = viewModel.leaguDetails?.leagueData04?.first?.ruleVi
            if viewModel.leaguDetails?.leagueData04?.first?.ruleVi?.trim().count ?? 0 == 0{
                ruleView.isHidden = true
            }
        case "th":
            lblRule.text = viewModel.leaguDetails?.leagueData04?.first?.ruleTh
            if viewModel.leaguDetails?.leagueData04?.first?.ruleTh?.trim().count ?? 0 == 0{
                ruleView.isHidden = true
            }
           
        default:
            break
        
        
        }
        
        if viewModel.isNormalStanding{
            tableViewRareStandings.isHidden = true
            if viewModel.normalStandings?.totalStandings?.isEmpty ?? true{
                normalStandingsStack.isHidden = true
                //emptyView.isHidden = false
                
            }
            else{
               // emptyView.isHidden = true
                normalStandingsStack.isHidden = false
                
            }
        }
        else{
            normalStandingsStack.isHidden = true
            
            if viewModel.leaguStanding?.list?.first?.score?.first?.groupScore?.isEmpty ?? true{
                tableViewRareStandings.isHidden = true
                //emptyView.isHidden = false
            }
            else{
                //emptyView.isHidden = true
                tableViewRareStandings.isHidden = false
                
            }
        }
    }
    
    func setupViews(){
        if selectedType == 0{
            standingsStack.isHidden = true
            leagueStack.isHidden = false
        }
        else{
            leagueStack.isHidden = true
            standingsStack.isHidden = false
            
        }
    }
    
    func configureLottieAnimation(){
//        animationView.contentMode = .scaleAspectFit
//        animationView.loopMode = .loop
//        animationView.animationSpeed = 0.5
//        animationView.play()
        
    }

}



extension LeagueViewController:LeagueViewModelProtocol{
    func didFinishFetchBasketballLeague() {
        //animationView.stop()
        emptyView.isHidden = true
        setupBasketballLeagueDetails()
    }
    
    
    func didFinishFetch() {
       // animationView.stop()
        emptyView.isHidden = true
        setupDetails()
    }
}

extension LeagueViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewTypes{
            return types.count
        }
        else{
            return headings.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewTypes{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectionCollectionViewCell", for: indexPath) as! SelectionCollectionViewCell
            cell.lblTitle.text = types[indexPath.row]
            cell.selectionColor = UIColor(named: "blue8")!
        cell.titleColor1 = .black
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCollectionViewCell", for: indexPath) as! TitleCollectionViewCell
            cell.titleType = .RedHeader
            cell.lblTitle.text = headings[indexPath.row]
            return cell
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewTypes{
        selectedType = indexPath.row
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            if HomeCategoryViewController.selectedSport == .soccer{
        viewModel.getLeagueDetails(id: leagueID!, subID: subLeagueID!, grpID: groupID!)
            }
            else{
                viewModel.fetchBasketballLeagueDetails(id: leagueID!)
            }
            setupViews()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewTypes{
            if HomeCategoryViewController.selectedSport == .soccer{
        let w = (UIScreen.main.bounds.width - 30) / 2
            if indexPath.row == 0{
                return CGSize(width: w-10, height: 35)
            }
            else{
                let strW = "Match".localized.width(forHeight: 19, font: UIFont(name: "Roboto-Regular", size: 19)!)
               let width2 = strW + 16
              return CGSize(width: width2, height: 35)
            }
            }
            else{
                let w = UIScreen.main.bounds.width - 15
                return CGSize(width: w, height: 35)
            }
        }
        else{
            return CGSize(width: headerSizes[indexPath.row], height: 55)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
    
   
    
    
}

extension LeagueViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == tableViewRareStandings{
            return viewModel.leaguStanding?.list?.first?.score?.first?.groupScore?.count ?? 0
        }
        else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViewLeague{
            return viewModel.leagueInfoArray?.count ?? 0
        }
        else if tableView == tableViewStandings{
            return viewModel.normalStandings?.totalStandings?.count ?? 0
        }
        else{
            return (viewModel.leaguStanding?.list?.first?.score?.first?.groupScore?[section].scoreItems?.count ?? 0) + 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableViewLeague{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LeagueTableViewCell
        cell.configureCell(obj: viewModel.leagueInfoArray?[indexPath.row])
        return cell
        }
        else if tableView == tableViewStandings{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! StandingsTableViewCell
            //cell.cellIndex = indexPath.row
            cell.headerSizes = headerSizes
           
                let standings = viewModel.getTeamRowByIndex(index: indexPath.row)
                let results = viewModel.getResultsArrayByIndex(index: indexPath.row)
                let percentageStr = viewModel.getResultsPercentageStringByIndex(index: indexPath.row)
                cell.configureTeamStandings(index: indexPath.row, standings: standings, results: results, resultsPercentage: percentageStr)
           
            cell.callReloadCell = {
                tableView.reloadRows(at: [indexPath], with: .none)
            }
            
            
            return cell
        }
        
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! GeneralRowTableViewCell
            if indexPath.row == 0{
                cell.headerSizes = secondHeaderSizes
                cell.titleType = .RedHeader
                cell.backgroundColor = UIColor(named: "red2")
                cell.values = secondHeadings
            }
            else{
            cell.headerSizes = secondHeaderSizes
                cell.titleType = .Normal
                cell.backgroundColor = .clear
            cell.values = viewModel.getRareStandingRowByIndex(section: indexPath.section, row: indexPath.row-1)
            }
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == tableViewRareStandings{
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! LeagueHeaderTableViewCell
            cell.lblTitle.text = viewModel.getGroupName(section: section)
            return cell
        }
        else{
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == tableViewRareStandings{
            return 40
        }
        else{
            return CGFloat.leastNormalMagnitude
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    
}
