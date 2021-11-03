//
//  FirstBootStyle.swift
//  dromspel
//
//  Created by alexandre on 03/11/2021.
//

import SwiftUI

struct FirstBootStyle: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var isValidated: Bool

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
       ]
    var body: some View {
        
        ScrollView  {
            Spacer(minLength: 20)
            LazyVGrid(columns: columns, spacing: 50) {
                ForEach(Action.allCases, id: \.self){ act in
                    GameStyleButton(gameStyle: GameType.Action(value:act), activeUser: user)
                }
                ForEach(ActionAventure.allCases, id: \.self){ act in
                    GameStyleButton(gameStyle: GameType.ActionAventure(value:act), activeUser: user)
                }
                ForEach(Aventure.allCases, id: \.self){ act in
                    GameStyleButton(gameStyle: GameType.Aventure(value:act), activeUser: user)
                }
                ForEach(RPG.allCases, id: \.self){ act in
                    GameStyleButton(gameStyle: GameType.RPG(value:act), activeUser: user)
                }
                ForEach(Simulation.allCases, id: \.self){ act in
                    GameStyleButton(gameStyle: GameType.Simulation(value:act), activeUser: user)
                }
                ForEach(Strategy.allCases, id: \.self){ act in
                    GameStyleButton(gameStyle: GameType.Strategy(value:act), activeUser: user)
                }
                ForEach(Reflexion.allCases, id: \.self){ act in
                    GameStyleButton(gameStyle: GameType.Reflexion(value:act), activeUser: user)
                }
                ForEach(Sport.allCases, id: \.self){ act in
                    GameStyleButton(gameStyle: GameType.Sport(value:act), activeUser: user)
                }
                ForEach(OpenWorld.allCases, id: \.self){ act in
                    GameStyleButton(gameStyle: GameType.OpenWorld(value:act), activeUser: user)
                }
             }
            .padding()
            Spacer()
                .frame(height: 50)
            NavigationLink (destination:FirstBootGameList(activeUser: user, isValidated: $isValidated), label:{
            NextStepButton(textButton: "Étape Suivante     \(Image(systemName: "greaterthan"))")
            })
            .navigationBarTitle("Style").navigationBarTitleDisplayMode(.inline).navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct FirstBootStyle_Previews: PreviewProvider {
    static var previews: some View {
        FirstBootStyle(isValidated: .constant(false))
    }
}
