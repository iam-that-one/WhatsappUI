//
//  ContentView.swift
//  WhatsappUI
//
//  Created by Abdullah Alnutayfi on 01/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State var messages : [Message] = [
        Message(name: "عبدالله", image: "1", body: "اليوم جانا مدرس جديد في الكلاس 😍", date: Date() + TimeInterval(Int.random(in: 0...7)) ,isPinned: true),
        Message(name: "Mohammed", image: "", body: "ياخي سو update", date: Date() + TimeInterval(Int.random(in: 0...7)),isPinned: false ),
        Message(name: "Ali", image: "2", body: "بكرة اختبار", date: Date() + TimeInterval(Int.random(in: 0...7)), isPinned: false),Message(name: "Nasser", image: "3", body: "طيب تعال انتظرك", date: Date() + TimeInterval(Int.random(in: 0...7)),isPinned: false ),Message(name: "Ahmed", image: "4", body: "عبدالله ارسل لي الرابط", date: Date() + TimeInterval(Int.random(in: 0...7)), isPinned: false ),Message(name: "Fahad", image: "", body: "الستوري بورد مملة وغبية، خلاص من اليوم ورايح فقط swiftUI", date: Date() + TimeInterval(Int.random(in: 0...7)) ,isPinned: false)
        ,Message(name: "Abdullah", image: "5", body: "😂😂😂😂😂😂", date: Date() + TimeInterval(Int.random(in: 0...7)),isPinned: false )
    ]
    @State var search = ""
    var body: some View {
        NavigationView{
            VStack{
                if #available(iOS 15.0, *) {
                    List{
                        HStack{
                            Button(action:{}){
                                Text("Brodcast Lists")
                            }
                            Spacer()
                            Button(action:{}){
                                Text("New Group")
                            }
                        }.padding(.horizontal,5)
                            .foregroundColor(.blue)
                        ForEach(search == "" ? messages : messages.filter{$0.name.contains(search)}){ message in
                            HStack{
                                if message.image == "" {
                                Image(systemName: "person.circle")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .clipShape(Circle())
                                        .foregroundColor(.gray)
                                }else{
                                    Image(message.image)
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .clipShape(Circle())
                                }
                                VStack(alignment: .leading,spacing: 10){
                                    HStack{
                                    Text(message.name)
                                            .fontWeight(.bold)
                                        Spacer()
                                        Text(dateFormatter.string(from: message.date))
                                    }
                                    HStack{
                                    Text(message.body)
                                        Spacer()
                                        if message.isPinned{
                                        Image(systemName: "pin.fill")
                                            .rotationEffect(.degrees(45))
                                            .foregroundColor(Color(.gray))
                                        }
                                    }
                                }
                            }
                        }
                    }.searchable(text: $search)
                        .listStyle(PlainListStyle())
                } else {
                    // Fallback on earlier versions
                }
            }.navigationTitle(Text("Chats"))
                .navigationBarItems(leading: Button("Edit"){}, trailing: Button(action:{}){
                    Image(systemName: "square.and.pencil")
                        
                })
        }
    }
    var dateFormatter : DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct  Message: Identifiable{
    var id = UUID()
    var name : String
    var image : String
    var body : String
    var date : Date
    var isPinned : Bool
    
}
