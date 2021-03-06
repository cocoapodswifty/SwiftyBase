//
//  BaseNavigationController.swift
//  Pods
//
//  Created by MacMini-2 on 30/08/17.
//
//

#if os(macOS)
    import Cocoa
#else
    import UIKit
#endif

@IBDesignable
open class BaseNavigationController: UINavigationController,UIGestureRecognizerDelegate{
    
    // MARK: - Interface
    @IBInspectable open var clearBackTitle: Bool = true
    
    // MARK: - Lifecycle -
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        setDefaultParameters()
    }
    
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - Layout -
    
    
    // MARK: - Public Interface -
    
    func setDefaultParameters(){
        
        self.navigationBar.isTranslucent = false
        
        var navigationBarFont: UIFont? = UIFont(name: FontStyle.medium, size: 17.0)
        
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: Color.navigationBG.value,
                                                            NSFontAttributeName: navigationBarFont!] as [String : Any]
        
        self.navigationBar.tintColor = Color.navigationBG.value
        self.navigationBar.barTintColor = Color.appPrimaryBG.value
        self.navigationBar.isTranslucent = false
        self.view.backgroundColor = Color.appPrimaryBG.value
     
        self.navigationBar.setBottomBorder(Color.navigationBottomBorder.value, width: 1.0)
        
        
        // self.edgesForExtendedLayout = UIRectEdge.none
        
        //        //transperant Navigation Bar
        //        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //        self.navigationBar.shadowImage = UIImage()
        //        self.navigationBar.isTranslucent = true
        
        defer{
            navigationBarFont = nil
        }
    }
    
    
    // MARK: - User Interaction -
   
    override open func pushViewController(_ viewController: UIViewController, animated: Bool) {
        controlClearBackTitle()
        super.pushViewController(viewController, animated: animated)
    }
    
    override open func show(_ vc: UIViewController, sender: Any?) {
        controlClearBackTitle()
        super.show(vc, sender: sender)
    }
    
    // MARK: - Internal Helpers -
}

extension BaseNavigationController {
    
    open func controlClearBackTitle() {
        if self.clearBackTitle {
            topViewController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }
    
}
