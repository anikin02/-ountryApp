//
//  DetailsCountryView.swift
//  СountryApp
//
//  Created by Данил Аникин on 06.12.2024.
//

import SwiftUI
import MapKit

struct DetailsCountryView: View {
  @State private var mapPosition: MapCameraPosition = .automatic
  var body: some View {
    ScrollView {
      VStack() {
        // MARK: Image
        Image("testImage")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(maxWidth: .infinity)
        
        Text("United Kingdom of Great Britain and Northern Ireland")
          .font(.system(size: 17, weight: .black))
          .multilineTextAlignment(.center)
      }
      VStack(alignment: .leading){
        Text("Capital: London")
        Text("Population: ")
        Text("Area: ")
        Text("Currencies: ")
        Text("Languages: ")
        Text("Timezones: ")
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      VStack {
        Map(position: $mapPosition)
          .frame(height: 300)
          .onAppear() {
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
    .padding(.horizontal, 20)
  }
}

#Preview {
  DetailsCountryView()
}
