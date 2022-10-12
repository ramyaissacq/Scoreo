//
//  OnboardingViewController.swift
//  Core Score
//
//  Created by Remya on 9/30/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    var current = 0
    var titles = ["Welcome!".localized,"Football".localized,"Basketball".localized,"Live Score Update".localized,"Match Statistics".localized,"Experience the App".localized]
    
    var descriptions = ["Welcome to corescore, Your one stop shop for all for sports needs".localized,"Keep yourself updated with all the major and minor legagues and matches around the world as well as league standings and individual player standings".localized,"Weather its NBA or any other basketball league, we will keep you updated with all the coming matches and results".localized,"Our state of the art score keeping system will keep you updated wherever you are".localized,"Detail match analysis and statistics, goals scores, past results, future fixtures, fouls each and every major and minor statistics for every game are available".localized,"Enough hyping the app, Experience it yourself first hand".localized]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettings()

        // Do any additional setup after loading the view.
    }
    
    func initialSettings(){
        collectionView.registerCell(identifier: "OnboardingCollectionViewCell")
        setupGestures()
        
    }
    
    func setupGestures(){
        
        let left = UISwipeGestureRecognizer(target: self, action: #selector(swipe(sender:)))
        left.direction = .left
        left.delegate = self
        collectionView.addGestureRecognizer(left)
        
        let right = UISwipeGestureRecognizer(target: self, action: #selector(swipe(sender:)))
        right.direction = .right
        right.delegate = self
        collectionView.addGestureRecognizer(right)
        
    }
    
    func moveForward(){
        let total = titles.count
        if current < (total - 1){
            current += 1
            collectionView.scrollToItem(at: IndexPath(row: current, section: 0), at: .centeredHorizontally, animated: true)
        }
        else{
            Utility.gotoHome()
        }
    }
    
    @objc func swipe(sender:UISwipeGestureRecognizer){
        
        if sender.direction == .left{
            moveForward()
        }
        else{
            if current > 0{
                current -= 1
                collectionView.scrollToItem(at: IndexPath(row: current, section: 0), at: .centeredHorizontally, animated: true)
            }
        }
        
    }
}


extension OnboardingViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        let img = UIImage(named: "onboarding\(indexPath.row+1)")!
        cell.pageControl.numberOfPages = titles.count
        cell.configureCell(title: titles[indexPath.row], description: descriptions[indexPath.row], image: img, index: indexPath.row)
        cell.callNext = {
            self.moveForward()
        }
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}


extension OnboardingViewController:UIGestureRecognizerDelegate{
    
}
