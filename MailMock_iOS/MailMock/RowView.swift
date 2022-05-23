//
//  RowView.swift
//  MailMock
//
//  Created by student on 21.03.22.
//

import SwiftUI

struct RowView: View {
    var data : MailItem

    let fontSize = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .headline).pointSize
    let timeFontSize = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .caption1).pointSize
    
    var body: some View {
        HStack(){
            VStack(alignment: .leading, spacing: 1){
                Text(data.mailAdress)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .font(.system(size: fontSize))
                    
                    .accessibilityValue(data.mailAdress)
                
                Text(data.subject)
                    .lineLimit(2)
                    .font(.system(size: fontSize))
                  
                    .accessibilityValue(data.subject)
            }
            
            Text("12:34")
                .font(.system(size: timeFontSize))
                
                .accessibilityValue("12:34")
        }
        
    }
    
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(data: MailItem(mailAdress: "dummy@mail.com", subject: "Lustiges Video", content: "Lorem Ipsum"))
    }
}
