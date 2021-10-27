//
//  VideoPlayerGame.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import AVKit
import SwiftUI
import UIKit
import WebKit


struct WebView: UIViewRepresentable {
    var game : Game
    func makeUIView(context: Context) -> WKWebView {
        WKWebView(frame: .zero)
    }
    
    func updateUIView(_ view: WKWebView, context: UIViewRepresentableContext<WebView>) {
        
        let request = URLRequest(url: URL(string: "https://www.youtube.com/embed/\(game.video)?playsinline=1")!)
        
        view.load(request)
        
        
    }
}

//class ViewController: UIViewController {
//    @IBOutlet weak var videoPlayer: UIView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let webConf = WKWebViewConfiguration()
//        webConf.allowsInlineMediaPlayback = true
//        DispatchQueue.main.async {
//            let webPlayer = WKWebView(frame: self.videoPlayer.bounds, configuration: webConf)
//            self.videoPlayer.addSubview(webPlayer)
//
//            guard let videoURL = URL(string: "https://youtu.be/E3Huy2cdih0?playsinline=1") else { return } //works with vimeo as well
//            let request = URLRequest(url: videoURL)
//            webPlayer.load(request)
//        }
//    }
//}

struct VideoPlayerGame: View {
    var game : Game
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack {
            WebView(game: game)
                .frame(height:UIScreen.main.bounds.height*0.25)
                .cornerRadius(20)
                .padding()
                .overlay(
                RoundedRectangle(cornerRadius: 20)
                .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                .padding()
                                        )
        }
    }
}


struct VideoPlayerGame_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerGame(game: games[0])
            .preferredColorScheme(.dark)
    }
}
