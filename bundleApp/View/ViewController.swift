//
//  ViewController.swift
//  bundleApp
//
//  Created by Anıl AVCI on 13.07.2022.
//

import UIKit


class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    private var articleListVM:ArticleListViewModel!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func setup() {
        let url = URL(string:"https://newsapi.org/v2/top-headlines?country=tr&apiKey=5cbbccb020874ca08f64011965b1c0af")!
        Webservice().getData(url: url) { articles in
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    //Tableview func
    // table viewın kendisini birden fazla bölüme atyırması
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 :self.articleListVM.numberOfSections
    }
    // her bir sectionda kaç satır olacağını belirtir.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsSection(section)
    }
    //içerisine veriyi doldurmak için.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticleTableViewCell
        let ArticleVM = articleListVM.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = ArticleVM.title
        cell.descriptionLabel.text = ArticleVM.description
        cell.yazarLabel.text = ArticleVM.author
        
        let imgUrl = (ArticleVM.urlToImage)!
                print(imgUrl)
        cell.imageLabel.downloaded(from: imgUrl)
     /*
      // tarihi kısaltarak yazma
      let dateFormatterPrint = DateFormatter()
      dateFormatterPrint.dateFormat = "dd MMM,yyyy"
      let exactlyCurrentTime: Date = Date()
      
        cell.tarihLabel.text = dateFormatterPrint.string(from: ArticleVM.publishedAt)

*/
      
   
        
        cell.tarihLabel.text = ArticleVM.publishedAt
        
       
        //cell.imageLabel.image = ArticleVM.urlToImage
        return cell
    }
}

