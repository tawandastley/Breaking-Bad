//
//  QuoteCell.swift
//  Breaking Bad
//
//  Created by Tawanda Chandiwana on 2023/06/21.
//

import UIKit

class QuoteCell: UITableViewCell {

    @IBOutlet weak var authorImage: UIImageView!

    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var quote: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
