//
//  QuotesModel.swift
//  Breaking Bad
//
//  Created by Tawanda Chandiwana on 2023/06/21.
//

import Foundation

struct QuotesModel: Decodable {
    
    var quote  : String? = nil
    var author : String? = nil
    
    enum CodingKeys: String, CodingKey {
        case quote  = "quote"
        case author = "author"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        quote  = try values.decodeIfPresent(String.self , forKey: .quote  )
        author = try values.decodeIfPresent(String.self , forKey: .author )
    }
    
    init() { }
}
