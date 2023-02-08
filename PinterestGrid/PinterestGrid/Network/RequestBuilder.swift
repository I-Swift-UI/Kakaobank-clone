//
//  RequestBuilder.swift
//  PinterestGrid
//
//  Created by 김인환 on 2023/02/08.
//

import Foundation

enum NetworkMethod: String {
    case get
    case post
    case put
    case patch
    case delete
}

struct RequestBuilder {
    let url: URL?
    let method: NetworkMethod = .get
    let body: Data?
    let headers: [String: String]?
    
    func build() -> URLRequest? {
        guard let url = url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue.uppercased()
        if let body = body {
            request.httpBody = body
        }
        if let headers = headers {
            request.allHTTPHeaderFields = headers
        }
        return request
    }
}
