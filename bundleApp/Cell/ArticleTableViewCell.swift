//
//  ArticleTableViewCell.swift
//  bundleApp
//
//  Created by Anıl AVCI on 13.07.2022.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yazarLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var tarihLabel: UILabel!
 
}


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
