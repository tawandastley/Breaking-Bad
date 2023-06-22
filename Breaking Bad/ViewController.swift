//
//  ViewController.swift
//  Breaking Bad
//
//  Created by Tawanda Chandiwana on 2023/06/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    var breakingBadQoutes = [QuotesModel]()
    let service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "QuoteCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        service.fetchQuotes { quotes in
            self.breakingBadQoutes = quotes
   
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
            }
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            service.fetchQuotes { quotes in
                self.breakingBadQoutes = quotes
           
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                }
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        service.fetchQuotes { quotes in
            self.breakingBadQoutes = quotes
            print(quotes)
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breakingBadQoutes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? QuoteCell)!
        let quote = breakingBadQoutes[indexPath.row].quote
        let author = breakingBadQoutes[indexPath.row].author
        cell.quote.text = quote
        cell.author.text = author
        cell.authorImage.image = UIImage(named: author ?? "Walter White")
        return cell
    }
    
    @IBAction func refreshTapped(_ sender: UIButton) {
        service.fetchQuotes { quotes in
            self.breakingBadQoutes = quotes
            print(quotes)
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
            }
        }
    }
}

