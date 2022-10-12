//
//  AppDelegate.swift
//  Scoreo
//
//  Created by Remya on 10/12/22.
//

import UIKit
import IQKeyboardManagerSwift
import UserNotifications
import MOLH
@main
class AppDelegate: UIResponder, UIApplicationDelegate,MOLHResetable {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Utility.callURlDetailsAPI()
        IQKeyboardManager.shared.enable = true
        MOLH.shared.activate(true)
        MOLHLanguage.setDefaultLanguage("en")
        UNUserNotificationCenter.current().delegate = self
        prepareSendNotifications()
        application.registerForRemoteNotifications()
        
        if AppPreferences.getIsFirstRun(){
            Utility.gotoHome()
        }
        else{
            AppPreferences.setIsFirstRun(value: true)
        }
        
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    func reset() {
        Utility.gotoHome()
    }
    
    


}


extension AppDelegate:UNUserNotificationCenterDelegate{
func prepareSendNotifications(){
    UNUserNotificationCenter.current().getNotificationSettings { (notificationSettings) in
            switch notificationSettings.authorizationStatus {
            case .notDetermined:
                self.requestAuthorization(completionHandler: { (success) in
                    guard success else { return }
                    
                })
           
            default:
                break
            }
        }
    
}


private func requestAuthorization(completionHandler: @escaping (_ success: Bool) -> ()) {
    // Request Authorization
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (success, error) in
        if let error = error {
            print("Request Authorization Failed (\(error), \(error.localizedDescription))")
        }

        completionHandler(success)
    }
}
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.list, .banner, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if let id = response.notification.request.content.userInfo["id"] as? Int{
            if let topVC = UIApplication.getTopRootController() as? UITabBarController {
                if let navigation = topVC.children.first as? UINavigationController{
                    let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeCategoryViewController") as! HomeCategoryViewController
                    HomeCategoryViewController.matchID = id
                    vc.selectedMatch =  AppPreferences.getPinList().filter{$0.matchId == id}.first
                    vc.selectedCategory = .index
                    navigation.pushViewController(vc, animated: true)
                        
                    
                }
            }
            
        }
        

        completionHandler()
    }
}
