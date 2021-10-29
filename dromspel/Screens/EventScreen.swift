//
//  EventScreen.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI

struct EventScreen: View {
    @Environment(\.colorScheme) var colorScheme

    var event: Event
    var body: some View {

        ZStack {
            ScrollView {
            VStack (alignment: .center, spacing: 00) {
                Spacer()
                ZStack {
                    Rectangle()
                        .foregroundColor((colorScheme == .dark ? .black : .white))
                        .opacity(0.5)
                Text(event.name)
                    .font(.largeTitle.bold())
                    .font(.system(size: 30, weight: .heavy))
                    .bold()
                }
                ZStack {
                    Rectangle()
                        .foregroundColor((colorScheme == .dark ? .black : .white))
                        .opacity(0.5)
                    
                Text(event.date)
                        .font(.system(size: 25, weight: .heavy))

                }
                Text(event.description)
                        .padding()
                        .font(.system(size: 20))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                                .opacity(1))
                        .background(Color.black.opacity(0.5))
                
                        .cornerRadius(12)
                        .padding()
                Text(event.localisation)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                            .opacity(1))
                    .background(Color.blue.opacity(0.5))
                    .cornerRadius(12)
                    .font(.system(size: 20, weight: .heavy))
                    .padding()
                
                ZStack {
                    Rectangle()
                        .foregroundColor((colorScheme == .dark ? .black : .white))
                        .opacity(0.5)
                    
                        
                    VStack {
                        Text(event.link)
                        .font(.system(size: 20, weight: .heavy))
                        

                    } }

            }.font(.system(size: 18))
                .shadow(color: .black, radius: 3)
                .navigationBarTitle(event.name)
                .background(
                    Image(event.image)
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 700, height: 900)                        .opacity(0.8)
            )
        }
            //.scaledToFill()
    } //Fin ZStack
}
}

struct EventScreen_Previews: PreviewProvider {
    static var previews: some View {
        EventScreen(event: events[0])
            .preferredColorScheme(.dark)

    }
}

