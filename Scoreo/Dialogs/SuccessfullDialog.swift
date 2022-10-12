

import UIKit
import SwiftEntryKit

class SuccessfullDialog: BaseViewController {

    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var messageString = ""
    var titleString = ""
    var buttonLabel = ""
    
    var confirmationButtonClicked:(()->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        messageLabel.text = messageString
        titleLabel.text = titleString
        okButton.setTitle(buttonLabel, for: .normal)
    }
    
    
    
    static func instance()-> SuccessfullDialog
    {
        let storyboard = UIStoryboard.init(name: "Dialogs", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SuccessfullDialog") as! SuccessfullDialog
        return vc
    }
    

    @IBAction func okButtonClicked(_ sender: Any) {
        SwiftEntryKit.dismiss()
        confirmationButtonClicked?()
    }
    
}
