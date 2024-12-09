//
//  FavoriteModelView.swift
//  СountryApp
//
//  Created by Данил Аникин on 09.12.2024.
//

import Foundation
import SwiftData

class FavoriteModelView: ObservableObject {
  @Published var favoriteCountries = [FavoriteItem]()
  var modelContext: ModelContext
  
  init(modelContext: ModelContext) {
    self.modelContext = modelContext
    fetchData()
  }
  
  func fetchData() {
    do {
      let descriptor = FetchDescriptor<FavoriteItem>()
      favoriteCountries = try modelContext.fetch(descriptor)
    } catch {
      print("Fetch failed")
    }
  }
  
  func addFavoriteItem(country: Country) {
    let country = FavoriteItem(country: country)
    modelContext.insert(country)
    fetchData()
  }
  
  func deleteFavoriteItem(country: Country) {
    if let index = favoriteCountries.firstIndex(where: {$0.country.name.official == country.name.official}) {
      modelContext.delete(favoriteCountries[index])
    }
    fetchData()
  }
}
