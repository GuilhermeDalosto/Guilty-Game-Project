//
//  UserOnboardingVC.swift
//  GuiltyGameProject
//
//  Created by Ferraz on 09/01/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import UIKit

class UserOnboardingVC: UIPageViewController {

    var orderedViewControllers: [UIViewController] {
        return [self.createVC(named: "Judge"), self.createVC(named: "Defendant"), self.createVC(named: "Game"), self.createVC(named: "Turn"), self.createVC(named: "Team"), self.createVC(named: "Control")]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        if let firstVC = orderedViewControllers.first{
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }

    func createVC(named: String) -> UIViewController{
//        let path = Bundle.main.path(forResource: "\(named)Onboarding", ofType: "storyboard", inDirectory: "View")!
        print("--->")
        let url2 = Bundle.main.url(forResource: "GuiltyGameProject",withExtension: nil)
        print(url2?.pathComponents)
        
        let url = Bundle.main.url(forResource: "\(named)Onboarding", withExtension: "storyboard",subdirectory: "" )!
//
//        let url = Bundle.main.url(forResource: "\(named)Onboarding", withExtension: "storyboard")!
//        return UIStoryboard(name: "\(named)Onboarding", bundle: Bundle.main).instantiateInitialViewController()!
        
        return UIStoryboard(name: "\(named)Onboarding", bundle: Bundle.init(url: url)).instantiateInitialViewController()!
    }
    
}

extension UserOnboardingVC: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil }
        
        let previousVC = vcIndex - 1
        
        guard previousVC >= 0 else { return nil }
        
        guard orderedViewControllers.count > previousVC else { return nil }
        
        return orderedViewControllers[previousVC]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil }
        
        let nextVC = vcIndex + 1
        let orderedVCCount = orderedViewControllers.count
        
        guard nextVC > orderedVCCount else { return nil }
        
        return orderedViewControllers[nextVC]
    }
    
    
}
