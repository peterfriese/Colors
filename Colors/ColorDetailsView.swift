//
//  ColorDetailsView.swift
//  Colors
//
//  Created by Peter Friese on 08/10/2020.
//

import SwiftUI
import CoreSpotlight
import MobileCoreServices

struct ColorDetailsView: View {
  var color: String
  
  var body: some View {
    Image(color)
      .resizable()
      .aspectRatio(contentMode: .fill)
      .ignoresSafeArea(edges: .bottom)
      .navigationTitle(color)
      .userActivity("showColor" ) { activity in
        activity.title = color
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true
        activity.userInfo = ["colorName": color]
        
        let attributes = CSSearchableItemAttributeSet(itemContentType: kUTTypeItem as String)
        attributes.contentDescription = "Look at some delightful colors"
        attributes.thumbnailData = UIImage(named: color)?.pngData()
        activity.contentAttributeSet = attributes
      }
  }
}

struct ColorDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ColorDetailsView(color: "Yellow")
    }
  }
}
