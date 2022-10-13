

import UIKit
import SideMenu

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        setTitleMargin()
      setNavBarColor()
       // setTitle()
    }
    
    func setTitleMargin()
    {
        let style = NSMutableParagraphStyle()
        style.firstLineHeadIndent = 5
        navigationController?.navigationBar.standardAppearance.largeTitleTextAttributes = [NSAttributedString.Key.paragraphStyle : style]
    }
    
    func setNavBarColor()
    {
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.removeBottomLine()
        let yourBackImage = UIImage(named: "back")
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.setBackIndicatorImage(yourBackImage, transitionMaskImage: yourBackImage)
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor.black
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.shadowColor = .clear
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    func setTitle(title:String){
        self.navigationItem.titleView = getHeaderLabel(title: title)
    }
    
    func getHeaderLabel(title:String) -> UILabel{
        let w = title.width(forHeight: 25, font: UIFont(name: "Roboto-Medium", size: 23)!)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: w, height: 20))
        label.text = title
        label.font = UIFont(name: "Roboto-Medium", size: 23)
        let gradient = label.getGradientLayer(bounds: label.bounds)
        label.textColor = label.gradientColor(bounds: label.bounds, gradientLayer: gradient)
        return label
    }
   
    
   static func openSideMenu(vc:UIViewController){
        let sideMenuVc = UIStoryboard(name: "SideMenu", bundle: nil).instantiateViewController(withIdentifier: "SideMenuViewController")
        let menu = SideMenuNavigationController(rootViewController: sideMenuVc)
       menu.leftSide = true
       menu.menuWidth = UIScreen.main.bounds.width - 50
       menu.navigationBar.isHidden = true
        menu.statusBarEndAlpha = 0
        vc.present(menu, animated: true)
    }
        

    
}
