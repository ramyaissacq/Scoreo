//
//  NewsViewController.swift
//  775775Sports
//
//  Created by Remya on 9/2/22.
//

import UIKit

class NewsViewController: BaseViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var collectionViewHeader: UICollectionView!
    
    @IBOutlet weak var tableViewNews: UITableView!
    
    @IBOutlet weak var headerView1: UIView!
    
    @IBOutlet weak var headerView2: UIView!
   
    
    @IBOutlet weak var emptyView: UIView!
    //MARK: - Variables
    var collectionViewNewsObserver: NSKeyValueObservation?
    var headers = ["News".localized,"Video".localized]
    var selectedHeaderIndex = 0
    var viewModel = NewsViewModel()
    var newsPage = 1
    var videoPage = 1
    var refreshControl:UIRefreshControl?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        intialSettings()
    }

    func setupNavBar(){
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        btn.setImage(UIImage(named: "menu"), for: .normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
    }
    
    func intialSettings(){
        setupTopBar()
        collectionViewHeader.registerCell(identifier: "SelectionCollectionViewCell")
        tableViewNews.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableViewNews.register(UINib(nibName: "HeighlightsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell1")
        tableViewNews.register(UINib(nibName: "LoaderTableViewCell", bundle: nil), forCellReuseIdentifier: "loaderCell")
        collectionViewHeader.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .left)
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = .clear
        refreshControl?.addTarget(self, action: #selector(refreshViews), for: .valueChanged)
        tableViewNews.refreshControl = refreshControl
        setupViews()
        viewModel.delegate = self
        viewModel.getNews(page: newsPage)
        viewModel.getVideos(page: videoPage)
        
        
    }
    
    func setupTopBar(){
        let lbl = getHeaderLabel(title: "News".localized)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: lbl)
        let btn = getButton(image: UIImage(named: "searchWhite")!)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
        
    }
    
    func setupViews(){
        
        tableViewNews.reloadData()
    }
    
    @objc func refreshViews(){
        newsPage = 1
        videoPage = 1
        viewModel.getNews(page: newsPage)
        viewModel.getVideos(page: videoPage)
    }

}

//MARK: NewsViewModelDelegates
extension NewsViewController:NewsViewModelDelegates{
    
func didFinishFetchNews() {
    newsPage += 1
    tableViewNews.reloadData()
    if viewModel.newsList?.count ?? 0 > 0{
        emptyView.isHidden = true
    }
    else{
        emptyView.isHidden = false
    }
    
}

func didFinishFetchVideos() {
    videoPage += 1
    tableViewNews.reloadData()
    if viewModel.videoList?.count ?? 0 > 0{
        emptyView.isHidden = true
    }
    else{
        emptyView.isHidden = false
    }
    
}
}

