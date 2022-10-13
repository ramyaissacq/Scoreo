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
    var headers = ["News".localized,"Highlights".localized]
    var selectedHeaderIndex = 0
    var viewModel = NewsViewModel()
    var newsPage = 1
    var videoPage = 1
    var refreshControl:UIRefreshControl?
    let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 250, height: 40))
    var isSerchMode = false
    override func viewDidLoad() {
        super.viewDidLoad()
        intialSettings()
    }

    func setupNavBar(){
        isSerchMode = false
        let lbl = getHeaderLabel(title: "News".localized)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: lbl)
        let searchBtn = getButton(image: UIImage(named: "searchWhite")!)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchBtn)
        searchBtn.addTarget(self, action: #selector(actionSearch), for: .touchUpInside)
        self.navigationItem.titleView = nil
        
        
    }
    
    @objc func actionSearch(){
       resetNavBar()
    }
    
    func resetNavBar(){
        isSerchMode = true
        let backBtn = getButton(image: UIImage(named: "back")!)
        backBtn.addTarget(self, action: #selector(backBtnClick), for: .touchUpInside)
        searchBar.searchTextField.textColor = .white
        searchBar.placeholder = "Search".localized
        searchBar.delegate = self
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
        self.navigationItem.titleView = searchBar
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: UIView())
        
        
    }
    
    @objc func backBtnClick(){
        setupNavBar()
        
    }
    
    func intialSettings(){
        setupNavBar()
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
    
    
    
    func setupViews(){
        
        tableViewNews.reloadData()
        if isSerchMode{
            searchBar.text = ""
            actionCancelSearch()
        }
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
    filterLists()
    if viewModel.newsList?.count ?? 0 > 0{
        emptyView.isHidden = true
    }
    else{
        emptyView.isHidden = false
    }
    
}

func didFinishFetchVideos() {
    videoPage += 1
    filterLists()
    if viewModel.videoList?.count ?? 0 > 0{
        emptyView.isHidden = true
    }
    else{
        emptyView.isHidden = false
    }
    
}
    
    func filterLists(){
        if isSerchMode{
            if selectedHeaderIndex == 0{
                self.viewModel.newsList?.removeAll()
                self.viewModel.newsList = self.viewModel.originalNewsList?.filter{$0.title?.lowercased().contains(searchBar.text?.lowercased() ?? "") ?? false}
                
            }
            else{
                self.viewModel.videoList?.removeAll()
                self.viewModel.videoList = self.viewModel.originalVideoList?.filter{$0.title?.contains(searchBar.text ?? "") ?? false}
            }
            
        }
        else{
            if selectedHeaderIndex == 0{
            self.viewModel.newsList = self.viewModel.originalNewsList
            }
            else{
                self.viewModel.videoList = self.viewModel.originalVideoList
            }
        }
        tableViewNews.reloadData()
        
    }
}

