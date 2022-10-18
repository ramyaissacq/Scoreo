//
//  LanguageViewController.swift
//  Core Score
//
//  Created by Remya on 9/29/22.
//

import UIKit
import MOLH

class LanguageViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var languages = ["English","中文","Bahasa Indonesia","Việt Nam","ไทย"]
    var lang = MOLHLanguage.currentAppleLanguage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettings()

        // Do any additional setup after loading the view.
    }
    
    func initialSettings(){
        setBackButton()
        setupNavBar()
        tableView.register(UINib(nibName: "LanguageTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        var index = 0
        switch lang{
        case "en":
            index = 0
        case "zh":
            index = 1
        case "id":
            index = 2
        case "vi":
            index = 3
        case "th":
            index = 4
        default:
            break
            
        }
        
        tableView.selectRow(at: IndexPath(row: index, section: 0), animated: false, scrollPosition: .top)
    }
    
    func setupNavBar(){
        let lbl = getHeaderLabel(title: "Language".localized)
        self.navigationItem.titleView = lbl
    }
    
    func resetLanguage(index:Int){
        switch index{
        case 0:
            lang = "en"
        case 1:
            lang = "zh-Hans"
        case 2:
            lang = "id"
        case 3:
            lang = "vi"
        case 4:
            lang = "th"
            
        default:
            break
        }
        MOLHLanguage.setAppleLAnguageTo(lang)
        MOLH.reset()
    }
   

}

extension LanguageViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LanguageTableViewCell
        cell.lblLanguage.text = languages[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        resetLanguage(index: indexPath.row)
    }
    
    
}


