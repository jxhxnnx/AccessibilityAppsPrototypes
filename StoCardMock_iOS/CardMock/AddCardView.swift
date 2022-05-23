//
//  AddCardView.swift
//  CardMock
//
//  Created by student on 30.04.22.
//

import SwiftUI

struct AddCardView: View {
    var body: some View {
        ScrollView
        {
            VStack{
                Text("Halte den Code der Karte vor die Kamera")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .frame(alignment: .top)
                    .fixedSize(horizontal: false, vertical: true)
                
                Rectangle()
                    .fill(Color.gray)
                    .aspectRatio(contentMode: .fit)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .padding()
                    .accessibility(hidden: true)
                Spacer()
                NavigationLink(
                    destination: DetailCardView(),
                    label: {
                        Text("Navigate")
                    })
                
            }
        }
            
        
        
    }
}

struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddCardView()
    }
}
