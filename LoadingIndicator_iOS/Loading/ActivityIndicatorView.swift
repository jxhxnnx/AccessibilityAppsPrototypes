//
//  ActivityIndicatorView.swift
//  Loading
//
//  Created by student on 13.05.22.
//

import Foundation
import SwiftUI

struct ActivityIndicator : UIViewRepresentable {
    
    typealias UIViewType = UIActivityIndicatorView
    let style : UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> ActivityIndicator.UIViewType {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: ActivityIndicator.UIViewType, context: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.startAnimating()
    }
    
}


struct ActivityIndicatorView<Content> : View where Content : View {
    
    @Binding var isDisplayed : Bool
    var content: () -> Content
    
    var body : some View {
        GeometryReader {geometry in
            ZStack(alignment : .center, content : {
                if(!self.isDisplayed) {
                    self.content()
                } else {
                    self.content()
                        .disabled(true)
                        .blur(radius : 3)
                    VStack {
                        Text("Inhalt wird geladen")
                        ActivityIndicator(style: .large)
                    }
                    .frame(width: geometry.size.width/2.0, height: 200.0, alignment: .center)
                    .background(Color.secondary.colorInvert())
                    .foregroundColor(Color.primary)
                    .cornerRadius(20)
                }
            })
        }
    }
    
    
}
