//
//  Tabbed.swift
//  Five Dialer
//
//  Created by Chanchal Raj on 29/06/2017.
//  Copyright © 2017 Khatri Soft. All rights reserved.
//

import UIKit

class TabbedViewController:UIViewController {
    private var viewControllers:[UIViewController]!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var btnCall: UIButton!
    @IBOutlet weak var btnCallHistory: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "HomeView")
        let callHistoryView = self.storyboard?.instantiateViewController(withIdentifier: "HomeView")
        self.viewControllers = [homeView!,callHistoryView!]
        addContentController(homeView!, to: containerView)
    }
    private func addContentController(_ child: UIViewController, to containerView: UIView) {
        if child == viewControllers[0]{
            removeContentController(viewControllers[1], from: view)
        }else{
            removeContentController(viewControllers[0], from: view)
        }
        addChildViewController(child)
        containerView.addSubview(child.view)
        child.didMove(toParentViewController: self)
    }
    private func removeContentController(_ child: UIViewController, from containerView: UIView) {
        if (containerView.subviews.contains(child.view)){
            child.willMove(toParentViewController: nil)
            child.view.removeFromSuperview()
            child.removeFromParentViewController()
        }
    }
    @IBAction func btnCallAction(_ sender: Any) {
        btnCall.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        btnCallHistory.titleLabel?.font = UIFont.systemFont(ofSize: 17)
    }
    @IBAction func btnCallHistoryAction(_ sender: Any) {
        btnCallHistory.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        btnCall.titleLabel?.font = UIFont.systemFont(ofSize: 17)
    }
}


