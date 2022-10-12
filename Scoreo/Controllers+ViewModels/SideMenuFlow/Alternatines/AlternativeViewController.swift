//
//  AlternativeViewController.swift
//  Core Score
//
//  Created by Remya on 9/30/22.
//

import UIKit

class AlternativeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettings()
        // Do any additional setup after loading the view.
    }
    

    func initialSettings(){
        self.title = "URL Alternatives".localized
        setBackButton()
        tableView.register(UINib(nibName: "AlternativeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
       
        
    }
}


extension AlternativeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AlternativeTableViewCell
        return cell
    }
    
    
}
