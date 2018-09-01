//
//  ParentViewController.swift
//  iOSDC2018Sample
//
//  Created by Yutaro Muta on 2018/09/01.
//  Copyright © 2018 Yutaro Muta. All rights reserved.
//

import UIKit

final class ParentViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var containerView: UIView!

    deinit {
        print("deinit ParentViewController")
    }
    
    @IBAction func tapStrong(_ sender: UIButton) {
        addChildView(by: .strong)
    }

    @IBAction func tapWeak(_ sender: UIButton) {
        addChildView(by: .weak)
    }

    @IBAction func tapUnowned(_ sender: UIButton) {
        addChildView(by: .unowned)
    }
    
    private func resetChildViewControllers() {
        childViewControllers.forEach {
            $0.willMove(toParentViewController: nil)
            $0.view.removeFromSuperview()
            $0.removeFromParentViewController()
        }
    }

    private func addChildView(by referenceType: ReferenceType) {
        resetChildViewControllers()

        let storyboard = UIStoryboard(name: "ContainerSample", bundle: nil)
        let childViewController = storyboard.instantiateViewController(withIdentifier: "Child") as! ChildViewController
        let closure: (String) -> Void
        switch referenceType {
        case .strong:
            closure = { text in
                self.textLabel.text = text
            }
        case .weak:
            closure = { [weak self] text in
                self?.textLabel.text = text
            }
        case .unowned:
            closure = { [unowned self] text in
                self.textLabel.text = text
            }
        }
        childViewController.referenceType = referenceType
        childViewController.tapClosure = closure
        addChildViewController(childViewController)
        childViewController.view.frame = containerView.bounds
        containerView.addSubview(childViewController.view)
        childViewController.didMove(toParentViewController: self)
        
    }
}
