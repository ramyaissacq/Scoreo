

import UIKit
import SwiftEntryKit

class ConfirmationViewController: BaseViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var messageString = ""
    var titleString = ""
    
    var confirmButtonClicked: (() -> Void)?
    var cancelButtonClicked: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = messageString
        titleLabel.text = titleString
    }
    
    static func instance()-> ConfirmationViewController
    {
        let storyboard = UIStoryboard.init(name: "Dialogs", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "ConfirmationViewController") as! ConfirmationViewController
        return vc
    }

    @IBAction func noClicked(_ sender: Any) {
        SwiftEntryKit.dismiss()
        cancelButtonClicked?()
        
    }
    
    @IBAction func yesClicked(_ sender: Any) {
        SwiftEntryKit.dismiss()
        confirmButtonClicked?()
    }
}
