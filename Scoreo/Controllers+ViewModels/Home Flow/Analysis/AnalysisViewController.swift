//
//  AnalysisViewController.swift
//  775775Sports
//
//  Created by Remya on 9/12/22.
//

import UIKit
import Lottie

class AnalysisViewController: UIViewController {
    
    @IBOutlet weak var tableViewAnalysis: UITableView!
    
    @IBOutlet weak var lblEmpty: UILabel!
   // @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var emptyView: UIView!
    var headerSizes = [CGFloat]()
    var viewModel = AnalysisViewModel()
    var sectionHeaders = ["Head to head".localized,"Home Team Recent Matches".localized,"Away Team Recent Matches".localized,"Home Team Odds".localized,"Away Team Odds".localized]
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()

        // Do any additional setup after loading the view.
    }
    
    func initialSetup(){
        tableViewAnalysis.register(UINib(nibName: "AnalysisHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "header")
        tableViewAnalysis.register(UINib(nibName: "AnalysisFooterTableViewCell", bundle: nil), forCellReuseIdentifier: "footer")
        tableViewAnalysis.register(UINib(nibName: "AnalysisOddsTableViewCell", bundle: nil), forCellReuseIdentifier: "oddCell")
        tableViewAnalysis.register(UINib(nibName: "AnalysisTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        viewModel.delegate = self
        
        if HomeCategoryViewController.selectedSport == .basketball{
            sectionHeaders = ["Head to head".localized,"Home Team Recent Matches".localized,"Away Team Recent Matches".localized]
            viewModel.fetchBasketballAnalysisData()
        }
        else{
        //Calculating cell widths for headings
        headerSizes = [65,36,30,30,30,30,42,33]
        let itemSpacing:CGFloat = CGFloat((headerSizes.count - 1) * 5)
        let total_widths:CGFloat = headerSizes.reduce(0, +)
        let totalSpace:CGFloat = total_widths + itemSpacing
        let balance = (UIScreen.main.bounds.width - totalSpace)/CGFloat(headerSizes.count)
        headerSizes = headerSizes.map{$0+balance}
        viewModel.fetchAnalysisData()
        }
       // configureLottieAnimation()
     
    }
    
    func configureLottieAnimation(){
//        animationView.contentMode = .scaleAspectFit
//        animationView.loopMode = .loop
//        animationView.animationSpeed = 0.5
//        animationView.play()
    }
   
}

extension AnalysisViewController:AnalysisViewModelDelegate{
    func didFinishBasketAnalysis() {
        tableViewAnalysis.reloadData()
       // animationView.stop()
        emptyView.isHidden = true
    }
    
    func didFinishFetch() {
        tableViewAnalysis.reloadData()
       // animationView.stop()
        emptyView.isHidden = true
    }
    
    
}

extension AnalysisViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeaders.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            if HomeCategoryViewController.selectedSport == .soccer{
            return viewModel.analysisData?.headToHead?.count ?? 0
            }
            else{
                return viewModel.basketAnalysis?.headToHead?.count ?? 0
            }
        case 1:
            if HomeCategoryViewController.selectedSport == .soccer{
            return viewModel.analysisData?.homeLastMatches?.count ?? 0
            }
            else{
                return viewModel.basketAnalysis?.homeLastMatches?.count ?? 0
            }
        case 2:
            if HomeCategoryViewController.selectedSport == .soccer{
            return viewModel.analysisData?.awayLastMatches?.count ?? 0
            }
            else{
                return viewModel.basketAnalysis?.awayLastMatches?.count ?? 0
            }
        case 3:
            return 6
        case 4:
            return 6
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 3 || indexPath.section == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "oddCell") as! AnalysisOddsTableViewCell
            cell.sizes = headerSizes
            if indexPath.section == 3{
                if viewModel.analysisData?.homeOdds?.count ?? 0 > indexPath.row{
                cell.configureCell(row: indexPath.row, data: viewModel.analysisData?.homeOdds?[indexPath.row].first ?? "")
                }
            }
            else{
                if viewModel.analysisData?.awayOdds?.count ?? 0 > indexPath.row{
                cell.configureCell(row: indexPath.row, data: viewModel.analysisData?.awayOdds?[indexPath.row].first ?? "")
                }
            }
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AnalysisTableViewCell
            var str = ""
            var obj:BasketballAnalysisData?
            if indexPath.section == 0{
                if HomeCategoryViewController.selectedSport == .soccer{
                str = viewModel.analysisData?.headToHead?[indexPath.row].first ?? ""
                }
                else{
                    obj = viewModel.basketAnalysis?.headToHead?[indexPath.row]
                }
            }
            else if indexPath.section == 1{
                if HomeCategoryViewController.selectedSport == .soccer{
                str = viewModel.analysisData?.homeLastMatches?[indexPath.row].first ?? ""
                }
                else{
                    obj = viewModel.basketAnalysis?.homeLastMatches?[indexPath.row]
                }
            }
            else if indexPath.section == 2{
                if HomeCategoryViewController.selectedSport == .soccer{
                str = viewModel.analysisData?.awayLastMatches?[indexPath.row].first ?? ""
                }
                else{
                    obj = viewModel.basketAnalysis?.awayLastMatches?[indexPath.row]
                }
            }
            if HomeCategoryViewController.selectedSport == .soccer{
            cell.configureCell(match: str)
            }
            else{
                cell.configureCell(obj: obj)
            }
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! AnalysisHeaderTableViewCell
        cell.lblTitle.text = sectionHeaders[section]
        return cell
    }
    

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    
}
