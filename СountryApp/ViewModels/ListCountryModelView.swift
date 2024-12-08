//
//  ListCountryModelView.swift
//  СountryApp
//
//  Created by Данил Аникин on 08.12.2024.
//

import Foundation

class ListCountryModelView: ObservableObject {
  @Published var allCountries = [Country]()
  @Published var searchCountries = [Country]()
  
  @Published var searchText = String()
  
  init() {
    loadCountries()
  }
  
  private func loadCountries() {
    APIManager.shared.getCountries() { responce in
      DispatchQueue.main.async {
        self.allCountries = responce
      }
    }
  }
  
  func getSearchCountries() {
    if searchText.isEmpty {
      searchCountries = []
    } else {
      searchCountries = allCountries.filter {
        $0.name.official.contains(searchText) || $0.translations.rus.official.contains(searchText)
      }
    }
  }
  
}
