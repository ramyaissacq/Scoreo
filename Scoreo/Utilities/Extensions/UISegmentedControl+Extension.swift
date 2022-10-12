

import UIKit

extension UISegmentedControl
{
    @IBInspectable
    var selectedTextColor: UIColor
    {
        get {
            return self.selectedTextColor
        }
        
        set {
            let titleTextAttributes = [NSAttributedString.Key.foregroundColor: newValue]
            self.setTitleTextAttributes(titleTextAttributes, for: .selected)
        }
    }
    
    @IBInspectable
    var unSelectedTextColor: UIColor
    {
        get {
            return self.unSelectedTextColor
        }
        
        set {
            let titleTextAttributes = [NSAttributedString.Key.foregroundColor: newValue]
            self.setTitleTextAttributes(titleTextAttributes, for: .normal)
        }
    }
}
