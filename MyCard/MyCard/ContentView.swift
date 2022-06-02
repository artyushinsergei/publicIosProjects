//
//  ContentView.swift
//  MyCard
//
//  Created by SERGEI on 01.06.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.10, green: 0.74, blue: 0.61)
            VStack {
                Image("ava").resizable().aspectRatio(contentMode: .fill).frame(width: 150, height: 150).clipShape(Circle()).overlay(Circle().stroke(lineWidth: 5))
                Text("Sergey Artyushin")
                    .font(.title)
                    .fontWeight(.heavy)
                    .ignoresSafeArea()
                    .padding()
                Text("IOS developer")
                    .font(.headline)
                    .ignoresSafeArea()
                    .padding()
                Divider()
                Card(image: "phone.fill", messege: "8(927)095-43-04")
                Card(image: "envelope.fill", messege: "artserg19@gmal.com")
            }.foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Card: View {
    let image: String
    let messege: String

    var body: some View {
        RoundedRectangle(cornerRadius: 25).padding(.horizontal).frame( height: 50).overlay(HStack {
            Image(systemName: image)
            Text(messege).fontWeight(.semibold)
        }.foregroundColor(Color(red: 0.10, green: 0.74, blue: 0.61)))
    }
}
