//
//  APIManager.swift
//  СountryApp
//
//  Created by Данил Аникин on 08.12.2024.
//

import Foundation

class APIManager {
  private init() {}
  
  static let shared = APIManager()
  
  func getCountries(completion: @escaping ([Country]) -> Void) {
    let urlString: String = "https://restcountries.com/v3.1/all"
    
    guard let url = URL(string: urlString) else { return }
    
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
      if error != nil {
        print(error!.localizedDescription)
      } else if let data = data {
        do {
          let decoder = JSONDecoder()
          let response = try decoder.decode([Country].self, from: data)
          completion(response)
        } catch {
          print(error.localizedDescription)
        }
      }
    })
    task.resume()
  }
}
