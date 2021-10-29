//
//  ListEventRow.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//
import SwiftUI

struct ListEventRow: View {
    var event: Event

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationLink(destination: EventScreen(event: event)) {
            ZStack {
                Image(self.event.image)
                    .resizable()
                    .scaledToFill()
                    .opacity(0.45)
                    .background(Color.black)
                    .frame(height: 100, alignment: .bottom)
                    .clipped()
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                            .opacity(1))
                HStack {
                    VStack (alignment: .center, spacing: 10) {
                        Text(self.event.name)
                            .shadow(color: .black, radius: 1)
                            .font(.system(size: 23, weight: .heavy))
                        Text(self.event.date)
                            .font(.system(size: 19, weight: .heavy))

                    }
                    .foregroundColor(.white)
                }
            }

            .padding(.horizontal)
//            .frame(height: 70)
        }
    }
}


struct ListEventRow_Previews: PreviewProvider {
    static var previews: some View {
        ListEventRow(event:events[0])
            .preferredColorScheme(.dark)
    }
}
