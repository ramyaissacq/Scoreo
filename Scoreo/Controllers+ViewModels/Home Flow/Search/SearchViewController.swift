//
//  SearchViewController.swift
//  775775Sports
//
//  Created by Remya on 9/17/22.
//

import UIKit

class SearchViewController: BaseViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var searchBar:UISearchBar!
    @IBOutlet weak var tableView:UITableView!
    
    //MARK: - Variables
    
    var viewModel = HomeVieModel()
    var page = 1
    var selectedSport = SportsType.soccer
    var selectedTimeIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettings()

    }
    
    func initialSettings(){
        setTitle(title: "Search".localized)
        setBackButton()
        tableView.register(UINib(nibName: "ScoresTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.register(UINib(nibName: "LoaderTableViewCell", bundle: nil), forCellReuseIdentifier: "loaderCell")
        searchBar.searchTextField.textColor = .white
        viewModel.delegate = self
        
    }
    
    func gotoWebview(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewViewController") as! WebViewViewController
        self.navigationController?.pushViewController(vc, animated: true)
        searchBar.text = ""
        searchBar.endEditing(true)
    }
    
}

extension SearchViewController:HomeViewModelDelegate{
    
    func diFinisfFetchMatches() {
        page += 1
        doSearch(searchText: searchBar.text ?? "")
        
    }
    
    
    
    
}

//MARK: - Searchbar Delegates
extension SearchViewController:UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.trim() != ""{
            if searchText.lowercased() == HomeViewController.urlDetails?.key.lowercased(){
                gotoWebview()
            }
            else{
            doSearch(searchText: searchText)
            }
        }
        else{
            if selectedSport == .soccer{
            self.viewModel.matches?.removeAll()
            }
            else{
                self.viewModel.basketballMatches?.removeAll()
            }
            tableView.reloadData()
        }
        
    }
    
    func doSearch(searchText:String){
        if selectedSport == .soccer{
        self.viewModel.matches?.removeAll()
        self.viewModel.matches = self.viewModel.originals?.filter{($0.leagueName?.lowercased().contains(searchText.lowercased()) ?? false) || ($0.homeName?.lowercased().contains(searchText.lowercased()) ?? false) || ($0.awayName?.lowercased().contains(searchText.lowercased()) ?? false)}
        }
        else{
            self.viewModel.basketballMatches?.removeAll()
            self.viewModel.basketballMatches = self.viewModel.originaBasketballMatches?.filter{($0.leagueNameEn?.lowercased().contains(searchText.lowercased()) ?? false) || ($0.homeTeamEn?.lowercased().contains(searchText.lowercased()) ?? false) || ($0.awayTeamEn?.lowercased().contains(searchText.lowercased()) ?? false)}
        }
        tableView.reloadData()
    }
    
    
}

//MARK: - TableView Delegates
extension SearchViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedSport == .soccer{
        return self.viewModel.matches?.count ?? 0
        }
        else{
            return self.viewModel.basketballMatches?.count ?? 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if selectedSport == .soccer{
        if indexPath.row == (self.viewModel.matches?.count ?? 0) - 1{
            if (viewModel.pageData?.lastPage ?? 0) > page{
                viewModel.getMatchesList(page: page)
                let cell = tableView.dequeueReusableCell(withIdentifier: "loaderCell", for: indexPath) as! LoaderTableViewCell
                cell.activity.startAnimating()
                return cell
            }
        }
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ScoresTableViewCell
        cell.callIndexSelection = {
            self.goToCategory(index: indexPath.row, category: .index)
        }
        
        cell.callAnalysisSelection = {
            self.goToCategory(index: indexPath.row, category: .analysis)
        }
        
        cell.callEventSelection = {
            self.goToCategory(index: indexPath.row, category: .event)
            
        }
        cell.callBriefingSelection = {
            self.goToCategory(index: indexPath.row, category: .breifing)
            
        }
        cell.callLeagueSelection = {
            self.goToCategory(index: indexPath.row, category: .league)
        }
        if selectedSport == .soccer{
        cell.configureCell(obj: self.viewModel.matches?[indexPath.row],timeIndex: selectedTimeIndex)
        }
        else{
            cell.configureCell(obj: self.viewModel.basketballMatches?[indexPath.row], timeIndex: selectedTimeIndex)
        }
        return cell
        
    }
    
    func goToCategory(index:Int,category:HomeCategory){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeCategoryViewController") as! HomeCategoryViewController
        var obj:MatchList?
        var basketMatch:BasketballMatchList?
        
        if selectedSport == .soccer{
            obj = viewModel.matches?[index]
        HomeCategoryViewController.matchID = obj?.matchId
        }
        else{
            basketMatch = viewModel.basketballMatches?[index]
            HomeCategoryViewController.matchID = basketMatch?.matchId
        }
        vc.selectedMatch =  obj
        vc.selectedCategory = category
        vc.basketMatch = basketMatch
        HomeCategoryViewController.selectedSport = selectedSport
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
   
    
}
