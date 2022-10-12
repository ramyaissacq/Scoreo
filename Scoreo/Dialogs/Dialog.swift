

import UIKit
import SwiftEntryKit


class Dialog: NSObject {
    
   
    
    private class func openViewControllerAsDialog(viewController: UIViewController, dismissed : SwiftEntryKit.DismissCompletionHandler?)
    {
        var attributes = EKAttributes.init()
        attributes.entranceAnimation = .translation
        attributes.exitAnimation = .translation
        attributes.roundCorners = EKAttributes.RoundCorners.all(radius: 10)
        attributes.shadow = .active(with: .init(color: .black, opacity: 0.3, radius: 3, offset: .zero))
        attributes.displayDuration = .infinity
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .easeOut)
        attributes.position = .center
        attributes.screenInteraction = .dismiss
        attributes.entryInteraction = .absorbTouches
        attributes.screenBackground = .color(color: EKColor(UIColor(white: 0.0, alpha: 0.6)))
        attributes.positionConstraints = .float
        attributes.positionConstraints.safeArea = .empty(fillSafeArea: false)
        attributes.roundCorners = .top(radius: 10)
        attributes.lifecycleEvents.didDisappear = dismissed
        SwiftEntryKit.display(entry: viewController, using: attributes)
    }
    
    private class func openViewControllerAsDialog(viewController: UIViewController,name:String?)
    {
        openViewControllerAsDialog(viewController: viewController, dismissed: nil)
    }
    
    
    
    private class func openViewControllerAsBottomSheet(touchDismiss: Bool, viewController: UIViewController,dismissed:(()->Void)?)
    {
        var attributes = EKAttributes.init()
        attributes.entranceAnimation = .translation
        attributes.exitAnimation = .translation
        attributes.shadow = .active(with: .init(color: .black, opacity: 0.3, radius: 3, offset: .zero))
        attributes.displayDuration = .infinity
        attributes.position = .bottom
        if(touchDismiss)
        {
            attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .easeOut)
            attributes.screenInteraction = .dismiss
        }
        else {
            attributes.scroll = .enabled(swipeable: false, pullbackAnimation: .easeOut)
            attributes.screenInteraction = .absorbTouches
        }
        attributes.entryInteraction = .absorbTouches
        attributes.screenBackground = .color(color: EKColor(UIColor(white: 0.0, alpha: 0.6)))
        attributes.positionConstraints = .fullWidth
        attributes.positionConstraints.safeArea = .empty(fillSafeArea: true)
        attributes.lifecycleEvents.didDisappear = dismissed
        attributes.entryBackground = .color(color: EKColor(UIColor.white))
        attributes.roundCorners = EKAttributes.RoundCorners.top(radius: 10)
        SwiftEntryKit.display(entry: viewController, using: attributes)
    }
    
 
    
    class func openSuccessDialog(buttonLabel :String,title :String,msg :String, completed : @escaping ()->()){
        let vc = SuccessfullDialog.instance()
        vc.buttonLabel = buttonLabel
        vc.messageString = msg
        vc.titleString = title
        vc.confirmationButtonClicked = {
            completed()
        }
        
        openViewControllerAsDialog(viewController: vc, name: nil)
    }
    
    class func openMatchOptionsDialog(callReminder:@escaping()->(),callHighlights:@escaping()->(),callPin:@escaping()->(),callClose:@escaping()->()){
        let vc = MatchOptionsViewController.instance()
        vc.callbackReminder = callReminder
        vc.callbackHighLights = callHighlights
        vc.callbackPin = callPin
        vc.callbackClose = callClose
        openViewControllerAsDialog(viewController: vc,dismissed: callClose)
        
    }
    
    
    
    class func openSuccessDialog(buttonLabel :String,title :String,msg :String, completed : (()->())?, dismissed : (()->())?){
        let vc = SuccessfullDialog.instance()
        vc.buttonLabel = buttonLabel
        vc.messageString = msg
        vc.titleString = title
        vc.confirmationButtonClicked = {
            completed?()
        }
        
        openViewControllerAsDialog(viewController: vc, dismissed: dismissed)
    }
    
    class func openConfirmationDialog(title: String, message: String, proceedButtonClicked: @escaping (() -> Void),dismissed: (()->Void)?)
    {
        let vc = ConfirmationViewController.instance()
        vc.messageString = message
        vc.titleString = title
        vc.confirmButtonClicked = proceedButtonClicked
        vc.cancelButtonClicked = dismissed
        openViewControllerAsBottomSheet(touchDismiss: true, viewController: vc, dismissed: dismissed)
    }
    
    class func openLocationErrorDialog(parent viewController: UIViewController)
    {
        let alert = UIAlertController(title: "Location".localized, message: "Please enable location from the settings", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel".localized, style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "Settings".localized, style: .default, handler: {_ in
            Utility.gotoSettings()
        })
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        viewController.present(alert, animated: true, completion: nil)
    }
    
   
}
