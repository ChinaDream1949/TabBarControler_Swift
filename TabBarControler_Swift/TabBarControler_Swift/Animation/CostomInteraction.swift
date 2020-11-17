//
//  CostomInteraction.swift
//  TabBarControler_Swift
//
//  Created by MR.Sahw on 2020/11/17.
//

import UIKit

class CostomInteraction: UIPercentDrivenInteractiveTransition {
    var isInterActive = false
    let tabBarVC : TabBarViewController
    
    init(tabBarVC : TabBarViewController) {
        self.tabBarVC = tabBarVC
        super.init()
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(pan:)))
        tabBarVC.view.addGestureRecognizer(pan)
        
    }
    @objc func handlePan (pan : UIPanGestureRecognizer){
        let translationX = pan.translation(in: pan.view).x
        let progress = abs(translationX / 200)
        
        switch pan.state {
        case .began:
            isInterActive = true
            if translationX < 0 {
                // 左滑
                if tabBarVC.selectedIndex <= tabBarVC.viewControllers!.count - 2 {
                    self.tabBarVC.selectedIndex += 1
                }
            }else{
                // 右滑
                if tabBarVC.selectedIndex >= 1 {
                    self.tabBarVC.selectedIndex -= 1
                }
            }
        case .changed:
            isInterActive = true
            update(progress)
        case .cancelled,.ended:
            isInterActive = false
            if progress >= 0.5 {
                finish()
            }else{
                cancel()
            }
        default:
            break
        }
    }
}
