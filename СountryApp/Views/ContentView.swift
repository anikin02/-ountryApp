//
//  ContentView.swift
//  СountryApp
//
//  Created by Данил Аникин on 06.12.2024.
//

import SwiftUI

struct ContentView: View {
  @State var selected = 1
  var body: some View {
    
    ZStack {
      TabView {
        ListCountryView()
          .tag(1)
          .tabItem {
            VStack {
              Image(systemName: "flag.fill")
              Text("Countries")
                .font(.system(size: 30))
            }
          }
        ListCountryView()
          .tag(2)
          .tabItem {
            VStack {
              Image(systemName: "hand.thumbsup.fill")
              Text("Favourites")
                .font(.system(size: 30))
            }
          }
      }
    }
  }
}

#Preview {
  ContentView()
}
