//
//  ContainmentWithAutoLayout.swift
//  Search
//
//  Created by Daniel Garbień on 2/5/17.
//  Copyright © 2017 Daniel Garbień. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /**
     Add childController with no transition.
     Embeds its view in container.
     Calls didMove(toParentViewController:) on childController at a last step.
     */
    func addImmediately(childController: UIViewController, embeddedIn container: UIView) {
        addChildViewController(childController)
        container.embed(subview: childController.view)
        childController.didMove(toParentViewController: self)
    }
    
    func removeImmediatelyFromParentViewController() {
        willMove(toParentViewController: nil)
        view.removeFromSuperview()
        removeFromParentViewController()
    }
}

extension UIView {
    
    func embed(subview: UIView) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(for: subview, withEqualFrameAs: self))
    }
}

extension NSLayoutConstraint {
    
    static func constraints(for item: AnyObject, withEqualFrameAs otherItem: AnyObject) -> [NSLayoutConstraint] {
        return constraints(
            for: item,
            otherItem: otherItem,
            equalAttributes: [.left, .right, .top, .bottom])
    }
    
    static func constraints(for item: AnyObject, otherItem: AnyObject, equalAttributes: [NSLayoutAttribute]) -> [NSLayoutConstraint] {
        return equalAttributes.map {
            return self.init(item: item, attribute: $0, relatedBy: .equal, toItem: otherItem, attribute: $0, multiplier: 1, constant: 0)
        }
    }
}
