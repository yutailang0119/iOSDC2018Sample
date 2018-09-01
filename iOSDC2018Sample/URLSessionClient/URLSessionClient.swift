//
//  URLSessionClient.swift
//  iOSDC2018Sample
//
//  Created by Yutaro Muta on 2018/08/29.
//  Copyright © 2018 Yutaro Muta. All rights reserved.
//

import Foundation

class URLSessionClient {

    func get(url urlString: String, queryItems: [URLQueryItem]? = nil, successHandler: @escaping (([String: Any]) -> Void)) {
        var compnents = URLComponents(string: urlString)
        compnents?.queryItems = queryItems
        let url = compnents?.url
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                    guard let dictionary = json as? [String: Any] else {
                        print("Data Format Error")
                        return
                    }
                    successHandler(dictionary)
                } catch {
                    print("Serialize Error")
                }
            } else {
                print(error ?? "Error")
            }
        }

        task.resume()
    }

}
