//
//  QuotesViewModel.swift
//  Breaking Bad
//
//  Created by Tawanda Chandiwana on 2023/06/21.
//

import Foundation

struct QuotesViewModel {
    
    var quote: String
    var author: String
    var imageName: String {
        return author
    }
}
