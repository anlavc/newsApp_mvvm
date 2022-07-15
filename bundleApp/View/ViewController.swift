//
//  ViewController.swift
//  bundleApp
//
//  Created by Anıl AVCI on 13.07.2022.
//

import UIKit


class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    public var articleListVM:ArticleListViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    var urlsports = URL(string:"https://newsapi.org/v2/top-headlines?country=tr&category=sports&apiKey=5cbbccb020874ca08f64011965b1c0af")!
    var urltech = URL(string:"https://newsapi.org/v2/top-headlines?country=tr&caregory=technology&apiKey=5cbbccb020874ca08f64011965b1c0af")!
    var urlgenel = URL(string:"https://newsapi.org/v2/top-headlines?country=tr&apiKey=5cbbccb020874ca08f64011965b1c0af")!
    var url : URL!
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        url = urlgenel
        setup()
          
    }

    func setup() {
       
         
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
            cell.tarihLabel.text = ArticleVM.publishedAt
    
        return cell
    }

    @IBAction func detailsButton(_ sender: Any) {
        performSegue(withIdentifier: "showDetails", sender: nil)
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            url = urlgenel
            setup()
           
            tableView.reloadData()
          
        case 1:
            
            url = urlsports
            setup()
            tableView.reloadData()
        case 2:
          
            url = urltech
            setup()
            tableView.reloadData()
        default:
            break
        }
        tableView.reloadData()
    }
}

