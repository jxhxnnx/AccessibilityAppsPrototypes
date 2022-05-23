//
//  ContentView.swift
//  Loading
//
//  Created by student on 13.05.22.
//

import SwiftUI

struct ContentView: View {
    
    @State var loadingToggle = false
    @State var content = ""
    
    var body: some View {
       
        VStack{
            ActivityIndicatorView(isDisplayed: $loadingToggle) {
                Text("")
                
            }
            
            Text(self.content)

            Button(action: {
                UIAccessibility.post(notification: .announcement, argument: "Inhalt wird geladen")
                loadingToggle.toggle()
            
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    self.content = loadContent()
                    loadingToggle.toggle()
                    UIAccessibility.post(notification: .announcement, argument: "Inhalt fertig geladen")
                }
                
            }, label: {
                Text("Inhalt laden")
            })
            .frame(width: 200, height: 50)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(15)
        }
    }
    func loadContent() -> String {
        let urlString = "https://www.technikum-wien.at"
        guard let myURL = URL(string: urlString) else {
            return ""
        }
        do {
            let htmlString = try String(contentsOf: myURL, encoding: .ascii)
            return htmlString
        } catch _ {
            return "error"
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
