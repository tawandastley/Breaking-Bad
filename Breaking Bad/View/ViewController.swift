//
//  ViewController.swift
//  Breaking Bad
//
//  Created by Tawanda Chandiwana on 2023/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let refreshControl = UIRefreshControl()
    var breakingBadQoutes = [QuotesModel]()
    let service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "QuoteCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        fetchQuotes()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl) // not required when using UITableViewController
    }
    
    @objc func refresh(_ sender: AnyObject) {
        fetchQuotes()
        refreshControl.endRefreshing()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DetailViewController
        let selectedRow = tableView.indexPathForSelectedRow?.row
        let quote = breakingBadQoutes[selectedRow ?? 0].quote
        let author = breakingBadQoutes[selectedRow ?? 0].author
        destinationVC.quote = quote
        destinationVC.author = author
        destinationVC.image = UIImage(named: author ?? "Walter White")
    }
    
    private func fetchQuotes() {
        service.fetchQuotes { quotes in
            self.breakingBadQoutes = quotes
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
    
extension ViewController: UITableViewDataSource,UITableViewDelegate {
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailScreenSegue", sender: self)
    }
}

