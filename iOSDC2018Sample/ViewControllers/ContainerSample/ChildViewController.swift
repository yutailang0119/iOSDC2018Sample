//
//  ChildViewController.swift
//  iOSDC2018Sample
//
//  Created by Yutaro Muta on 2018/09/01.
//  Copyright © 2018 Yutaro Muta. All rights reserved.
//

import UIKit

final class ChildViewController: UIViewController {

    var referenceType: ReferenceType!
    var tapClosure: ((String) -> Void)?

    @IBAction func tap(_ sender: UIButton) {
        tapClosure!("\(referenceType): Tapped!!")
    }

}
