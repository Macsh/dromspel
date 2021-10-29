//
//  ListSeparator.swift
//  dromspel
//
//  Created by lucas on 28/10/2021.
//

import SwiftUI

struct GameCalendarListSeparator: View {
    //On vérifie quel mode d'affichage on à.
    @Environment(\.colorScheme) var colorScheme
    
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        HStack {
            Spacer()
            Text(text)
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .padding()
            Spacer()
        }
        .background(Color.init(white: colorScheme == .dark ? 0.1 : 0.9))
    }
}

struct GameCalendarListSeparator_Previews: PreviewProvider {
    static var previews: some View {
        GameCalendarListSeparator("YOLO")
            .preferredColorScheme(.dark)
    }
}
