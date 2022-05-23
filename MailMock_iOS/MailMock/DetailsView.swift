//
//  DetailsView.swift
//  MailMock
//
//  Created by student on 21.03.22.
//

import SwiftUI

struct DetailsView: View {
    var model : MailItem
    
    let fontSize = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .headline).pointSize
    let smallFontSize = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .callout).pointSize
    
    var body: some View {
        ScrollView{
            VStack (alignment: .leading) {
            Text("gesendet von")
                .font(.system(size:smallFontSize))
                .accessibilityHidden(true)
                
            Text(model.mailAdress)
                .font(.system(size: fontSize))
                .accessibilityLabel("Empfänger")
                .accessibilityValue(model.mailAdress)
            Divider()
            Text("Betreff")
                .font(.system(size:smallFontSize))
                .accessibilityHidden(true)
            Text(model.subject)
                .font(.system(size: fontSize))
                .accessibilityLabel("Betreff")
                .accessibilityValue(model.subject)
            Divider()
                ScrollView {
                    Text(model.content)
                        .font(.system(size: fontSize))
                }
                .accessibilityLabel("Inhalt")
                .accessibilityValue(model.content)
            }
            .navigationBarTitle(Text("Mail"))
            .navigationBarItems(trailing:
                                    NavigationLink(destination: AnswerMailView(mail: model.mailAdress, subject: model.subject, content: "")) {
                                        Image(systemName: "at.circle")
                                            .frame(width: 44, height: 44, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    }
                                
                                    .accessibilityLabel("Mail beantworten"))
                                
            .padding()
        }
        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(model: MailItem(mailAdress: "dummy@mail.com", subject: "Lustiges Video", content: "Lorem Ipsum"))
    }
}
