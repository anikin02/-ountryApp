//
//  Country.swift
//  СountryApp
//
//  Created by Данил Аникин on 08.12.2024.
//

import Foundation

struct Country: Codable {
  let name: LanguageName
  let capital: [String]?
  let region: String
  let translations: Translations
  let latlng: [Double]
  let area: Double
  let population: Int
  let languages: [String : String]?
  let currencies: [String : Currency]?
  let timezones: [String]?
  let flags: Flag
  
  func getStringCurrency() -> String {
    var result = String()
    
    if let currencies = currencies {
      for item in currencies {
        result += item.value.name + "(\(item.value.symbol))"
      }
    } else {
      result = "-"
    }
    
    return result
  }
  
  func getStringLanguages() -> String {
    var result = String()
    
    if let languages = languages {
      for item in languages {
        result += item.value + " "
      }
    } else {
      result = "-"
    }
    
    return result
  }
  
  func getStringTimezones() -> String {
    var result = String()
    
    if let timezones = timezones {
      for item in timezones {
        result += item + " "
      }
    } else {
      result = "-"
    }
    
    return result
  }
}

struct LanguageName: Codable {
  let official: String
}

struct Translations: Codable {
  let rus: LanguageName
}

struct Currency: Codable {
  let name: String
  let symbol: String
}

struct Flag: Codable {
  let png: String
}
