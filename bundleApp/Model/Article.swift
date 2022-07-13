//
//  Article.swift
//  bundleApp
//
//  Created by Anıl AVCI on 13.07.2022.
//

import Foundation
import UIKit

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    
    var author: String?
    var title: String?
    var urlToImage: String?
    var publishedAt: String?
    var description: String?
}


