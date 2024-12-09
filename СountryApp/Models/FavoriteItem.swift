//
//  FavoriteItem.swift
//  СountryApp
//
//  Created by Данил Аникин on 09.12.2024.
//

import Foundation
import SwiftData

@Model
final class FavoriteItem {
  let id: UUID
  let country: Country
  
  init(country: Country) {
    self.country = country
    self.id = UUID()
  }
}

