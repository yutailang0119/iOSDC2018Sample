//
//  CrashViewController.swift
//  iOSDC2018Sample
//
//  Created by Yutaro Muta on 2018/08/29.
//  Copyright © 2018 Yutaro Muta. All rights reserved.
//

import UIKit

final class CrashViewController: UIViewController {

    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var queryItemsLabel: UILabel!

    deinit {
        print("deinit UnsafeViewController")
    }

    @IBAction func tapWeak(_ sender: UIButton) {
        request(by: .weak) { [weak self] response in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
                self?.reloadView(by: response)
            }
        }
        navigationController?.popViewController(animated: true)
    }

    @IBAction func tapUnowned(_ sender: UIButton) {
        request(by: .unowned) { [unowned self] response in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
                self.reloadView(by: response)
            }
        }
        navigationController?.popViewController(animated: true)
    }

    private func request(by referenceType: ReferenceType, handler closure: @escaping ([String: Any]) -> Void ) {
        let apiClient: URLSessionClient = URLSessionClient()
        apiClient.get(url: "https://httpbin.org/get", queryItems: referenceType.queryItems, successHandler: closure)
    }

    private func reloadView(by response: [String: Any]) {
        let parsedResponse = Response(response: response)
        DispatchQueue.main.async {
            self.urlLabel.text = parsedResponse?.url
            self.queryItemsLabel.text = parsedResponse?.args
        }
    }
}
