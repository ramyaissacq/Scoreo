//
//  Extensions+HomeViewController.swift
//  775775Sports
//
//  Created by Remya on 9/21/22.
//

import Foundation
import UIKit

extension HomeViewController:HomeViewModelDelegate{
    func didFinishFetchMatchDetails() {
        setupHilightsDisplay()
    }
    
    func didFinishFetchBasketballScoreDetails() {
        setupHilightsDisplay()
    }
    
    func didFinishFetchBasketballRecentMatches() {
        prepareDisplays()
    }
    
    func didFinishFetchBasketballScores() {
        leagueDropDown?.dataSource = ["All Leagues".localized]
        lblLeague.text = "All Leagues".localized
        viewModel.filterBasketballMatches(type: selectedType)
        prepareDisplays()
    }
    
    func didFinishFilterByLeague() {
        prepareDisplays()
    }
    
    func didFinishFetchRecentMatches() {
        
        prepareDisplays()
    }
    
    func getCurrentPage() -> Int {
        return page
    }
    
    func diFinisfFetchMatches() {
        page += 1
        viewModel.filterMatches(type: selectedType)
        let frequency = Int(HomeViewController.urlDetails?.promptFrequency ?? "") ?? 0
        if frequency > 0{
            var arr:[String] = viewModel.scoreResponse?.todayHotLeague?.map{$0.leagueName ?? ""} ?? []
            arr.insert("All Leagues".localized, at: 0)
            self.leagueDropDown?.dataSource = arr
            self.lblLeague.text = arr.first
        }
        else{
            leagueDropDown?.dataSource = ["All Leagues".localized]
            lblLeague.text = "All Leagues".localized
        }
        
        
        prepareDisplays()
        
    }
    
    func prepareDisplays(){
        tableView.reloadData()
        if selectedSportsType == .soccer{
            if viewModel.matches?.count ?? 0 > 0{
                animationView.stop()
                noDataView.isHidden = true
            }
            else{
                animationView.play()
                noDataView.isHidden = false
            }
        }
        else{
            if viewModel.basketballMatches?.isEmpty ?? true{
                animationView.play()
                noDataView.isHidden = false
                
            }
            else{
                animationView.stop()
                noDataView.isHidden = true
            }
            
        }
    }
    
}

extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewTime{
            return timeArray.count
        }
        else if collectionView == collectionViewCategory{
            return viewModel.categories.count
        }
        else{
            if selectedSportsType == .soccer{
                return AppPreferences.getMatchHighlights().count
            }
            else{
                return AppPreferences.getBasketBallHighlights().count
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewTime{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectionCollectionViewCell", for: indexPath) as! SelectionCollectionViewCell
            cell.underLineLeading.constant = 0
            cell.underLineTrailing.constant = 0
            cell.lblTitle.text = timeArray[indexPath.row]
            return cell
        }
        else if collectionView == collectionViewCategory{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoundSelectionCollectionViewCell", for: indexPath) as! RoundSelectionCollectionViewCell
            cell.configureCell(unselectedViewColor: .clear, selectedViewColor: Colors.appVioletColor(), unselectedTitleColor: Colors.newGrayColor2(), selectedTitleColor: .white, title: viewModel.categories[indexPath.row])
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HighlightsCollectionViewCell", for: indexPath) as! HighlightsCollectionViewCell
            let matches = AppPreferences.getMatchHighlights()
            let basketMatches = AppPreferences.getBasketBallHighlights()
            cell.callDeletion = {
                if self.selectedSportsType == .soccer{
                    self.deleteHilights(id: matches[indexPath.row].matchId ?? 0)
                }
                else{
                    self.deleteHilights(id: basketMatches[indexPath.row].matchId ?? 0)
                    
                }
            }
            if selectedSportsType == .soccer{
                cell.configureCell(obj: matches[indexPath.row])
            }
            else{
                cell.configureCell(obj: basketMatches[indexPath.row])
            }
            cell.scoresView.callBackIndex = {
                if self.selectedSportsType == .soccer{
                    self.goToCategory(obj:matches[indexPath.row], basketMatch: nil, category: .index)
                }
                else{
                    self.goToCategory(obj:nil, basketMatch: basketMatches[indexPath.row], category: .index)
                    
                }
            }
            
            cell.scoresView.callBackAnalysis = {
                if self.selectedSportsType == .soccer{
                    self.goToCategory(obj:matches[indexPath.row], basketMatch: nil, category: .analysis)
                }
                else{
                    self.goToCategory(obj:nil, basketMatch: basketMatches[indexPath.row], category: .index)
                    
                }
                
            }
            cell.scoresView.callBackLeague = {
                if self.selectedSportsType == .soccer{
                    self.goToCategory(obj:matches[indexPath.row], basketMatch: nil, category: .league)
                }
                else{
                    self.goToCategory(obj:nil, basketMatch: basketMatches[indexPath.row], category: .index)
                    
                }
                
            }
            cell.scoresView.callBackEvent = {
                if self.selectedSportsType == .soccer{
                    self.goToCategory(obj:matches[indexPath.row], basketMatch: nil, category: .event)
                }
                else{
                    self.goToCategory(obj:nil, basketMatch: basketMatches[indexPath.row], category: .index)
                    
                }
                
            }
            cell.scoresView.callBackBreifing = {
                if self.selectedSportsType == .soccer{
                    self.goToCategory(obj:matches[indexPath.row], basketMatch: nil, category: .breifing)
                }
                else{
                    self.goToCategory(obj:nil, basketMatch: basketMatches[indexPath.row], category: .index)
                    
                }
                
            }
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewTime{
            handleTimeSelection(index: indexPath.row)
            
        }
        else if collectionView == collectionViewCategory{
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            if selectedTimeIndex == 0{
                selectedType = indexPath.row
                if selectedSportsType == .soccer{
                    viewModel.filterMatches(type: selectedType)
                }
                else{
                    viewModel.filterBasketballMatches(type: selectedType)
                }
                prepareDisplays()
            }
            else{
                selectedDate = viewModel.categories[indexPath.row]
                if self.selectedSportsType == .soccer{
                    viewModel.getRecentMatches(date: selectedDate)
                }
                else{
                    viewModel.getBasketballRecentMatches(date: selectedDate)
                }
                
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewTime{
            let width:CGFloat = CGFloat((UIScreen.main.bounds.width - 50)/3)
            return CGSize(width: width, height: 40)
        }
        else if collectionView == collectionViewCategory{
            if categorySizes.count == 0{
                calculateCategorySizes()
            }
            if selectedTimeIndex == 0{
                var  spacing:CGFloat = CGFloat(15 * (viewModel.categories.count - 1))
                spacing = spacing + 30
                let width:CGFloat = (UIScreen.main.bounds.width - spacing)/CGFloat(viewModel.categories.count)
                return CGSize(width: width, height: 20)
            }
            return CGSize(width: categorySizes[indexPath.row], height: 20)
        }
        else{
            let w = UIScreen.main.bounds.width - 10
            if selectedSportsType == .soccer{
                return CGSize(width: w, height: 180)
            }
            else{
                return CGSize(width: w, height: 263)
            }
        }
        
    }
    
    //calculating categorySizes
    func calculateCategorySizes(){
        for m in viewModel.categories{
            let w = m.width(forHeight: 12, font: UIFont(name: "Roboto-Regular", size: 12)!) + 16
            categorySizes.append(w)
        }
    }
    
    
    func deleteHilights(id:Int){
        if longPressId == nil{
            longPressId = id
            Dialog.openConfirmationDialog(title: "Delete Hilight".localized, message: "Do you want to remove this match from hilights?".localized) {
                if self.selectedSportsType == .soccer{
                    
                    if AppPreferences.getMatchHighlights().contains(where: {$0.matchId == id}){
                        
                        AppPreferences.removeFromHilights(id: id)
                    }
                }
                
                else{
                    if AppPreferences.getBasketBallHighlights().contains(where: {$0.matchId == id}){
                        AppPreferences.removeBasketballhilight(id: id)
                    }
                }
                self.setupHilightsDisplay()
                self.longPressId = nil
            } dismissed: {
                self.longPressId = nil
            }
        }
    }
    
    
}


extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getModelCount(sport: selectedSportsType)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (selectedSportsType == .soccer) && (selectedTimeIndex == 0){
            if indexPath.row == viewModel.getModelCount(sport: selectedSportsType)-1 && selectedLeagueID == nil{
                if page <= (viewModel.pageData?.lastPage ?? 0){
                    viewModel.getMatchesList(page: page)
                    let cell = tableView.dequeueReusableCell(withIdentifier: "loaderCell", for: indexPath) as! LoaderTableViewCell
                    cell.activity.startAnimating()
                    return cell
                }
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ScoresTableViewCell
        cell.callIndexSelection = {
            if self.selectedSportsType == .soccer{
                self.goToCategory(obj:self.viewModel.matches?[indexPath.row], basketMatch: nil, category: .index)
            }
            else{
                self.goToCategory(obj:nil, basketMatch: self.viewModel.basketballMatches?[indexPath.row], category: .index)
            }
        }
        
        cell.callAnalysisSelection = {
            if self.selectedSportsType == .soccer{
                self.goToCategory(obj:self.viewModel.matches?[indexPath.row], basketMatch: nil, category: .analysis)
            }
            else{
                self.goToCategory(obj:nil, basketMatch: self.viewModel.basketballMatches?[indexPath.row], category: .analysis)
            }
        }
        
        cell.callEventSelection = {
            if self.selectedSportsType == .soccer{
                self.goToCategory(obj:self.viewModel.matches?[indexPath.row], basketMatch: nil, category: .event)
            }
            else{
                self.goToCategory(obj:nil, basketMatch: self.viewModel.basketballMatches?[indexPath.row], category: .event)
            }
            
        }
        cell.callBriefingSelection = {
            if self.selectedSportsType == .soccer{
                self.goToCategory(obj:self.viewModel.matches?[indexPath.row], basketMatch: nil, category: .breifing)
            }
            else{
                self.goToCategory(obj:nil, basketMatch: self.viewModel.basketballMatches?[indexPath.row], category: .breifing)
            }
            
        }
        cell.callLeagueSelection = {
            if self.selectedSportsType == .soccer{
                self.goToCategory(obj:self.viewModel.matches?[indexPath.row], basketMatch: nil, category: .league)
            }
            else{
                self.goToCategory(obj:nil, basketMatch: self.viewModel.basketballMatches?[indexPath.row], category: .league)
            }
            
        }
        cell.callLongPress = {
            self.showMatchOptions(row: indexPath.row)
            
        }
        
        if selectedSportsType == .soccer{
            cell.configureCell(obj: viewModel.matches?[indexPath.row],timeIndex: selectedTimeIndex)
        }
        else{
            cell.configureCell(obj: viewModel.basketballMatches?[indexPath.row], timeIndex: selectedTimeIndex)
        }
        return cell
        
    }
    
    func goToCategory(obj:MatchList?,basketMatch:BasketballMatchList?,category:HomeCategory){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeCategoryViewController") as! HomeCategoryViewController
        if selectedSportsType == .soccer{
            HomeCategoryViewController.matchID = obj?.matchId
        }
        else{
            HomeCategoryViewController.matchID = basketMatch?.matchId
        }
        vc.selectedMatch =  obj
        vc.selectedCategory = category
        vc.basketMatch = basketMatch
        HomeCategoryViewController.selectedSport = selectedSportsType
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func showMatchOptions(row:Int){
        if longPressId == nil{
            longPressId = row
            var obj:MatchList?
            var basketObj:BasketballMatchList?
            if self.selectedSportsType == .soccer{
                obj = viewModel.matches?[row]
            }
            else{
                basketObj = viewModel.basketballMatches?[row]
            }
            Dialog.openMatchOptionsDialog {
                self.longPressId = nil
                
                var matchDate = Utility.getSystemTimeZoneTime(dateString: obj?.matchTime ?? "")
                if self.selectedSportsType == .basketball{
                    matchDate = Utility.getSystemTimeZoneTime(dateString: basketObj?.matchTime ?? "")
                }
                if matchDate > Date(){
                    if self.selectedSportsType == .soccer{
                        Utility.scheduleLocalNotification(date: matchDate, subTitle: obj?.leagueName ?? "", body: "Match \(obj?.homeName ?? "") Vs \(obj?.awayName ?? "") will start now") {
                            DispatchQueue.main.async {
                                Utility.showSuccessSnackView(message: "Reminder saved successfully".localized, iconName: "")
                                
                            }
                        } failed: {
                            DispatchQueue.main.async {
                                Utility.showErrorSnackView(message: "Unable to Add Reminder".localized)
                                
                            }
                            
                        }
                    }
                    else{
                        Utility.scheduleLocalNotification(date: matchDate, subTitle: basketObj?.leagueNameEn ?? "", body: "Match \(basketObj?.homeTeamNameEn ?? "") Vs \(basketObj?.awayTeamNameEn ?? "") will start now"){
                            DispatchQueue.main.async {
                                Utility.showSuccessSnackView(message: "Reminder saved successfully".localized, iconName: "")
                                
                            }
                            
                        } failed: {
                            DispatchQueue.main.async {
                                Utility.showErrorSnackView(message: "Unable to Add Reminder".localized)
                                
                            }
                            
                        }
                    }
                }
                else{
                    
                    Utility.showErrorSnackView(message: "Please choose upcoming matches".localized)
                    
                }
                
            } callHighlights: {
                self.longPressId = nil
                if self.selectedSportsType == .soccer{
                    if obj != nil{
                        AppPreferences.addToHighlights(obj: obj!)
                    }
                }
                else{
                    if basketObj != nil{
                        AppPreferences.addToBasketballHighlights(obj: basketObj!)
                    }
                }
                self.setupHilightsDisplay()
                
                
            } callPin: {
                self.longPressId = nil
                //            AppPreferences.addToPinlist(obj: obj)
                //            self.setupTimerForpinRefresh()
                //            self.setupTimerForPinAlert()
                
            } callClose: {
                self.longPressId = nil
            }
        }
        
    }
    
    func setupHilightsDisplay(){
        self.collectionViewHighlights.reloadData()
        if selectedSportsType == .soccer{
            if !AppPreferences.getMatchHighlights().isEmpty{
                pageControl.numberOfPages = AppPreferences.getMatchHighlights().count
                collectionViewHighlightsHeight.constant = 180
                self.highlightsStack.isHidden = false
            }
            else{
                self.highlightsStack.isHidden = true
            }
        }
        else{
            if !AppPreferences.getBasketBallHighlights().isEmpty{
                pageControl.numberOfPages = AppPreferences.getBasketBallHighlights().count
                collectionViewHighlightsHeight.constant = 263
                self.highlightsStack.isHidden = false
            }
            else{
                self.highlightsStack.isHidden = true
            }
            
        }
        
        
    }
    
    
    
}


extension HomeViewController:UIGestureRecognizerDelegate{
    
}
