//
//  ContentView.swift
//  СountryApp
//
//  Created by Данил Аникин on 06.12.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  @ObservedObject var favoriteModelView: FavoriteModelView
  
  init(modelContext: ModelContext) {
    self.favoriteModelView = FavoriteModelView(modelContext: modelContext)
  }
  
  @State var selected = 1
  var body: some View {
    
    ZStack {
      TabView {
        ListCountryView()
          .environmentObject(favoriteModelView)
          .tag(1)
          .tabItem {
            VStack {
              Image(systemName: "flag.fill")
              Text("Countries")
            }
          }
        FavoriteView()
          .environmentObject(favoriteModelView)
          .tag(2)
          .tabItem {
            VStack {
              Image(systemName: "hand.thumbsup.fill")
              Text("Favourites")
            }
          }
      }
    }
  }
}
