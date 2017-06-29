//
//  Tabbed.swift
//  Five Dialer
//
//  Created by Chanchal Raj on 29/06/2017.
//  Copyright © 2017 Khatri Soft. All rights reserved.
//

import UIKit
import Pageboy
import Tabman

class TabbedViewController: TabmanViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
    }

    
    
}
extension TabbedViewController: PageboyViewControllerDataSource {
    
    func viewControllers(forPageboyViewController pageboyViewController: PageboyViewController) -> [UIViewController]? {
        
        let viewController1 = self.storyboard?.instantiateViewController(withIdentifier: "HomeView")
        let viewControllers = [viewController1, viewController1]
        
        // configure the bar
        self.bar.items = [Item(title: "Call"),
                          Item(title: "Call History")]
        
        return viewControllers as? [UIViewController]
    }
    
    func defaultPageIndex(forPageboyViewController pageboyViewController: PageboyViewController) -> PageboyViewController.PageIndex? {
        return nil
    }
}

