

import UIKit
import Reachability
import ProgressHUD
import CoreLocation
import UserNotifications
import MOLH
import StoreKit

class Utility: NSObject {
    
    enum dateFormat: String {
        case ddMMyyyyWithTimePretty = "dd-MM-yyyy HH:mm:ss"
        case ddMMyyyyWithTime = "yyyy-MM-dd'T'HH:mm:ss"
        case yyyyMMddHHmm = "yyyy-MM-dd HH:mm"
        case ddMMyyyyWithTimeZone = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        case ddMMMyyyy = "dd-MMM-yyyy"
        case ddMMyyyy = "dd-MM-yyyy"
        case yyyyMMdd = "yyyy-MM-dd"
        case dd = "dd"
        case MMM = "MMM"
        case yyyy = "yyyy"
        case eeee = "EEEE"
        case eee = "EEE"
        case hhmm = "H.mm"
        case hhmm2 = "HH:mm"
        case eddmmm = "E, d MMM"
        case edmmmHHmm = "E, d MMM HH:mm"
    }
    
  
    
    class func getPlaceHolder()-> UIImage?
    {
        return UIImage.init(named: "placeholder")
    }
    
    class func getDeviceWidth()-> CGFloat
    {
        return getDeviceSize().width
    }
    
    class func getDeviceHeight()-> CGFloat
    {
        return getDeviceSize().height
    }
    
    class func getDeviceSize()-> CGSize
    {
        return UIScreen.main.bounds.size
    }
    
    class func setCustomNavBar(navBar: UINavigationBar, navigationItem : UINavigationItem,tintColor : UIColor, backgroundColor : UIColor){
        let yourBackImage = UIImage(named: "back")?.withTintColor(.white)
        let appearance = UINavigationBarAppearance()
        appearance.setBackIndicatorImage(yourBackImage, transitionMaskImage: yourBackImage)
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = backgroundColor
        appearance.titleTextAttributes = [.foregroundColor: tintColor]
        appearance.shadowColor = backgroundColor
        navBar.tintColor = tintColor
        navBar.backgroundColor = .clear
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
    }
    
    class func setWhiteNavBar(navigationController : UINavigationController){
        let yourBackImage = UIImage(named: "back")?.withTintColor(.black)
        navigationController.removeBottomLine()
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.setBackIndicatorImage(yourBackImage, transitionMaskImage: yourBackImage)
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearance.backgroundColor = .white
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.shadowColor = .clear
        navigationController.navigationBar.tintColor = .black
        navigationController.navigationBar.standardAppearance = navBarAppearance
        navigationController.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.layoutIfNeeded()
    }
    
    class func formatDate(date: Date?, with outputFormat: dateFormat)-> String
    {
        if date == nil
        {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = outputFormat.rawValue
        dateFormatter.locale = Locale(identifier: "en")
        return dateFormatter.string(from: date!)
    }
    
   
    
    class func timeStampToDateString(timeStamp: Double, with outputFormat: dateFormat)-> String
    {
        let date = Date(timeIntervalSince1970: timeStamp/1000)
       
        return formatDate(date: date, with: outputFormat)
    }
    
    class func timeStampToRelativeTime(timeStamp: Double) -> String{
        
        let date = Date(timeIntervalSince1970: timeStamp/1000)

        // ask for the full relative date
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full

        // get exampleDate relative to the current date
        var relativeDate = formatter.localizedString(for: date, relativeTo: Date())

        // print it out
        print("Relative date is: \(relativeDate)")
        if relativeDate == "in 0 seconds"{
            relativeDate = "Just now"
        }
        return relativeDate
    }
    
    class func getCurrentTimeStamp()-> String
    {
        return "\(Int(Date().timeIntervalSince1970 * 1000))"
    }
    
    class func isNetworkConnected() -> Bool
    {
        let reachability = try! Reachability()
        return reachability.connection != .unavailable
    }
    
    class func showSuccessSnackView(message: String, iconName: String)
    {
        SnackView().showSuccessSnackView(withMessage: message, iconName: iconName)
    }
    
    class func showErrorSnackView(message: String)
    {
        SnackView().showErrorSnackView(withMessage: message)
    }
    
