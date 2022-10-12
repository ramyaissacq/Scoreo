//
//  StandingsTableViewCell.swift
//  775775Sports
//
//  Created by Remya on 9/3/22.
//

import UIKit

class StandingsTableViewCell: UITableViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var collectionViewStandings: UICollectionView!
    @IBOutlet weak var resultsView: UIView!
    @IBOutlet weak var pointsView: UIView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var collectionViewLastResults: UICollectionView!
    @IBOutlet weak var collectionViewPoints: UICollectionView!
    //MARK: - Variables
    
    var cellIndex = 0
    var isTeamStandigs:Bool?
    var callReloadCell:(() -> Void)?
    var headerSizes = [CGFloat]()
    var standings = [String]()
    var lastResults:[String]?
    var points:[String]?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewLastResults.delegate = self
        collectionViewLastResults.dataSource = self
        collectionViewPoints.delegate = self
        collectionViewPoints.dataSource = self
        collectionViewStandings.delegate = self
        collectionViewStandings.dataSource = self
        collectionViewStandings.registerCell(identifier: "RankCollectionViewCell")
        collectionViewStandings.registerCell(identifier: "TeamCollectionViewCell")
        collectionViewStandings.registerCell(identifier: "MoreCollectionViewCell")
        collectionViewStandings.registerCell(identifier: "TitleCollectionViewCell")
        collectionViewPoints.registerCell(identifier: "PointsCollectionViewCell")
        collectionViewLastResults.registerCell(identifier: "ResultCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView(){
        resultsView.isHidden = true
        pointsView.isHidden = true
        collectionViewStandings.reloadData()
        collectionViewLastResults.reloadData()
        collectionViewPoints.reloadData()
        configureMoreViews()
    }
    
    func configureMoreViews(){
        if isTeamStandigs ?? false{
            if AwardsViewController.selectedTeamMoreIndices.contains(cellIndex){
                resultsView.isHidden = false
            }
            else{
                resultsView.isHidden = true
            }
            
        }
        else{
            if AwardsViewController.selectedPlayerMoreIndices.contains(cellIndex){
                pointsView.isHidden = false
            }
            else{
                pointsView.isHidden = true
            }
            
        }
        
    }
    
    func configureTeamStandings(index:Int,standings:[String],results:[String],resultsPercentage:String?){
        isTeamStandigs = true
        cellIndex = index
        self.standings = standings
        self.lastResults = results
        self.lblDescription.text = resultsPercentage
        setupView()
    }
    
    func configurePlayerStandings(index:Int,standings:[String],points:[String]){
        isTeamStandigs = false
        cellIndex = index
        self.standings = standings
        self.points = points
        setupView()
        
        
    }
    
    
    
    
    
    
}

//MARK: - CollectionView Delegates
extension StandingsTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewLastResults{
            return lastResults?.count ?? 0
        }
        else if collectionView == collectionViewStandings{
            if standings.count > 0 {
            return standings.count + 1
            }
            else{
                return 0
            }
        }
        else {
            return points?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewPoints{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PointsCollectionViewCell", for: indexPath) as! PointsCollectionViewCell
            cell.lblTitle.text = points?[indexPath.row]
            return cell
            
        }
        else if collectionView == collectionViewLastResults{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCollectionViewCell", for: indexPath) as! ResultCollectionViewCell
            cell.configureCell(status: lastResults?[indexPath.row] ?? "")
            
            return cell
            
        }
       else if collectionView == collectionViewStandings && isTeamStandigs ?? false{
            switch indexPath.row{
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RankCollectionViewCell", for: indexPath) as! RankCollectionViewCell
                cell.lblRank.text = standings[indexPath.row]
                return cell
            case 1:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCollectionViewCell", for: indexPath) as! TeamCollectionViewCell
                cell.configureCell(team: standings[indexPath.row])
                return cell
            case standings.count:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreCollectionViewCell", for: indexPath) as! MoreCollectionViewCell
                cell.configureCell(index: cellIndex, isTeamStandings: true)
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCollectionViewCell", for: indexPath) as! TitleCollectionViewCell
                cell.titleType = .Normal
                cell.lblTitle.text = standings[indexPath.row]
                return cell
           
        }
       }
            else{
                if indexPath.row == standings.count{
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreCollectionViewCell", for: indexPath) as! MoreCollectionViewCell
                    cell.configureCell(index: cellIndex, isTeamStandings: false)
                    return cell
                    
                }
                
                else{
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCollectionViewCell", for: indexPath) as! TitleCollectionViewCell
                    cell.titleType = .Normal
                    cell.lblTitle.text = standings[indexPath.row]
                    return cell
                    
                }
                
            }
      
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewStandings && isTeamStandigs ?? false{
            if indexPath.row == standings.count{
                
                if AwardsViewController.selectedTeamMoreIndices.contains(cellIndex){
                    AwardsViewController.selectedTeamMoreIndices.remove(at: AwardsViewController.selectedTeamMoreIndices.firstIndex(of: cellIndex)!)
                    resultsView.isHidden = true
                }
                else{
                    AwardsViewController.selectedTeamMoreIndices.append(cellIndex)
                }
                if let cell = collectionView.cellForItem(at: indexPath) as? MoreCollectionViewCell{
                    cell.imgArrow.isHidden = true
                }
                callReloadCell?()
            }
        }
        
        else if collectionView == collectionViewStandings && indexPath.row == standings.count{
            if AwardsViewController.selectedPlayerMoreIndices.contains(cellIndex){
                AwardsViewController.selectedPlayerMoreIndices.remove(at: AwardsViewController.selectedPlayerMoreIndices.firstIndex(of: cellIndex)!)
                pointsView.isHidden = true
            }
            else{
                AwardsViewController.selectedPlayerMoreIndices.append(cellIndex)
            }
            if let cell = collectionView.cellForItem(at: indexPath) as? MoreCollectionViewCell{
                cell.imgArrow.isHidden = true
            }
            callReloadCell?()
            
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewLastResults{
            return CGSize(width: 20, height: 20)
        }
        else if collectionView == collectionViewPoints{
            let str = points?[indexPath.row] ?? ""
            let w = str.width(forHeight: 14, font: UIFont(name: "Roboto-Regular", size: 12)!) + 16
            return CGSize(width: w, height: 30)
            //return CGSize(width: 120, height: 30)
            
        }
        return CGSize(width: headerSizes[indexPath.row], height: 55)
    }
    
    
}
