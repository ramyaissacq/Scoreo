//
//  MatchOptionsViewController.swift
//  775775Sports
//
//  Created by Remya on 9/20/22.
//

import UIKit
import SwiftEntryKit

class MatchOptionsViewController: UIViewController {
    
    @IBOutlet weak var reminderView: UIView!
    
    @IBOutlet weak var highlightsView: UIView!
    
    @IBOutlet weak var pinScoreView: UIView!
    
    var callbackReminder:(()->Void)?
    var callbackHighLights:(()->Void)?
    var callbackPin:(()->Void)?
    var callbackClose:(()->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettings()

        // Do any additional setup after loading the view.
    }
    
    static func instance()-> MatchOptionsViewController
    {
        let storyboard = UIStoryboard.init(name: "Dialogs", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "MatchOptionsViewController") as! MatchOptionsViewController
        return vc
    }
    
    @IBAction func actionClose(){
        callbackClose?()
        SwiftEntryKit.dismiss()
        
    }
    
    func initialSettings(){
        let reminderTap = UITapGestureRecognizer(target: self, action: #selector(actionTapReminder))
        reminderView.addGestureRecognizer(reminderTap)
        
        let higlightsTap = UITapGestureRecognizer(target: self, action: #selector(actionTapHighlights))
        highlightsView.addGestureRecognizer(higlightsTap)
        
        let pinTap = UITapGestureRecognizer(target: self, action: #selector(actionTapPin))
        pinScoreView.addGestureRecognizer(pinTap)
        
    }
    
    @objc func actionTapReminder(){
        callbackReminder?()
        
        
    }
    
    @objc func actionTapHighlights(){
        callbackHighLights?()
        SwiftEntryKit.dismiss()
       
      
        
    }
  
    @objc func actionTapPin(){
        callbackPin?()
        SwiftEntryKit.dismiss()
       
        
    }

}
