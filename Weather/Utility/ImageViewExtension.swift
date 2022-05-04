//
//  ImageViewExtension.swift
//  Weather
//
//  Created by Akash Arun Jambhulkar (Digital) on 5/4/22.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    /// Load image
    ///
    /// - Parameter url: URL of the image
    func load(_ url: String?, placeholder: UIImage? = nil, callback: ((UIImage?) -> Void)? = nil) {
        
        self.image = placeholder
        guard let urlStr = url,
        let url = URL(string: ApiEndpoints.imageURL + urlStr + "@2x.png") else { return }
        
        self.kf.setImage(
            with: url,
            placeholder: placeholder,
            options: [
                .scaleFactor(UIScreen.main.scale),
                .cacheOriginalImage,
                .loadDiskFileSynchronously
            ], completionHandler:  { result in
                switch result {
                case .success(let value):
                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
                case .failure(let error):
                    print("Job failed: \(error.localizedDescription)")
                }
            })
    }
}
