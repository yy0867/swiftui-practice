//
//  ContentViewModel.swift
//  ContainerPractice
//
//  Created by 김세영 on 2022/03/24.
//

import Combine
import Foundation

struct Content: Identifiable, Hashable {
    var id: Int
    var imageData: Data?
}

class ContentViewModel: ObservableObject {
    
    @Published public private(set) var contents: [Content] = []
    
    func fetchContentImages() async {
        contents.removeAll()
        for i in 1...20 {
            let url = URL(string: "https://picsum.photos/id/\(i)/200")!
            if let data = await ImageCache.default.fetchImageData(at: url) {
                DispatchQueue.main.async {
                    self.contents.append(Content(id: i, imageData: data))
                }
            }
        }
    }
}

class ImageCache {
    
    static let `default` = ImageCache()
    private var cache = NSCache<NSString, NSData>()
    
    func fetchImageData(at url: URL) async -> Data? {
        if let data = cache.object(forKey: url.absoluteString as NSString) {
            return data as Data
        }
        if let (data, _) = try? await URLSession.shared.data(from: url) {
            cache.setObject(data as NSData, forKey: url.absoluteString as NSString)
            return data
        }
        return nil
    }
}
