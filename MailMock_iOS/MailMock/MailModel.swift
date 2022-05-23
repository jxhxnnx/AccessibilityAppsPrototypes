//
//  MailModel.swift
//  MailMock
//
//  Created by student on 21.03.22.
//

import Foundation

class MailItem : Identifiable {
    var mailAdress : String
    var subject : String
    var content : String
    
    init(mailAdress : String, subject : String, content : String) {
        self.mailAdress = mailAdress
        self.subject = subject
        self.content = content
    }
}

class MailModel : ObservableObject {
    @Published var elements : [MailItem] = []
    
    init(){
        self.elements = self.load(count : 30)
    }
    
    
    
    func load(count : Int) -> [MailItem]
    {
        let names = ["John@dummyMail.com", "Sarah@dummyMail.com", "Harry@dummyMail.com", "Alexandra@dummyMail.com", "Thomas@dummyMail.com", "Sandra@dummyMail.com"]
        let subjects = ["Arbeit", "Urlaub", "Lustiges Katzenvideo", "Nigerianischer Prinz"]
        let content = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
        var items : [MailItem] = []
        for _ in 1...count {
            items.append(MailItem(mailAdress: names.randomElement()!, subject: subjects.randomElement()!, content: content))
        }
        return items
    }
}

