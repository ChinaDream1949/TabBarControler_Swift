//
//  CostomAnimator.swift
//  TabBarControler_Swift
//
//  Created by MR.Sahw on 2020/11/17.
//

import UIKit

class CostomAnimator: NSObject , UIViewControllerAnimatedTransitioning{
    
    let operation : Operation
    
    
    init(operation : Operation) {
        self.operation = operation
        super.init()
    }
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let fromView = transitionContext.view(forKey: .from) , let toView = transitionContext.view(forKey: .to) else {return}
        containerView.addSubview(toView)
        
//        if operation == .toRight {
//            toView.frame.origin.x = containerView.frame.width
//        }else{
//            toView.frame.origin.x = -containerView.frame.width
//        }
        let offset = containerView.frame.width
        toView.frame.origin.x = operation == .toRight ? offset : -offset
        toView.alpha = 0
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
            fromView.alpha = 0
            fromView.frame.origin.x = self.operation == .toRight ? -offset : offset
            toView.alpha = 1
            toView.frame.origin.x = 0
        } completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }

    }
    

}
