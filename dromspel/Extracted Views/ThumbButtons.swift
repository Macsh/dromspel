//
//  PoucesButtons.swift
//  dromspiel
//
//  Created by lucas on 26/10/2021.
//

import SwiftUI

struct ThumbButtons: View {
    
    let onTap: () -> Void
    let isUp: Bool
    let isValidated: Bool
    
    init(onTap: @escaping () -> Void = {}, isUp : Bool = false, isValidated: Bool = false) {
        self.onTap = onTap
        self.isUp = isUp
        self.isValidated = isValidated
    }
    
    var body: some View {
        ZStack {
            Image(systemName: isUp ? "hand.thumbsup.fill" :"hand.thumbsdown.fill")
                .foregroundColor(isUp ?
                                 isValidated ? .green : .blue :
                                 isValidated ? .black : .red)
                .font(.system(size: 50))
            Image(systemName: isUp ? "hand.thumbsup" :"hand.thumbsdown")
            .foregroundColor(.white)
            .font(.system(size: 52))
            .onTapGesture(perform: onTap)
        }
    }
}

struct ThumbButtons_Previews: PreviewProvider {
    static var previews: some View {
        ThumbButtons()
            .preferredColorScheme(.dark)
    }
}
