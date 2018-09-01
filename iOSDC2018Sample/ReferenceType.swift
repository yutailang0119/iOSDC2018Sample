//
//  ReferenceType.swift
//  iOSDC2018Sample
//
//  Created by Yutaro Muta on 2018/08/29.
//  Copyright © 2018 Yutaro Muta. All rights reserved.
//

import Foundation

enum ReferenceType: String {
    case strong
    case `weak`
    case `unowned`

    var queryItems: [URLQueryItem] {
        switch self {
        case .strong:
            return [URLQueryItem(name: "reference", value: "strong"),
                    URLQueryItem(name: "foo", value: "123")]
        case .weak:
            return [URLQueryItem(name: "reference", value: "weak"),
                    URLQueryItem(name: "bar", value: "456")]
        case .unowned:
            return [URLQueryItem(name: "reference", value: "unowned"),
                    URLQueryItem(name: "baz", value: "789")]
        }
    }
}
