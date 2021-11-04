//
//  MiniGame.swift
//  dromspiel
//
//  Created by gibril on 27/10/2021.
//

import SwiftUI

//struct NavigationConfigurator: UIViewControllerRepresentable {
//    var configure: (UINavigationController) -> Void = { _ in }
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
//        UIViewController()
//    }
//    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
//        if let nc = uiViewController.navigationController {
//            self.configure(nc)
//        }
//    }
//
//}

struct FirstBootScreen: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var isValidated: Bool

    var body: some View {
        NavigationView {
            ZStack(alignment: .top){
//                Color(red: 212 / 255, green: 230 / 255, blue: 241 / 255)
//                    .ignoresSafeArea(.all)
                if (colorScheme == .dark) {
                Image("Firstscreen-bg-darkmode")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.7)
                    .background(Color.black)
                    .clipped()
                    .ignoresSafeArea(.all) }
                else {
                    Image("Firstscreen-bg-lightmode")
                        .resizable()
                        .scaledToFill()
                        .opacity(0.7)
                        .background(Color.black)
                        .clipped()
                        .ignoresSafeArea(.all) }
                
                
                VStack{
                    Spacer()
                        .frame(height: 50)
                    NavigationLink (destination:FirstBootStyle(isValidated : $isValidated), label:{
                            ChoiceButton()
                                
                    })
                    Spacer()
                        .frame(height: 50)
                    
                    NavigationLink (destination:UserForm(isValidated: $isValidated, haveButton: true, activeUser: user), label:{
                            ChoiceButtonQuestion()
                                
                    })
                    
                        
                }
                .padding()

                
                
            }
            
            .navigationBarTitle("Faites votre choix").navigationBarTitleDisplayMode(.inline).navigationViewStyle(StackNavigationViewStyle())
                
//            .background(NavigationConfigurator { nc in
//                            nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
//                        })
//            .navigationBarHidden(true)
            
        }
        
    }
}


struct FirstBootScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstBootScreen(isValidated: .constant(false))
//            .preferredColorScheme(.dark)
    }
}
