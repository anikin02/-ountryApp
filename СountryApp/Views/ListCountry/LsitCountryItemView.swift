//
//  LsitCountryItemView.swift
//  СountryApp
//
//  Created by Данил Аникин on 06.12.2024.
//

import SwiftUI
import Kingfisher

struct ListCountryItemView : View {
  let country: Country
  
  var body: some View {
    HStack {
      VStack {
        KFImage(URL(string: country.flags.png))
          .placeholder {
            ProgressView()
          }
          .resizable()
          .frame(width: 170, height: 85)
      }
      VStack{
        Text(country.getName())
          .font(.system(size: 17, weight: .black))
          .multilineTextAlignment(.center)
        Text("Region: \(country.region)")
          .font(.system(size: 17, weight: .bold))
          .multilineTextAlignment(.center)
        
      }
      .frame(maxWidth: .infinity, alignment: .center)
    }
  }
}
