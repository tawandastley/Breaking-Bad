//
//  Service.swift
//  Breaking Bad
//
//  Created by Tawanda Chandiwana on 2023/06/21.
//

import Foundation

struct Service {
    
    func fetchQuotes (completion: @escaping ([QuotesModel])->()) {
        let url =  "https://api.breakingbadquotes.xyz/v1/quotes/6"
        guard let  myUrl = URL(string: url) else {
        print("error with this url")
            return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: myUrl) { (data, _, error) in
            if error == nil , data != nil {
                
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode([QuotesModel].self, from: data!)
                completion(decodedData)
            }
            catch {
                print(error)
            }
        }
            else if error != nil{
                print(error)
            }
        }
        task.resume()
    }
    
    func parseData(quotes: Data){
        
        
    }
}
