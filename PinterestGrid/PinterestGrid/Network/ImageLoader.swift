//
//  ImageLoader.swift
//  PinterestGrid
//
//  Created by 김인환 on 2023/02/08.
//

import UIKit
import Combine

class URLImageLoader: ObservableObject {
    @Published var image = UIImage(systemName: "logo")
    
    private let network = NetworkService(session: .shared)
    private var cancellables = Set<AnyCancellable>()
    
    func fetch(urlString: String?) {
        guard let urlString = urlString else { return }
        let url = URL(string: urlString)
        let urlRequest = RequestBuilder(url: url, body: nil, headers: nil).build()
        
        guard let request = urlRequest else { return }
        network.request(request: request)
            .sink { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("success")
                }
            } receiveValue: { [weak self] data in
                DispatchQueue.main.async {
                    self?.image = UIImage(data: data)
                }
            }
            .store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
