//
//  ImageLoader.swift
//  PinterestGrid
//
//  Created by 김인환 on 2023/02/08.
//

import Foundation
import Combine

class ImageSearchService: ObservableObject {
    @Published var imageData = ImageData(documents: [], meta: Meta(isEnd: true, pageableCount: 0, totalCount: 0))
    
    static let shared = ImageSearchService()
    
    private let network = NetworkService(session: .shared)
    private var cancellables = Set<AnyCancellable>()
    
    let urlString = "https://dapi.kakao.com/v2/search/image?sort=accuracy&page=1&size=80&query=%EC%95%88%EC%9C%A0%EC%A7%84"
    
    func fetchImageData(query: String) {
        let url = URL(string: urlString)
        let urlRequest = RequestBuilder(url: url,
                                        body: nil,
                                        headers: [
                                            "Authorization": "KakaoAK 6f2aca8923c166f0c596040281f9ed12"
                                        ]).build()
        
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
                do {
                    let data = try JSONDecoder().decode(ImageData.self, from: data)
                    self?.imageData = data
                } catch {
                    print(error)
                }
            }
            .store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
