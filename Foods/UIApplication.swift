
import UIKit

extension UIApplication {
    
    //获取位于顶层的ViewController
    class func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        //获取NavigationController的topViewController
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        //获取TabBarController的
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }

        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        
        if let slide = viewController as? SlideMenuController {
            return topViewController(slide.mainViewController)
        }
        return viewController
    }
}
