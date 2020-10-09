//
//  ContentView.swift
//  Colors
//
//  Created by Peter Friese on 08/10/2020.
//

import SwiftUI

struct ContentView: View {
  var colors = ["Red", "Green", "Yellow", "Blue", "Pink", "Purple"]
  
  @State var selectedColor: String? = nil
  
  let columns = [
    GridItem(.flexible())
  ]
  
  var body: some View {
    NavigationView {
      ScrollView {
        LazyVGrid(columns: columns) {
          ForEach(colors, id: \.self) { color in
            NavigationLink(destination: ColorDetailsView(color: color), tag: color, selection: $selectedColor) {
              Image(color)
            }
          }
        }
        .navigationBarItems(trailing: Button("Clear") {
          NSUserActivity.deleteAllSavedUserActivities {}
        })
        .onOpenURL { url in
          if let color = url.host {
            selectedColor = color
          }
        }
        .onContinueUserActivity("showColor") { userActivity in
          print("Continue user activity!")
          if let color = userActivity.userInfo?["colorName"] as? String {
            selectedColor = color
          }
        }
      }
      .ignoresSafeArea(edges: .bottom)
      .navigationTitle("Colors")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
