//
//  NetworkService.swift
//  PinterestGrid
//
//  Created by 김인환 on 2023/02/08.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidRequest
    case unknownError(message: String)
}

final class NetworkService {
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func request(request: URLRequest) -> AnyPublisher<Data, NetworkError> {
        return session.dataTaskPublisher(for: request)
            .tryMap { (data: Data, response: URLResponse) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else { throw NetworkError.invalidRequest }
                return data
            }
            .mapError { error -> NetworkError in
                    .unknownError(message: error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
