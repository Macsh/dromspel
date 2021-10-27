//
//  EventScreen.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI

struct EventScreen: View {
    var event: Event
    var body: some View {

        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack (alignment: .center, spacing: 10) {
                Text(event.name)
                    .font(.largeTitle.bold())
                    .bold()
                Spacer()
                Image(event.image)
                    .resizable()
                    .frame(width: 280, height: 170)
                Spacer()
                HStack {
                Text("Quand ?")
                        .bold()
                Text(event.date)
                    Spacer()
            }
                HStack {
                Text("Où ?")
                        .bold()
                Text(event.localisation)

            }
                HStack {
                Text("Quoi ?")
                        .bold()
                Text(event.description)
            }
                HStack {
                Text("Lien :")
                    .bold()
                    .padding()
                Text(event.link)
            }

            }.font(.system(size: 18))
                .navigationBarTitle(event.name)
                .foregroundColor(Color.white)
        }
    }
}

struct EventScreen_Previews: PreviewProvider {
    static var previews: some View {
        EventScreen(event: events[2])
    }
}
