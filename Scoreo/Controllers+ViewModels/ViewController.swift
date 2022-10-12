//
//  ViewController.swift
//  test
//
//  Created by Remya on 9/20/22.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionClick(){
      //  prepareSendNotifications()
        
       scheduleLocalNotificationNow(time: 1, title: "Hon Kong Vs Myanmar", subTitle: "", body: "Scores - 2:1, C - 3:1, HT - 1:0")
      
        scheduleLocalNotificationNow(time: 3, title: "Hon Kong Vs Myanmar", subTitle: "GOAL!!", body: "Scores - 3:1, C - 3:1, HT - 1:0")
       
        
    }
    
    @IBAction func checkPendings(){
        let calendar = Calendar(identifier: .gregorian)
        UNUserNotificationCenter.current().getPendingNotificationRequests(){[unowned self] requests in
            for request in requests {
                guard let trigger = request.trigger as? UNCalendarNotificationTrigger else {return}
                if let dt = trigger.nextTriggerDate(){
                print(calendar.dateComponents([.year,.day,.month,.hour,.minute,.second], from: dt))
                }
            }
        }
        
    }
    
    func prepareSendNotifications(){
        UNUserNotificationCenter.current().getNotificationSettings { (notificationSettings) in
                switch notificationSettings.authorizationStatus {
                case .notDetermined:
                    self.requestAuthorization(completionHandler: { (success) in
                        guard success else { return }

                        // Schedule Local Notification
                        self.scheduleLocalNotification()
                    })
                case .authorized:
                    // Schedule Local Notification
                    self.scheduleLocalNotification()
                case .denied:
                    print("Application Not Allowed to Display Notifications")
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
    
    
    private func scheduleLocalNotification() {
        // Create Notification Content
        let notificationContent = UNMutableNotificationContent()

        // Configure Notification Content
        notificationContent.title = "Cocoacasts"
        notificationContent.subtitle = "Local Notifications"
        notificationContent.body = "In this tutorial, you learn how to schedule local notifications with the User Notifications framework."

        // Add Trigger
        //let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)
        let date = Calendar.current.date(byAdding: .second, value: 10, to: Date())
        let calendar = Calendar(identifier: .gregorian)
        var components = calendar.dateComponents([.year,.day,.month,.hour,.minute,.second], from: date!)
        print(components)
        //components.year = 2022
        let trg2 = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)

        // Create Notification Request
        let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: trg2)

        // Add Request to User Notification Center
        UNUserNotificationCenter.current().add(notificationRequest) { (error) in
            if let error = error {
                print("Unable to Add Notification Request (\(error), \(error.localizedDescription))")
            }
        }
    }
    
    func scheduleLocalNotificationNow(time:Double,title:String,subTitle:String,body:String) {
        // Create Notification Content
        let notificationContent = UNMutableNotificationContent()

        // Configure Notification Content
        notificationContent.title = title
        notificationContent.subtitle = subTitle
        notificationContent.body = body
       // notificationContent.categoryIdentifier = UUID().uuidString

        // Add Trigger
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
        
        // Create Notification Request
        let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: notificationTrigger)

        // Add Request to User Notification Center
        UNUserNotificationCenter.current().add(notificationRequest) { (error) in
            if let error = error {
                print("Unable to Add Notification Request (\(error), \(error.localizedDescription))")
//                DispatchQueue.main.async {
//                Utility.showErrorSnackView(message: "Unable to Add Reminder")
//                }
            }
            print("Notificatoion set")
//            DispatchQueue.main.async {
//                Utility.showSuccessSnackView(message: "Reminder saved successfully", iconName: "")
//
//            }
            
        }
    }


}



extension ViewController: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.list, .banner, .sound])
    }

}
