//
//  EventViewController.swift
//  775775Sports
//
//  Created by Remya on 9/13/22.
//

import UIKit
import Lottie

class EventViewController: UIViewController {
   @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblEmpty: UILabel!
  //  @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var emptyView: UIView!
    
    var headers = ["GOALS AND ASSISTS".localized,"SUBTITUTIONS".localized,"FOULS".localized]
    var viewModel = EventsViewModel()
    var homeName:String?
    var awayName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    

    func initialSetup(){
       // configureLottieAnimation()
        tableView.register(UINib(nibName: "EventsHomeTableViewCell", bundle: nil), forCellReuseIdentifier: "homeCell")
        tableView.register(UINib(nibName: "EventsAwayTableViewCell", bundle: nil), forCellReuseIdentifier: "awayCell")
        tableView.register(UINib(nibName: "EventTechnicTableViewCell", bundle: nil), forCellReuseIdentifier: "TechnicCell")
        tableView.register(UINib(nibName: "EventsHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "headerCell")
        tableView.register(UINib(nibName: "EventTechnicHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "technicHeaderCell")
        viewModel.delegate = self
        viewModel.getEvents()
       
    }
    
    func configureLottieAnimation(){
//        animationView.contentMode = .scaleAspectFit
//        animationView.loopMode = .loop
//        animationView.animationSpeed = 0.5
//        animationView.play()
        
    }
 
}

extension EventViewController:EventsViewModelDelegate{
    func didFinishEventsFetch() {
        self.tableView.reloadData()
        //animationView.stop()
        emptyView.isHidden = true
    }
    
    
}

extension EventViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return viewModel.goalsArray?.count ?? 0
        case 1:
            return viewModel.substitutionsArray?.count ?? 0
        case 2:
            return viewModel.foulsArray?.count ?? 0
        case 3:
            return viewModel.technicArray?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.section != 3{
            var obj:Event?
            if indexPath.section == 0{
                obj = viewModel.goalsArray?[indexPath.row]
            }
           else if indexPath.section == 1{
               obj = viewModel.substitutionsArray?[indexPath.row]
           }
            else{
                obj = viewModel.foulsArray?[indexPath.row]
            }
            if obj?.isHome ?? false{
                let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! EventsHomeTableViewCell
                cell.configureCell(index: indexPath.section, obj: obj)
                return cell
                
            }
            else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "awayCell") as! EventsAwayTableViewCell
                cell.configureCell(index: indexPath.section, obj: obj)
                return cell
            }
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TechnicCell") as! EventTechnicTableViewCell
            cell.configureCell(obj: viewModel.technicArray?[indexPath.row])
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section != 3{
        let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! EventsHeaderTableViewCell
            cell.configureCell(index: section, heading: headers[section])
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "technicHeaderCell") as! EventTechnicHeaderTableViewCell
            cell.configureCell(home: homeName, away: awayName)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 && viewModel.goalsArray?.isEmpty ?? true{
            return CGFloat.leastNormalMagnitude
        }
        if section == 1 && viewModel.substitutionsArray?.isEmpty ?? true{
            return CGFloat.leastNormalMagnitude
        }
        if section == 2 && viewModel.foulsArray?.isEmpty ?? true{
            return CGFloat.leastNormalMagnitude
        }
        if section == 3 && viewModel.technicArray?.isEmpty ?? true{
            return CGFloat.leastNormalMagnitude
        }
        
        return 35
    }
    
    
}
