//
//  AnswerMailView.swift
//  MailMock
//
//  Created by student on 21.03.22.
//

import SwiftUI

struct AnswerMailView: View {
    @State var mailAdress : String
    @State var subject : String
    @State var content : String
    @State private var showingAlert = false
    @State private var showNavigate = false
    
    var body: some View {
        ScrollView
        {
    
            VStack(alignment: .leading) {
                ZStack
                {
                    TextEditor(text: $mailAdress)
                        .accessibilityLabel("Empfänger")
                        .accessibilityValue(mailAdress)
                        .accessibilityHint("TextField")
                    Text(mailAdress).opacity(0).padding(.all, 8)
                }
                
                    
                Divider()
                ZStack
                {
                    TextEditor(text: $subject)
                        .accessibilityLabel("Betreff")
                        .accessibilityValue(subject)
                        .accessibilityHint("TextField")
                    Text(mailAdress).opacity(0).padding(.all, 8)
                }
                
                Divider()
                ZStack
                {
                    TextEditor(text: $content)
                        .accessibilityValue("Inhalt")
                        .accessibilityHint("TextField")
                    Text(mailAdress).opacity(0).padding(.all, 8)
                }
                
                NavigationLink(destination: MailListView(), isActive: self.$showNavigate){
                    EmptyView()
                }
                Button(action: {
                    self.showNavigate = true
                    UIAccessibility.post(notification: .announcement, argument: "E-Mail erfolgreich gesendet")
                    ProgressHUD.showSucceed()
                        
                }) {
                    Text("Senden")
                        .frame(minWidth: 44, idealWidth: 80, maxWidth: .infinity, minHeight: 44, idealHeight:50, maxHeight: 100, alignment: .center)
                }
                Spacer()
            }
            .padding()
            
        }
            
   
    }
    
    
    
    init(mail: String, subject: String, content: String) {
        _mailAdress = State(initialValue: mail)
        _subject = State(initialValue: subject)
        _content = State(initialValue: content)
    }
}

struct AnswerMailView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerMailView(mail: "dummy@mail.com", subject: "Lustiges Video", content: "Inhalt")
    }
}
