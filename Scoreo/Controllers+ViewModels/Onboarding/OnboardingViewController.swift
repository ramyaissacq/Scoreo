//
//  OnboardingViewController.swift
//  Core Score
//
//  Created by Remya on 9/30/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    var current = 0
    var titles = ["Welcome to 775Sports".localized,"Football".localized,"Live Score Updates".localized,"More Than Just an App".localized]
    
    var descriptions = ["Jump into the action with our 24/7 coverage of the world's most popular sports! Don't miss a heartbeat as your favourite teams take the field and cheer them on to victory. You'll find everything from fixtures to predictions, player swaps, live coverage and more at 775Sports.".localized,"As it happens! Follow the latest in the world of football from fixtures, to player stats and everything in between. See who the gods of football are smiling on with our expert analyses and how the odds are stacked for and agaist the teams.".localized,"As it happens! No more waiting for you! Follow live score updates as they happen for your favourite sports. Let's see if we can;'t make you feel like you're in the stadium. Just remember not to wake the neighbours with your cheering!".localized,"It isn't just an app, it's an experience. Join in the fun and gain access to over 1000 sports competitions worldwide. You name it, we provide it. See how your dream team stacks agains the competition and gain meaningful insights through our analyses and predictions.Come along with us, and you're in for a ride.".localized]
    
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
