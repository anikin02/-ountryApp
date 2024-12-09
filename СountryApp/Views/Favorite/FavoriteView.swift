//
//  FavoriteView.swift
//  СountryApp
//
//  Created by Данил Аникин on 09.12.2024.
//

import SwiftUI

struct FavoriteView: View {
  
  @EnvironmentObject var viewModel: FavoriteModelView
  
  var body: some View {
    NavigationStack {
      ScrollView() {
        VStack(spacing: 25) {
          ForEach(viewModel.favoriteCountries, id: \.country.name.official) { item in
            NavigationLink(destination: DetailsCountryView(country: item.country).environmentObject(viewModel)) {
              ListCountryItemView(country: item.country)
                .tint(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
          }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
      }
      .scrollIndicators(.hidden)
      .padding(.horizontal, 20)
    }
  }
}
