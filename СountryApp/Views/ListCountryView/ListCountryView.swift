//
//  ListCountryView.swift
//  СountryApp
//
//  Created by Данил Аникин on 06.12.2024.
//

import SwiftUI

struct ListCountryView: View {
  var body: some View {
    ScrollView() {
      VStack(spacing: 25) {
        ListCountryItemView()
        ListCountryItemView()
        ListCountryItemView()
        ListCountryItemView()
        ListCountryItemView()
        ListCountryItemView()
      }
    }
    .padding(20)
  }
}

#Preview {
  ListCountryView()
}
