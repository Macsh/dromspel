//
//  FilterElement.swift
//  dromspel
//
//  Created by alexandre on 04/11/2021.
//

import SwiftUI

struct FilterElement: View {
    @Binding var showing: Bool
    
    @Binding var pegiEmpty: [String]
    @Binding var typeEmpty : [GameType]
    @Binding var platformEmpty : [String]
    @Environment(\.colorScheme) var colorScheme
    @Binding var ButtonSelection : Bool
    @Binding var ButtonSelection1 : Bool
    @Binding var ButtonSelection2 : Bool
    @Binding var ButtonSelection3 : Bool
    @Binding var ButtonSelection4 : Bool
    @Binding var ButtonSelection5 : Bool
    @Binding var ButtonSelection6 : Bool
    @Binding var ButtonSelection7 : Bool
    @Binding var ButtonSelection8 : Bool
    @Binding var ButtonsType: [Bool]

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
       ]
    var body: some View {
        VStack{
                HStack{
                    Button(action: {
                        showing = false
                    }, label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 25)
                            .padding(.horizontal)
                            .padding(.top)
                            .opacity(ButtonSelection ? 0.5: 1)

                    })
                    Spacer()
                }
        ScrollView {
            Text("Pegi")
                .font(.system(size: 17, weight: .bold))
                .padding(10)
                .frame(width: 400)
                .background(Color.black)
                .foregroundColor(.white)
            HStack{
                Button(action: {
                    if ButtonSelection {
                        if let index = pegiEmpty.firstIndex(of: "PEGI 3") {
                            pegiEmpty.remove(at: index)
                        }
                    }
                    else {
                        pegiEmpty.append("PEGI 3")
                    }
                    ButtonSelection.toggle()
                }, label: {
                    Image("PEGI 3")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(.horizontal)
                        .opacity(ButtonSelection ? 0.5: 1)
                        .animation(.easeOut(duration: 0.25))
                    
                })
                Button(action: {
                    if ButtonSelection1 {
                        if let index = pegiEmpty.firstIndex(of: "PEGI 7") {
                            pegiEmpty.remove(at: index)
                        }
                    }
                    else {
                        pegiEmpty.append("PEGI 7")
                    }
                    ButtonSelection1.toggle()
                }, label: {
                    Image("PEGI 7")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(.horizontal)
                        .opacity(ButtonSelection1 ? 0.5: 1)
                        .animation(.easeOut(duration: 0.25))
                })
                Button(action: {
                    if ButtonSelection2 {
                        if let index = pegiEmpty.firstIndex(of: "PEGI 12") {
                            pegiEmpty.remove(at: index)
                        }
                    }
                    else {
                        pegiEmpty.append("PEGI 12")
                    }
                    ButtonSelection2.toggle()
                }, label: {
                    Image("PEGI 12")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(.horizontal)
                        .opacity(ButtonSelection2 ? 0.5: 1)
                        .animation(.easeOut(duration: 0.25))
                })
                Button(action: {
                    if ButtonSelection3 {
                        if let index = pegiEmpty.firstIndex(of: "PEGI 16") {
                            pegiEmpty.remove(at: index)
                        }
                    }
                    else {
                        pegiEmpty.append("PEGI 16")
                    }
                    ButtonSelection3.toggle()
                }, label: {
                    Image("PEGI 16")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(.horizontal)
                        .opacity(ButtonSelection3 ? 0.5: 1)
                        .animation(.easeOut(duration: 0.25))
                })
                Button(action: {
                    if ButtonSelection4 {
                        if let index = pegiEmpty.firstIndex(of: "PEGI 18") {
                            pegiEmpty.remove(at: index)
                        }
                    }
                    else {
                        pegiEmpty.append("PEGI 18")
                    }
                    ButtonSelection4.toggle()
                }, label: {
                    Image("PEGI 18")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(.horizontal)
                        .opacity(ButtonSelection4 ? 0.5: 1)
                        .animation(.easeOut(duration: 0.25))
                })
            }
            .padding(.top)
            .padding(.bottom)
            Text("Plateforme")
                .font(.system(size: 17, weight: .bold))
                .padding(10)
                .frame(width: 400)
                .background(Color.black)
                .foregroundColor(.white)
            HStack{
                Button(action: {
                    if ButtonSelection5 {
                        if let index = platformEmpty.firstIndex(of: "logo-switch") {
                            platformEmpty.remove(at: index)
                        }
                    }
                    else {
                        platformEmpty.append("logo-switch")
                    }
                    ButtonSelection5.toggle()
                }, label: {
                    if  colorScheme == .dark {
                        Image("logo-switch")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 42)
                            .colorInvert()
                            .padding(.horizontal)
                            .opacity(ButtonSelection5 ? 0.5: 1)
                            .animation(.easeOut(duration: 0.25))
                    } else {
                        Image("logo-switch")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 42)
                            .padding(.horizontal)
                            .opacity(ButtonSelection5 ? 0.5: 1)
                            .animation(.easeOut(duration: 0.25))
                    }
                })
                Button(action: {
                    if ButtonSelection6 {
                        if let index = platformEmpty.firstIndex(of: "logo.playstation") {
                            platformEmpty.remove(at: index)
                        }
                    }
                    else {
                        platformEmpty.append("logo.playstation")
                    }
                    ButtonSelection6.toggle()
                }, label: {
                    Image(systemName: "logo.playstation")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(.horizontal)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .opacity(ButtonSelection6 ? 0.5: 1)
                        .animation(.easeOut(duration: 0.25))
                })
                Button(action: {
                    if ButtonSelection7 {
                        if let index = platformEmpty.firstIndex(of: "logo.xbox") {
                            platformEmpty.remove(at: index)
                        }
                    }
                    else {
                        platformEmpty.append("logo.xbox")
                    }
                    ButtonSelection7.toggle()
                }, label: {
                    Image(systemName: "logo.xbox")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(.horizontal)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .opacity(ButtonSelection7 ? 0.5: 1)
                        .animation(.easeOut(duration: 0.25))
                })
                Button(action: {
                    if ButtonSelection8 {
                        if let index = platformEmpty.firstIndex(of: "desktopcomputer") {
                            platformEmpty.remove(at: index)
                        }
                    }
                    else {
                        platformEmpty.append("desktopcomputer")
                    }
                    ButtonSelection8.toggle()
                }, label: {
                    Image(systemName: "desktopcomputer")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(.horizontal)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .opacity(ButtonSelection8 ? 0.5: 1)
                        .animation(.easeOut(duration: 0.25))
                })
            }
            .padding(.top)
            .padding(.bottom)
            Text("Type")
                .font(.system(size: 17, weight: .bold))
                .padding(10)
                .frame(width: 400)
                .background(Color.black)
                .foregroundColor(.white)
            
            LazyVGrid(columns: columns, spacing: 50) {
                
                Button(action: {
                    typeEmpty.append(GameType.Action(value: .plateformes))
                    ButtonsType[0].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Action(value: .plateformes), activeUser: user )
                })
                    
                Button(action: {
                    typeEmpty.append(GameType.Action(value: .shooter))
                    ButtonsType[1].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Action(value: .shooter), activeUser: user )
                })
                    
                Button(action: {
                    typeEmpty.append(GameType.Action(value: .combat))
                    ButtonsType[2].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Action(value: .combat), activeUser: user )
                })
                    
                Button(action: {
                    typeEmpty.append(GameType.Action(value: .BTA))
                    ButtonsType[3].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Action(value: .BTA), activeUser: user )
                })
                    
                Button(action: {
                    typeEmpty.append(GameType.Action(value: .survie))
                    ButtonsType[4].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Action(value: .survie), activeUser: user )
                })
                    
                Button(action: {
                    typeEmpty.append(GameType.Action(value: .rhythm))
                    ButtonsType[5].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Action(value: .rhythm), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.Action(value: .battleRoyale))
                    ButtonsType[6].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Action(value: .battleRoyale), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.Action(value: .FPS))
                    ButtonsType[7].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Action(value: .FPS), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.Action(value: .TPS))
                    ButtonsType[8].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Action(value: .TPS), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.ActionAventure(value: .survivalHorror))
                    ButtonsType[9].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.ActionAventure(value: .survivalHorror), activeUser: user )
                })
            }
            .padding()
            .padding(.top)
                LazyVGrid(columns: columns, spacing: 50) {

                Button(action: {
                    typeEmpty.append(GameType.ActionAventure(value: .metroidVania))
                    ButtonsType[10].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.ActionAventure(value: .metroidVania), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.ActionAventure(value: .infiltration))
                    ButtonsType[11].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.ActionAventure(value: .infiltration), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.Aventure(value: .visualNovel))
                    ButtonsType[12].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Aventure(value: .visualNovel), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.Aventure(value: .interactiveMovie))
                    ButtonsType[13].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Aventure(value: .interactiveMovie), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.RPG(value: .actionRPG))
                    ButtonsType[14].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.RPG(value: .actionRPG), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.RPG(value: .MMORPG))
                    ButtonsType[15].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.RPG(value: .MMORPG), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.RPG(value: .rogueLikes))
                    ButtonsType[16].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.RPG(value: .rogueLikes), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.RPG(value: .tacticalRPG))
                    ButtonsType[17].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.RPG(value: .tacticalRPG), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.RPG(value: .sandboxRPG))
                    ButtonsType[18].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.RPG(value: .sandboxRPG), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.RPG(value: .JRPG))
                    ButtonsType[19].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.RPG(value: .JRPG), activeUser: user )
                })
                }
                .padding()
                .padding(.top, 10)
            LazyVGrid(columns: columns, spacing: 50) {

                Button(action: {
                    typeEmpty.append(GameType.RPG(value: .monsterTamer))
                    ButtonsType[20].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.RPG(value: .monsterTamer), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.RPG(value: .hackAndSlash))
                    ButtonsType[21].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.RPG(value: .hackAndSlash), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.Simulation(value: .constructionAndManagement))
                    ButtonsType[22].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Simulation(value: .constructionAndManagement), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.Simulation(value: .life))
                    ButtonsType[23].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Simulation(value: .life), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.Simulation(value: .vehicles))
                    ButtonsType[24].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Simulation(value: .vehicles), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.Strategy(value: .MOBA))
                    ButtonsType[25].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Strategy(value: .MOBA), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.Strategy(value: .RTS))
                    ButtonsType[26].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Strategy(value: .RTS), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.Strategy(value: .towerDefense))
                    ButtonsType[27].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Strategy(value: .towerDefense), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.Strategy(value: .TBS))
                    ButtonsType[28].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Strategy(value: .TBS), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.Strategy(value: .warGames))
                    ButtonsType[29].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Strategy(value: .warGames), activeUser: user )
                })
            }
            .padding()
            .padding(.top, 10)

                LazyVGrid(columns: columns, spacing: 50) {

                Button(action: {
                    typeEmpty.append(GameType.Reflexion(value: .puzzle))
                    ButtonsType[30].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Reflexion(value: .puzzle), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.Reflexion(value: .labyrinth))
                    ButtonsType[31].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Reflexion(value: .labyrinth), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.Sport(value: .racing))
                    ButtonsType[32].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Sport(value: .racing), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.Sport(value: .sports))
                    ButtonsType[33].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.Sport(value: .sports), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.OpenWorld(value: .sandbox))
                    ButtonsType[34].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.OpenWorld(value: .sandbox), activeUser: user )
                })
                Button(action: {
                    typeEmpty.append(GameType.OpenWorld(value: .openWorld))
                    ButtonsType[35].toggle()
                }, label: {
                    GameStyleButton(gameStyle: GameType.OpenWorld(value: .openWorld), activeUser: user )
                })
                
            }
            .padding()
            .padding(.top,10)
        }
        }
    }
}

struct FilterElement_Previews: PreviewProvider {
    static var previews: some View {
        FilterElement(showing: .constant(false), pegiEmpty: .constant([""]), typeEmpty: .constant([GameType.Empty]), platformEmpty: .constant([""]), ButtonSelection: .constant(false), ButtonSelection1: .constant(false), ButtonSelection2: .constant(false), ButtonSelection3: .constant(false), ButtonSelection4: .constant(false), ButtonSelection5: .constant(false), ButtonSelection6: .constant(false), ButtonSelection7: .constant(false), ButtonSelection8: .constant(false), ButtonsType: .constant([]))
            //.preferredColorScheme(.dark)
    }
}

