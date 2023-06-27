//
//  DetailViewController.swift
//  Breaking Bad
//
//  Created by Tawanda Chandiwana on 2023/06/27.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var image: UIImage!
    var quote: String!
    var author: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        quoteLabel.text = quote
        authorLabel.text = author
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        print("i am happy")
    }
    

}
