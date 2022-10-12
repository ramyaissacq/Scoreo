//
//  PagesViewController.swift
//  Core Score
//
//  Created by Remya on 9/29/22.
//

import UIKit

enum PagesSlug{
    case aboutUS
    case privacy
    case terms
}

class PagesViewController: BaseViewController {

    @IBOutlet weak var textViewDescription: UITextView!
    @IBOutlet weak var lblHeader: UILabel!
    
    var slug = PagesSlug.aboutUS
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettings()

    }
    
    func initialSettings(){
        setBackButton()
        setupDetails()
        
    }
    
    func setupDetails(){
        switch slug{
        case .aboutUS:
            lblHeader.text = "About US".localized
        case .terms:
            lblHeader.text = "Terms & Conditions".localized
        case .privacy:
            lblHeader.text = "Privacy Policy"
            
            
        }
    }
   

}
