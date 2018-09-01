//
//  Response.swift
//  iOSDC2018Sample
//
//  Created by Yutaro Muta on 2018/08/29.
//  Copyright © 2018 Yutaro Muta. All rights reserved.
//

import Foundation

struct Response {
    let url: String
    private let _args: [String: String]

    init?(response: [String: Any]) {
        guard let url = response["url"] as? String,
            let args = response["args"] as? [String: String] else {
                return nil
        }
        self.url = url
        self._args = args
    }

    var args: String {
        return _args
            .reduce(into: "{", { (result, values) in
                result += "\n    \"\(values.key)\": \"\(values.value)\","
            }) + "\n}"
    }

}
