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
        ZStack {
            Image(self.event.image)
                .resizable()
                .scaledToFill()
                .frame(height: 100, alignment: .bottom)
                .clipped()
                .cornerRadius(12)
                .opacity(0.45)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                        .opacity(1))


            HStack {
                VStack (alignment: .center, spacing: 10) {
                    Text(self.event.name)
                        .shadow(color: .white, radius: 1)
                        .font(.system(size: 23, weight: .heavy))
                    Text(self.event.date)
                        .font(.system(size: 19, weight: .heavy))

                }

                .foregroundColor(.black)
            }
        }

        .padding(.horizontal)
    }
}


struct ListEventRow_Previews: PreviewProvider {
    static var previews: some View {
        ListEventRow(event:events[6])
    }
}
