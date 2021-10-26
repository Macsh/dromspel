//
//  VideoPlayerGame.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import AVKit
import SwiftUI

struct VideoPlayerGame: View {
    var game : Game
    var body: some View {
        VideoPlayer(player: AVPlayer(url:  URL(string: self.game.video)!))
            .frame(height: 400)
    }
}

struct VideoPlayerGame_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerGame(game: games[0])
    }
}
