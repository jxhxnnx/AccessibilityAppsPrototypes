//
//  DetailCardView.swift
//  CardMock
//
//  Created by student on 30.04.22.
//

import SwiftUI

struct DetailCardView: View {
    var body: some View {
        ScrollView
        {
            VStack(){
                HStack(alignment: .top){
                    
                    Image(systemName: "checkmark")
                        .font(Font.system(.largeTitle))
                        .foregroundColor(.green)
                        .accessibility(hidden: true)
                    Spacer()
                    Text("Hinzufügen erfolgreich")
                        .font(.title2)
                        .foregroundColor(.green)
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
                Spacer()
                Text("Kartendetails")
                    .frame(alignment: .topLeading)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
                Image("barcode")
                    .resizable()
                    .scaledToFill()
                    .accessibility(label: Text("Barcode der Karte"))
                Spacer()
                
            }
            .padding()
        }
        
        
    }
}

struct DetailCardView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCardView()
    }
}
