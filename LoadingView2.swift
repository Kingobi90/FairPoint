//
//  LoadingView2.swift
//  FairPointt
//
//  Created by Obinna Chukwu on 2/26/25.
//

import Foundation
import SwiftUI

struct LoadingScreen2View: View {
    var body: some View {
        ZStack {
            // White background
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                Spacer()
                
                // The silhouette image
                Image("horizonwebworx")
                // Replace with the actual name of your image asset
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200) // Adjust as needed
                
                Spacer()
                
                // "FairPoint" in one color, "by HorizonWebWorX" in another
                HStack(spacing: 0) {
                    Text("FairPoint")
                        .foregroundColor(.orange)
                        .fontWeight(.semibold)
                    Text(" by HorizonWebWorX")
                        .foregroundColor(.black)
                }
                .font(.title3)
                
                Spacer().frame(height: 50) // Add extra space at the bottom if desired
            }
        }
    }
}

struct LoadingScreen2View_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen2View()
    }
}
