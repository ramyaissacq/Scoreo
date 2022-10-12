//
//  extensions+AwardsViewController.swift
//  775775Sports
//
//  Created by Remya on 9/9/22.
//

import Foundation
import UIKit

extension AwardsViewController:AwardsViewModeldelegate{
    func didFinishTeamStandingsFetch() {
        imgLogo.setImage(with: viewModel.leaguDetails?.leagueData01?.first?.leagueLogo, placeholder: Utility.getPlaceHolder())
        if selectedTopTitleIndex == 0{
            switch Utility.getCurrentLang(){
            case "en":
                lblSelectedLeague.text = (viewModel.leaguDetails?.leagueData01?.first?.nameEn ?? "") + " " + (viewModel.leaguDetails?.leagueData01?.first?.currSeason ?? "")
                
            case "cn":
                lblSelectedLeague.text = (viewModel.leaguDetails?.leagueData01?.first?.nameCn ?? "") + " " + (viewModel.leaguDetails?.leagueData01?.first?.currSeason ?? "")
                
            case "id":
                lblSelectedLeague.text = (viewModel.leaguDetails?.leagueData01?.first?.nameId ?? "") + " " + (viewModel.leaguDetails?.leagueData01?.first?.currSeason ?? "")
                
            case "vi":
                lblSelectedLeague.text = (viewModel.leaguDetails?.leagueData01?.first?.nameVi ?? "") + " " + (viewModel.leaguDetails?.leagueData01?.first?.currSeason ?? "")
            case "th":
                lblSelectedLeague.text = (viewModel.leaguDetails?.leagueData01?.first?.nameTh ?? "") + " " + (viewModel.leaguDetails?.leagueData01?.first?.currSeason ?? "")
               
            default:
                break
            
            
            }
            
        imgLogo.isHidden = false
            setupViews()
          
        }
        
        
    }
    
    func didFinishPlayerStandingsFetch(){
        if selectedTopTitleIndex == 1{
            lblSelectedLeague.text = lblLeague.text
            imgLogo.isHidden = true
            setupViews()
        }
       
    
    }
    
    
}

extension AwardsViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewTop{
            return topTitles.count
        }
        else{
            return headers.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewTop{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectionCollectionViewCell", for: indexPath) as! SelectionCollectionViewCell
            cell.lblTitle.text = topTitles[indexPath.row]
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCollectionViewCell", for: indexPath) as! TitleCollectionViewCell
            cell.titleType = .RedHeader
            cell.lblTitle.text = headers[indexPath.row]
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewTop{
            selectedTopTitleIndex = indexPath.row
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            setupViews()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewTop{
            let w = UIScreen.main.bounds.width / 2
            return CGSize(width: w, height: 55)
        }
        else{
            return CGSize(width: headerSizes[indexPath.row], height: 55)
        }
    }
    
    
}

extension AwardsViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if selectedTopTitleIndex == 0{
            if viewModel.isNormalStanding{
                return 1
            }
            return viewModel.leaguStanding?.list?.first?.score?.first?.groupScore?.count ?? 0
        }
        else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedTopTitleIndex == 0{
            if viewModel.isNormalStanding{
                return viewModel.normalStandings?.totalStandings?.count ?? 0
               
            }
            else{
                return (viewModel.leaguStanding?.list?.first?.score?.first?.groupScore?[section].scoreItems?.count ?? 0) + 1
            }
        }
        else{
            return viewModel.playerStandings?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if selectedTopTitleIndex == 0 && viewModel.isNormalStanding == false{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! GeneralRowTableViewCell
            
            cell.headerSizes = headerSizes
            if indexPath.row == 0{
                cell.titleType = .RedHeader
                cell.backgroundColor = UIColor(named: "red2")
                cell.values = rareTeamHeadings
            }
            else{
                cell.titleType = .Normal
                cell.backgroundColor = .clear
            cell.values = viewModel.getRareStandingRowByIndex(section: indexPath.section, row: indexPath.row-1)
            }
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StandingsTableViewCell
            
            //cell.cellIndex = indexPath.row
           
            cell.headerSizes = headerSizes
            if selectedTopTitleIndex == 0{
                let standings = viewModel.getTeamRowByIndex(index: indexPath.row)
                let results = viewModel.getResultsArrayByIndex(index: indexPath.row)
                let percentageStr = viewModel.getResultsPercentageStringByIndex(index: indexPath.row)
                cell.configureTeamStandings(index: indexPath.row, standings: standings, results: results, resultsPercentage: percentageStr)
            }
            else{
            let standings = viewModel.getPlayerRowByIndex(index: indexPath.row)
            let points = viewModel.getPlayerPointsByIndex(index: indexPath.row)
            cell.configurePlayerStandings(index: indexPath.row, standings: standings, points: points)
            }
            cell.callReloadCell = {
                tableView.reloadRows(at: [indexPath], with: .none)
            }
            
            
            return cell
        }
       
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if viewModel.isNormalStanding == false && selectedTopTitleIndex == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! LeagueHeaderTableViewCell
            cell.lblTitle.text = viewModel.getGroupName(section: section)
            return cell
        }
        else{
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if viewModel.isNormalStanding == false && selectedTopTitleIndex == 0{
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
