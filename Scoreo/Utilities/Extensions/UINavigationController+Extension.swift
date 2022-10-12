

import UIKit

extension UINavigationController {
    func removeBottomLine()
    {
        let navigationBar = self.navigationBar
        navigationBar.shadowImage = UIImage()
        navigationBar.layoutIfNeeded()
    }
}
