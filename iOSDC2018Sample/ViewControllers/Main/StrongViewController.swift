//
//  StrongViewController.swift
//  iOSDC2018Sample
//
//  Created by Yutaro Muta on 2018/08/29.
//  Copyright © 2018 Yutaro Muta. All rights reserved.
//

import UIKit

final class StrongViewController: UIViewController {

    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var queryItemsLabel: UILabel!

    deinit {
        print("deinit StrongViewController")
    }

    @IBAction func tapStrong(_ sender: UIButton) {
        let apiClient: URLSessionClient = URLSessionClient()
        let referenceType = ReferenceType.strong
        apiClient.get(url: "https://httpbin.org/get", queryItems: referenceType.queryItems) { response in
            self.reloadView(by: response)
        }
    }

    private func reloadView(by response: [String: Any]) {
        let parsedResponse = Response(response: response)
        DispatchQueue.main.async {
            self.urlLabel.text = parsedResponse?.url
            self.queryItemsLabel.text = parsedResponse?.args
        }
    }
}
