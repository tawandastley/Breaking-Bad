//
//  FavouriteQuotesViewController.swift
//  Breaking Bad
//
//  Created by Tawanda Chandiwana on 2023/06/27.
//

import UIKit

class FavouriteQuotesViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "QuoteCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? QuoteCell)!
        cell.author.text = "testing"
        cell.quote.text = "123"
        cell.authorImage.image = UIImage(named: "Walter White")
        return cell
    }
    
    
}
