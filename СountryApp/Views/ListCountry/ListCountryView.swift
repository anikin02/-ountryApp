//
//  ListCountryView.swift
//  СountryApp
//
//  Created by Данил Аникин on 06.12.2024.
//

import SwiftUI

struct ListCountryView: View {
  
  @ObservedObject var viewModel = ListCountryModelView()
  
  var body: some View {
    NavigationStack {
      ScrollView() {
        VStack(spacing: 25) {
          ForEach(viewModel.searchCountries.count == 0 ? viewModel.allCountries : viewModel.searchCountries, id: \.name.official) { country in
            NavigationLink(destination: DetailsCountryView()) {
              ListCountryItemView(country: country)
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
    .searchable(text: $viewModel.searchText)
    .onChange(of: viewModel.searchText) {
      viewModel.getSearchCountries()
    }
  }
}

#Preview {
  ListCountryView()
}
