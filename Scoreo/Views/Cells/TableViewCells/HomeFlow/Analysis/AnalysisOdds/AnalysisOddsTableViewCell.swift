//
//  AnalysisOddsTableViewCell.swift
//  775775Sports
//
//  Created by Remya on 9/12/22.
//

import UIKit

class AnalysisOddsTableViewCell: UITableViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var collectionViewOdds: UICollectionView!
    @IBOutlet weak var collectionViewHeading: UICollectionView!
    
    //MARK: - Variables
    var titles = ["","Round".localized,"W","D","L","%","OVER".localized,"UNDER".localized]
    var values = [String]()
    var sizes = [CGFloat]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionViewHeading.registerCell(identifier: "TitleCollectionViewCell")
        collectionViewOdds.registerCell(identifier: "OddsCollectionViewCell")
        collectionViewOdds.delegate = self
        collectionViewOdds.dataSource = self
        collectionViewHeading.delegate = self
        collectionViewHeading.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(row:Int,data:String){
        values.removeAll()
        titles[0] = getTitle(index: row)
        let arr = data.components(separatedBy: "^")
        if arr.count > 9{
        values.append("")
        values.append(arr[1])
        values.append(arr[2])
        values.append(arr[3])
        values.append(arr[4])
        values.append(arr[5])
        values.append("\(arr[6])/\(arr[7])")
        values.append("\(arr[8])/\(arr[9])")
        }
        else{
            values = ["","","","","","","",""]
        }
      collectionViewHeading.reloadData()
      collectionViewOdds.reloadData()
        
        
    }
    
    func getTitle(index:Int)->String{
        switch index{
        case 0:
            return "Total(Fulltime)".localized
        case 1:
            return "Home(Fulltime)".localized
        case 2:
            return "Away(Fulltime)".localized
        case 3:
            return "Total(Halftime)".localized
        case 4:
            return "Home(Halftime)".localized
        case 5:
            return "Away(Halftime)".localized
        default:
            return ""
        }
        
    }
    
}

extension AnalysisOddsTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewHeading{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCollectionViewCell", for: indexPath) as! TitleCollectionViewCell
            cell.titleType = .Header(color: .black)
            cell.lblTitle.text = titles[indexPath.row]
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OddsCollectionViewCell", for: indexPath) as! OddsCollectionViewCell
            if values.count > indexPath.row{
            cell.lblTitle.text = values[indexPath.row]
            }
            if indexPath.row == 0{
                cell.backView.isHidden = true
            }
            else{
                cell.backView.isHidden = false
            }
            if indexPath.row == 1{
                cell.backView.backgroundColor = UIColor(named: "blue7")
                cell.lblTitle.textColor = .white
            }
            else{
                cell.backView.backgroundColor = .white
                cell.lblTitle.textColor = UIColor(named: "gray1")
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewHeading{
            return CGSize(width: sizes[indexPath.row], height: 40)
        }
        else{
            return CGSize(width: sizes[indexPath.row], height: 40)
        }
    }
    
    
}
