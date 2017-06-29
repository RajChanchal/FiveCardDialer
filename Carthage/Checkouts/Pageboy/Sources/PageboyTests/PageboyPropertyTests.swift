//
//  PageboyPropertyTests.swift
//  Pageboy
//
//  Created by Merrick Sapsford on 22/03/2017.
//  Copyright © 2017 Merrick Sapsford. All rights reserved.
//

import XCTest
@testable import Pageboy

class PageboyPropertyTests: PageboyTests {
    
    /// Test that currentViewController property returns correct view controller.
    func testCorrectCurrentViewControllerReported() {
        self.dataSource.numberOfPages = 5
        self.pageboyViewController.dataSource = self.dataSource
        
        self.pageboyViewController.scrollToPage(.next, animated: false)
        
        let currentViewController = self.pageboyViewController.currentViewController
        
        XCTAssertTrue(currentViewController === self.dataSource.viewControllers[1],
                      "currentViewController property is incorrect following transitions.")
    }
    
    /// Test that setting isScrollEnabled updates internal scroll view correctly.
    func testIsScrollEnabledUpdates() {
        self.dataSource.numberOfPages = 5
        self.pageboyViewController.dataSource = self.dataSource
        
        self.pageboyViewController.isScrollEnabled = false
        
        XCTAssertTrue(self.pageboyViewController.pageViewController?.scrollView?.isScrollEnabled == false,
                      "isScrollEnabled does not update the internal scrollView correctly.")
    }
}
