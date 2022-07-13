//
//  Webservice.swift
//  bundleApp
//
//  Created by Anıl AVCI on 13.07.2022.
//

import Foundation

class Webservice {
    
    func getData(url: URL, completion: @escaping ([Article]?) -> () ) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                
                completion(nil)
            } else if let data = data {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let articleList = articleList {
                    completion(articleList.articles)
                }
            }
        }.resume()
        
    }
    
}
