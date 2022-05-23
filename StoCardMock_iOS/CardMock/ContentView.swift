//
//  ContentView.swift
//  CardMock
//
//  Created by student on 30.04.22.
//

import SwiftUI

struct ContentView: View {
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: layout, spacing: 20) {
                    ForEach(1...5, id: \.self) { item in
                        NavigationLink(destination: DetailCardView())
                        {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(15.0)
                                .accessibility(label: Text("Apple"))
                        }
                        
                        
                    }
            }
            .padding(.horizontal)
            }
        .toolbar {
            NavigationLink(destination: AddCardView()) {
                if #available(iOS 14.5, *) {
                    Label("Karte hinzufügen", systemImage: "plus.app.fill")
                        .labelStyle(TitleAndIconLabelStyle())
                        .font(.system(size: 25))
                        .accessibility(label: Text("Karte hinzufügen"))
                } else {
                    Label("Karte hinzufügen", systemImage: "plus.app.fill")
                        .labelStyle(TitleOnlyLabelStyle())
                        .accessibility(label: Text("Karte hinzufügen"))
                }
            }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
