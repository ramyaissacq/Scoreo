

import UIKit
import Kingfisher

extension UIImageView{
    var imageWithFade:UIImage?
    {
        get
        {
            return self.image
        }
        set
        {
            UIView.transition(with: self,
                              duration: 0.3, options: .transitionCrossDissolve, animations: {
                                self.image = newValue
            }, completion: nil)
        }
    }
    
    func setImage(with urlString: String?, placeholder: UIImage?)
    {
        if let url = URL.init(string: urlString ?? "")
        {
            self.kf.indicatorType = .activity
            self.kf.setImage(with: url, placeholder: placeholder, options:nil)
        }
        else {
//            self.contentMode = .scaleAspectFill
            self.image = placeholder
            return
        }
    }
    
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
      }
}

