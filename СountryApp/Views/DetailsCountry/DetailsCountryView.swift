//
//  DetailsCountryView.swift
//  СountryApp
//
//  Created by Данил Аникин on 06.12.2024.
//

import SwiftUI
import MapKit
import Kingfisher

struct DetailsCountryView: View {
  @State private var mapPosition: MapCameraPosition = .automatic
  let country: Country
  
  var body: some View {
    ZStack {
      ScrollView {
        VStack() {
          KFImage(URL(string: country.flags.png))
            .placeholder {
              ProgressView()
            }
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
          
          Text(country.name.official)
            .font(.system(size: 17, weight: .black))
            .multilineTextAlignment(.center)
        }
        VStack(alignment: .leading){
          Text("Capital: \(country.capital?.first ?? "-")")
          Text("Population: \(country.population)")
          Text("Area: \(country.area)")
          Text("Currencies: \(country.getStringCurrency())")
          Text("Languages: \(country.getStringLanguages())")
          Text("Timezones: \(country.getStringTimezones())")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        VStack {
          Map(position: $mapPosition)
            .frame(height: 300)
            .onAppear() {
              DispatchQueue.main.async {
                let coordinate = CLLocationCoordinate2D(latitude: 54.0,
                                                        longitude: -2.0)
                let coordinateSpan = MKCoordinateSpan(latitudeDelta: 8,
                                                      longitudeDelta: 8)
                let coordinateRegion = MKCoordinateRegion(center: coordinate,
                                                          span: coordinateSpan)
                mapPosition = .region(coordinateRegion)
              }
            }
        }
      }
      VStack() {
        HStack() {
          Button {
            
          } label: {
            Image(systemName: "hand.thumbsup.fill")
              .resizable()
              .frame(width: 50, height: 50)
          }
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
      }
      .frame(maxWidth: .infinity, alignment: .trailing)
      .padding(20)
    }
    .padding(.horizontal, 20)
  }
}

