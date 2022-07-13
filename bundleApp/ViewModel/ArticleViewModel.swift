//
//  ArticleViewModel.swift
//  bundleApp
//
//  Created by Anıl AVCI on 13.07.2022.
//

import Foundation
import UIKit


// 2. kısım
struct ArticleListViewModel {
    let articles: [Article]
}
extension ArticleListViewModel {
    var numberOfSections: Int {
        return articles.count
    }
    
    func numberOfRowsSection(_ section: Int) -> Int {
        return articles.count
    }
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}


// 1. kısım

struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String? {
        return self.article.title
    }
    var author: String? {
        return self.article.author
    }
    var description: String? {
        return self.article.description
    }
    var urlToImage: String? {
        
      return self.article.urlToImage
    }
    var publishedAt: String? {
        return self.article.publishedAt
    }
}
