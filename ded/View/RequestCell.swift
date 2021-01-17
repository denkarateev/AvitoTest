//
//  RequestCell.swift
//  ded
//
//  Created by Денис Каратеев on 10.01.2021.
//

import Foundation
import UIKit
class RequestCell {
     func imageDownload(url: String, completion: @escaping (UIImage) -> Void ) {
        
        guard let url = URL(string: url) else {return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, responce, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {
                return
            }
            let image = UIImage(data: data)
            
            completion(image!)
        }.resume()
        
    }
    func parseJson(onCompletion: @escaping (AdData) -> Void) {
        if let json = Bundle.main.url(forResource: "result", withExtension: "json") {
            do {
                
                let data = try Data(contentsOf: json)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode(AdData.self, from: data)
                onCompletion(dataFromJson)
                
                print(dataFromJson)
            } catch {
                print(error)
            }
        }
        
        
    }
}
