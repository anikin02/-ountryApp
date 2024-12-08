//
//  LsitCountryItemView.swift
//  СountryApp
//
//  Created by Данил Аникин on 06.12.2024.
//

import SwiftUI

struct ListCountryItemView : View {
  var body: some View {
    HStack {
      VStack {
        Image("testImage")
          .resizable()
          .frame(width: 170, height: 85)
      }
      VStack{
        Text("United Kingdom of Great Britain and Northern Ireland")
          .font(.system(size: 17, weight: .black))
          .multilineTextAlignment(.center)
        Text("Region: Europe")
          .font(.system(size: 17, weight: .bold))
          .multilineTextAlignment(.center)
        
      }
    }
  }
}