    class func showProgress() {
        DispatchQueue.main.async {
            ProgressHUD.colorBackground = UIColor.black.withAlphaComponent(0.2)
            ProgressHUD.colorHUD = Colors.accentColor()
            ProgressHUD.colorAnimation = Colors.accentColor()
            ProgressHUD.show("Loading...", interaction: false)
        }
    }
    
    class func showProgress(progress: Float) {
        DispatchQueue.main.async {
            ProgressHUD.colorBackground = UIColor.black.withAlphaComponent(0.2)
            ProgressHUD.colorHUD = Colors.accentColor()
            ProgressHUD.colorAnimation = Colors.accentColor()
            ProgressHUD.colorProgress = Colors.accentColor()
            ProgressHUD.showProgress(CGFloat(progress), interaction: false)
        }
    }
    
    class func dismissProgress() {
        DispatchQueue.main.async {
            ProgressHUD.dismiss()
        }
    }
    
//    class func isUserLoggedIn()-> Bool
//    {
//        return AppPreferences.getToken() != ""
//    }
    
    class func gotoSettings()
    {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                print("Settings opened: \(success)")
            })
        }
    }
    
    class func openUrl(url: URL)
    {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, completionHandler: { (success) in
                print("Settings opened: \(success)")
            })
        }
    }
    
//    class func getAddress(isFullAddress: Bool, latitude: Double, longitude: Double, addressResponse: @escaping(String)->()){
//        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//        let geoCoder = GMSGeocoder()
//        geoCoder.reverseGeocodeCoordinate(coordinate) { (response, error) in
//            if((response?.firstResult()) != nil){
//                let address = self.getCompleteAddress(isFullAddress: isFullAddress, (response?.firstResult())!)
//                print(address)
//                addressResponse(address)
//            }else{
//                print("Reverse Error : \(error?.localizedDescription ?? "")")
//            }
//        }
//    }
//
//    class func getCompleteAddress(isFullAddress: Bool, _ place: GMSAddress) -> String {
//        var addressString : String = ""
//        if(isFullAddress)
//        {
//            if place.thoroughfare != nil {
//                addressString = addressString + place.thoroughfare! + ","
//            }
//            if place.subLocality != nil {
//                addressString = addressString + place.subLocality! + ","
//            }
//            if place.postalCode != nil {
//                addressString = addressString + place.postalCode! + ","
//            }
//        }
//        if place.locality != nil {
//            addressString = addressString + place.locality! + ","
//        }
//        //        if place.administrativeArea != nil {
//        //            addressString = addressString + place.administrativeArea! + ",\n"
//        //        }
//        if place.country != nil {
//            addressString = addressString + place.country!
//        }
//
//        return addressString
//    }
    
