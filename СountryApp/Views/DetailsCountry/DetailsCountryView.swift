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
  @EnvironmentObject var favoriteModelView: FavoriteModelView
  
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
          
          Text(country.getName())
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
                let coordinate = CLLocationCoordinate2D(latitude: country.latlng.first ?? 0,
                                                        longitude: country.latlng.last ?? 0)
                let coordinateSpan = MKCoordinateSpan(latitudeDelta: 10,
                                                      longitudeDelta: 10)
                let coordinateRegion = MKCoordinateRegion(center: coordinate,
                                                          span: coordinateSpan)
                mapPosition = .region(coordinateRegion)
              }
            }
        }
        HStack {
          let shareText = "\(country.getName()). \(country.capital?.first ?? "-"). \(country.getStringCurrency())"
          ShareLink(item: shareText)
        }
      }
      VStack() {
        HStack() {
          Button {
            if favoriteModelView.favoriteCountries.contains(where: {$0.country.name.official == country.name.official}) {
              favoriteModelView.deleteFavoriteItem(country: country)
            } else {
              favoriteModelView.addFavoriteItem(country: country)
            }
          } label: {
            Image(systemName: "hand.thumbsup.fill")
              .resizable()
              .frame(width: 50, height: 50)
              .foregroundStyle(favoriteModelView.favoriteCountries.contains(where: {$0.country.name.official == country.name.official}) ? .accent : .gray)
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

