//
//  _ountryAppApp.swift
//  СountryApp
//
//  Created by Данил Аникин on 06.12.2024.
//

import SwiftUI
import SwiftData

@main
struct _ountryAppApp: App {
  let container: ModelContainer
  var body: some Scene {
    WindowGroup {
      ContentView(modelContext: container.mainContext)
        .modelContainer(container)
    }
  }
  
  init() {
    do {
      container = try ModelContainer(for: FavoriteItem.self)
    } catch {
      fatalError("Failed to create ModelContainer for Movie.")
    }
  }
}
