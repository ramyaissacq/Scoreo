//
//  IndexViewController.swift
//  775775Sports
//
//  Created by Remya on 9/7/22.
//

import UIKit
import Lottie
class IndexViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var collectionViewCategory: UICollectionView!
    
    @IBOutlet weak var collectionViewHeader: UICollectionView!
    
    @IBOutlet weak var tableViewIndex: UITableView!
    
    @IBOutlet weak var indexTableHeight: NSLayoutConstraint!
    
    @IBOutlet weak var lblEmpty: UILabel!
    @IBOutlet weak var emptyView: UIView!
   // @IBOutlet weak var animationView: AnimationView!
    //MARK: - Variables
    var tableViewIndexObserver: NSKeyValueObservation?
    var categories = ["Asia (Full)".localized,"1x2 (Full)".localized,"Over/Under(Full)".localized,"Asia(1st half)".localized,"Over/Under(1st half)".localized]
    var headers = ["Company".localized,"Home".localized,"Live Handicap".localized,"Away".localized,"Home".localized,"Live Handicap".localized,"Away".localized]
    var headerSizes = [CGFloat]()
    var categorySizes = [CGFloat]()
    var viewModel = IndexViewModel()
    var selectedCategoryIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()

    }
    
    func initialSetup(){
        
        
        if HomeCategoryViewController.selectedSport == .basketball{
            categories = ["Spread".localized,"Total".localized]
            headers = ["Company".localized,"Home".localized,"Full Handicap".localized,"Away".localized,"Home".localized,"Half Handicap".localized,"Away".localized,"Home".localized,"1Part Handicap".localized,"Away".localized]
        }
        collectionViewCategory.registerCell(identifier: "RoundSelectionCollectionViewCell")
        collectionViewHeader.registerCell(identifier: "TitleCollectionViewCell")
        collectionViewCategory.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .left)
        tableViewIndex.register(UINib(nibName: "GeneralRowTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableViewIndexObserver = tableViewIndex.observe(\.contentSize, options: .new) { (_, change) in
            guard let height = change.newValue?.height else { return }
            self.indexTableHeight.constant = height
        }
        
        //Calculating cell widths for headings
        headerSizes = [85,15,15,15,15,15,15]
        if HomeCategoryViewController.selectedSport == .basketball{
            headerSizes = [50,15,15,15,15,15,15,15,15,15]
        }
        let itemSpacing:CGFloat = CGFloat((headers.count - 1) * 5)
        let total_widths:CGFloat = headerSizes.reduce(0, +)
        let totalSpace:CGFloat = total_widths + itemSpacing
        let balance = (UIScreen.main.bounds.width - totalSpace)/CGFloat(headers.count)
        headerSizes = headerSizes.map{$0+balance}
        
        //calculating categorySizes
        for m in categories{
        let w = m.width(forHeight: 14, font: UIFont(name: "Roboto-Regular", size: 12)!) + 16
            categorySizes.append(w)
    
        }
        
        viewModel.delegate = self
        if HomeCategoryViewController.selectedSport == .soccer{
        viewModel.getIndexData()
        }
        else{
        viewModel.getBasketballIndexData()
        }
        
    }
    
    func configureLottieAnimation(){
//        animationView.contentMode = .scaleAspectFit
//        animationView.loopMode = .loop
//        animationView.animationSpeed = 0.5
//        animationView.play()
//        
    }
    
 
}


extension IndexViewController:IndexViewModelDelgate{
    func didFinishBasketIndexFetch() {
        viewModel.filterBasketballScores(index: selectedCategoryIndex)
        self.tableViewIndex.reloadData()
        if !viewModel.basketBallCurrent.isEmpty{
            //animationView.stop()
            emptyView.isHidden = true
        }
    }
    
    func didFinishFetch() {
        viewModel.filterData(index: selectedCategoryIndex)
        self.tableViewIndex.reloadData()
        if !viewModel.currentScores.isEmpty{
           //animationView.stop()
            emptyView.isHidden = true
        }
    }
    
    
}

extension IndexViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewCategory{
            return categories.count
        }
        else{
            return headers.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewCategory{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoundSelectionCollectionViewCell", for: indexPath) as! RoundSelectionCollectionViewCell
            cell.lblTite.text = categories[indexPath.row]
        return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCollectionViewCell", for: indexPath) as! TitleCollectionViewCell
            cell.titleType = .GrayHeader
            cell.lblTitle.text = headers[indexPath.row]
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewCategory{
            selectedCategoryIndex = indexPath.row
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            if HomeCategoryViewController.selectedSport == .soccer{
            viewModel.filterData(index: selectedCategoryIndex)
            }
            else{
                viewModel.filterBasketballScores(index: selectedCategoryIndex)
            }
            self.tableViewIndex.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewHeader{
            return CGSize(width: headerSizes[indexPath.row], height: 75)
        }
        else{
            if categorySizes.count > indexPath.row{
            return CGSize(width: categorySizes[indexPath.row], height: 55)
            }
            else{
                return CGSize(width: 137, height: 55)
                
            }
        }
    }
    
    
}

extension IndexViewController:UITableViewDelegate,UITableViewDataSource{
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if HomeCategoryViewController.selectedSport == .soccer{
    return viewModel.currentScores.count
    }
    else{
        return viewModel.basketBallCurrent.count
    }
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! GeneralRowTableViewCell
    cell.headerSizes = headerSizes
    if HomeCategoryViewController.selectedSport == .soccer{
    cell.values = viewModel.currentScores[indexPath.row].getArrayValue()
    }
    else{
        cell.values = viewModel.basketBallCurrent[indexPath.row]
    }
    return cell
}
}