//    class func moveToHomeViewController( VC : UIViewController)
//    {
//        if let parentVc = VC.parent?.parent as? TabBarViewController
//        {
//            parentVc.setCustomViewControllers()
//            parentVc.selectedIndex = 0
//        }
//    }
//
//    class func moveToLoginVC(parent : UIViewController)
//    {
//        let loginVC = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
//        parent.navigationController?.pushViewController(loginVC, animated: true)
//    }
//
   
    
    
    class func formatPrice(price: Float?, currency: String?)-> String
    {
        return String(format: "%.2f \(currency ?? "AED")", price ?? 0)
    }
    
    class func formatPrice(price: Float?)-> String
    {
        return String(format: "%.2f", price ?? 0)
    }
    
    class func getJson(obj:Any)->String{
            let jsonData = try! JSONSerialization.data(withJSONObject: obj)
        let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
                            print(jsonString ?? "")
            return String(jsonString ?? "")
    }
    
   
    
    class func getFormattedDateTime(dateTime : String) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"

        if let date = dateFormatterGet.date(from: dateTime) {
            return dateFormatterPrint.string(from: date)
            print(dateFormatterPrint.string(from: date))
        } else {
            return ""
           print("There was an error decoding the string")
        }
    }
    
    class func getCurrentLang() -> String
    {
        var lang = MOLHLanguage.currentAppleLanguage()
        if lang == "zh"{
            lang = "cn"
        }
       
        return lang
    }
    
    class func getSystemTimeZoneTime(dateString:String)->Date{
       let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
       guard let date = dateFormatter.date(from: dateString) else{return Date()}
            let source_timezone = NSTimeZone(abbreviation: "GMT+08")
       let local_timezone = NSTimeZone.system
       let source_EDT_offset = source_timezone?.secondsFromGMT(for: date)
            let destination_EDT_offset = local_timezone.secondsFromGMT(for: date)
       let time_interval : TimeInterval = Double(destination_EDT_offset - source_EDT_offset!)
       let convertedDate = NSDate(timeInterval: time_interval, since: date)
        return convertedDate as Date
    }
    
    class func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    class func scheduleLocalNotification(date:Date,subTitle:String,body:String,success:(()->Void)?,failed:(()->Void)?) {
        // Create Notification Content
        let notificationContent = UNMutableNotificationContent()

        // Configure Notification Content
        notificationContent.title = "Reminder"
        notificationContent.subtitle = subTitle
        notificationContent.body = body

        // Add Trigger
        //let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)
        
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year,.day,.month,.hour,.minute,.second], from: date)
        print(components)
        //components.year = 2022
        let trg2 = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)

        // Create Notification Request
        let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: trg2)

        // Add Request to User Notification Center
        UNUserNotificationCenter.current().add(notificationRequest) { (error) in
            if let error = error {
                print("Unable to Add Notification Request (\(error), \(error.localizedDescription))")
                failed?()
            }
            success?()
        }
    }
    
    
    class func scheduleLocalNotificationNow(time:Double,title:String,subTitle:String,body:String,data:[String:Any],repeats:Bool) {
        // Create Notification Content
        let notificationContent = UNMutableNotificationContent()

        // Configure Notification Content
        notificationContent.title = title
        notificationContent.subtitle = subTitle
        notificationContent.body = body
        notificationContent.userInfo = data

        // Add Trigger
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: repeats)
       
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
    
   class func checkPendings(){
        let calendar = Calendar(identifier: .gregorian)
        UNUserNotificationCenter.current().getPendingNotificationRequests(){ requests in
            for request in requests {
                guard let trigger = request.trigger as? UNCalendarNotificationTrigger else {return}
                if let dt = trigger.nextTriggerDate(){
                print(calendar.dateComponents([.year,.day,.month,.hour,.minute,.second], from: dt))
                }
            }
        }
   }
    
    class func gotoHome(){
        let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabbarNavigation")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = homeVC
    }
    
    class func shareAction(text:String?,url:NSURL?,image:UIImage?,vc:UIViewController){
        
        var items = [Any]()
        if text != nil{
            items.append(text!)
        }
        if url != nil{
            items.append(url!)
        }
        if image != nil{
            items.append(image!)
        }
        
           let activityViewController : UIActivityViewController = UIActivityViewController(
               activityItems: items, applicationActivities: nil)
           
          
           
           // Pre-configuring activity items
           activityViewController.activityItemsConfiguration = [
           UIActivity.ActivityType.message
           ] as? UIActivityItemsConfigurationReading
           
           // Anything you want to exclude
           activityViewController.excludedActivityTypes = [
               UIActivity.ActivityType.postToWeibo,
               UIActivity.ActivityType.print,
               UIActivity.ActivityType.assignToContact,
               UIActivity.ActivityType.saveToCameraRoll,
               UIActivity.ActivityType.addToReadingList,
               UIActivity.ActivityType.postToFlickr,
               UIActivity.ActivityType.postToVimeo,
               UIActivity.ActivityType.postToTencentWeibo,
               UIActivity.ActivityType.postToFacebook
           ]
           
           activityViewController.isModalInPresentation = true
           vc.present(activityViewController, animated: true, completion: nil)
    }
    
   class func rateApp(id : String) {
        guard let url = URL(string : "itms-apps://itunes.apple.com/app/id\(id)?mt=8&action=write-review") else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    class func callURlDetailsAPI(){
        HomeAPI().getUrlInfo { response in
            HomeViewController.urlDetails = response
            HomeViewController.showPopup()
        } failed: { _ in
            
        }

    }
    
  class  func getLang(){
        var locale = NSLocale.current.languageCode!
                    print(locale)
    }
    
    class func getFontNames(){
        let fontFamilyNames = UIFont.familyNames

        for familyName in fontFamilyNames {
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font Names = [\(names)]")
        }
    }
    
}
