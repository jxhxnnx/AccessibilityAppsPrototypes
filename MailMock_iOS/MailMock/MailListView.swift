//
//  ContentView.swift
//  MailMock
//
//  Created by student on 21.03.22.
//

import SwiftUI

struct MailListView: View {
    @StateObject var model = MailModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(model.elements) { entry in
                    NavigationLink(destination: DetailsView(model: entry)) {
                        RowView(data: entry)
                    }
                }
            }
            .navigationBarTitle(Text("Posteingang"))
            .navigationBarItems(trailing:
                                    Button(action: {
                                        addItemDuringRuntime()
                                    }) {
                                        Image(systemName: "at.circle")
                                    }
                .accessibilityLabel(Text("Mail beantworten"))
            )
        }
    }
    
    func addItemDuringRuntime() {
        sleep(5)
        model.elements.insert(MailItem(mailAdress: "test", subject: "test", content: "test"), at: 0)
        UIAccessibility.post(notification: .announcement, argument: "neue Nachricht empfangen")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MailListView()
    }
}
