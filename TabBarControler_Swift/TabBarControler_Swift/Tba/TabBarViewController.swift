//
//  TabBarViewController.swift
//  TabBarControler_Swift
//
//  Created by MR.Sahw on 2020/11/17.
//

import UIKit

enum Operation {
    case toRight,toLeft
}

class TabBarViewController: UITabBarController {

    var costomInterAction : CostomInteraction!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.delegate = self
        
        costomInterAction = CostomInteraction(tabBarVC: self)
    }

}

extension TabBarViewController : UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let fromIndex = tabBarController.viewControllers!.firstIndex(of: fromVC)!
        let toIndex = tabBarController.viewControllers!.firstIndex(of: toVC)!
        
        let operation : Operation = toIndex > fromIndex ? .toRight : .toLeft
        return CostomAnimator(operation: operation)
    }
    func tabBarController(_ tabBarController: UITabBarController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return costomInterAction.isInterActive ? costomInterAction : nil
    }
}
