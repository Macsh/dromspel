//
//  Models.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import Foundation

struct Game: Identifiable, Equatable {
    static func == (lhs: Game, rhs: Game) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id = UUID()
    let name: String
    let type: GameType
    let date: String
    let editor: String
    let video: String
    let image: String
    let description: String
    let platform: [String]
    let pegi: String
    let price: String
}

struct Event: Identifiable, Equatable {
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id
    }
    let id = UUID()
    let name: String
    let date: String
    let image: String
    let localisation: String
    let description: String
    let link: String
}


enum Action : String, CaseIterable {
    case plateformes = "Plateforme"
    case shooter = "Shooter"
    case combat = "Combat"
    case BTA = "Beat'em up"
    case survie = "Survie"
    case rhythm = "Rythme"
    case battleRoyale = "Battle Royale"
    case FPS = "FPS"
    case TPS = "TPS"
}

enum ActionAventure : String, CaseIterable {
    case survivalHorror = "Survival Horror"
    case metroidVania = "Metroidvania"
    case infiltration = "Infiltration"
}

enum Aventure : String, CaseIterable {
    case visualNovel = "Visual Novel"
    case interactiveMovie = "Fiction Intéractive"
}

enum RPG: String, CaseIterable {
    case actionRPG = "Action RPG"
    case MMORPG = "MMORPG"
    case rogueLikes = "Rogue-Like"
    case tacticalRPG = "RPG tactique"
    case sandboxRPG = "RPG bac à sable"
    case JRPG = "RPG japonais"
    case monsterTamer = "Capture de monstres"
    case hackAndSlash = "Hack'n'Slash"
}

enum Simulation : String, CaseIterable {
    case constructionAndManagement = "Gestion"
    case life = "God game"
    case vehicles = "Simulation de véhicule"
}

enum Strategy: String, CaseIterable {
    case MOBA = "MOBA"
    case RTS = "Stratégie en temps réel"
    case towerDefense = "Tower Défense"
    case TBS = "Stratégie au tour par tour"
    case warGames = "Jeux de guerre"
}

enum Reflexion: String, CaseIterable {
    case puzzle = "Puzzle"
    case labyrinth = "Labyrinthe"
}

enum Sport: String, CaseIterable {
    case racing = "Course"
    case sports = "Sport"
}

enum OpenWorld: String, CaseIterable {
    case sandbox = "Bac à sable"
    case openWorld = "Monde ouvert"
}

enum SeeMore: String, CaseIterable {
    case more = "Voir plus..."
}

enum GameType {
    
    case Action(value: Action)
    case ActionAventure(value: ActionAventure)
    case Aventure(value: Aventure)
    case RPG(value: RPG)
    case Simulation(value: Simulation)
    case Strategy(value: Strategy)
    case Reflexion(value: Reflexion)
    case Sport(value: Sport)
    case OpenWorld(value: OpenWorld)
    case SeeMore(value: SeeMore)
    case Empty
}

extension GameType {
    var keyString: String {
        switch self {
            case .Action(let action): return action.rawValue
            case .ActionAventure(let actionAventure): return actionAventure.rawValue
            case .Aventure(let aventure): return aventure.rawValue
            case .RPG(let rpg): return rpg.rawValue
            case .Simulation(let simulation): return simulation.rawValue
            case .Strategy(let strategy): return strategy.rawValue
            case .Reflexion(let reflexion): return reflexion.rawValue
            case .Sport(let sport): return sport.rawValue
            case .OpenWorld(let openWorld): return openWorld.rawValue
            case .SeeMore(let seeMore): return seeMore.rawValue
            case .Empty: return ""

        }
    }
}

//Extension
extension GameType {
    
    func getStringValue() -> String {
        return "GameType.\(self.keyString)"
    }
    
    static func fromStringValue(_ value: String) -> GameType {
        for type in dromspel.Action.allCases {
            if type.rawValue == value {
                return GameType.Action(value: type)
            }
        }
        for type in dromspel.ActionAventure.allCases {
            if type.rawValue == value {
                return GameType.ActionAventure(value: type)
            }
        }
        for type in dromspel.Aventure.allCases {
            if type.rawValue == value {
                return GameType.Aventure(value: type)
            }
        }
        for type in dromspel.RPG.allCases {
            if type.rawValue == value {
                return GameType.RPG(value: type)
            }
        }
        for type in dromspel.Simulation.allCases {
            if type.rawValue == value {
                return GameType.Simulation(value: type)
            }
        }
        for type in dromspel.Strategy.allCases {
            if type.rawValue == value {
                return GameType.Strategy(value: type)
            }
        }
        for type in dromspel.Reflexion.allCases {
            if type.rawValue == value {
                return GameType.Reflexion(value: type)
            }
        }
        for type in dromspel.Sport.allCases {
            if type.rawValue == value {
                return GameType.Sport(value: type)
            }
        }
        for type in dromspel.OpenWorld.allCases {
            if type.rawValue == value {
                return GameType.OpenWorld(value: type)
            }
        }
        
        return GameType.Empty
    }
}

enum Pegi: String {
    case pegi_3 = "PEGI 3"
    case pegi_7 = "PEGI 7"
    case pegi_12 = "PEGI 12"
    case pegi_16 = "PEGI 16"
    case pegi_18 = "PEGI 18"
}


//Structure utilisateur
class User : ObservableObject {
    @Published var gamesList: [Int] = []
    @Published var history: [Int] = []
    @Published var likedGames: [Int] = []
    @Published var dislikedGames: [Int] = []
    var preferences : [GameType] = [] //determiner le type
    var experiences: [Int] = []
    var pseudo: String = ""
    var description: String = ""
    
    init(gamesList: [Int] = [], history: [Int] = [],likedGames: [Int] = [],dislikedGames: [Int] = [],preferences : [GameType] = [],experiences: [Int] = [],pseudo: String = "",description: String = "") {
        self.gamesList = gamesList
        self.history = history
        self.likedGames = likedGames
        self.dislikedGames = dislikedGames
        self.preferences = preferences
        self.experiences = experiences
        self.pseudo = pseudo
        self.description = description
    }
    
    func addGameToHistory(_ game: Game) {
        if let g = games.firstIndex(of: game) {
            self.addGameToHistory(g)
        }
    }
    
    func addGameToHistory(_ index: Int) {
        if let pos = self.history.firstIndex(of: index) {
            self.history.remove(at: pos)
        }
        self.history.append(index)
    }
    
    func saveUserToUserDefault() {
        UserDefaults.standard.set(self.pseudo, forKey: "user.pseudo")
        UserDefaults.standard.set(self.description, forKey: "user.description")
        UserDefaults.standard.set(self.gamesList, forKey: "user.gamesList")
        UserDefaults.standard.set(self.history, forKey: "user.history")
        UserDefaults.standard.set(self.likedGames, forKey: "user.likedGames")
        UserDefaults.standard.set(self.dislikedGames, forKey: "user.dislikedGames")
        UserDefaults.standard.set(User.getPreferencesAsStrings(self.preferences), forKey: "user.preferences")
        UserDefaults.standard.set(self.experiences, forKey: "user.experiences")
        
    }
    
    static func getUserFromUserDefaults() -> User? {
        var result: User?
        
        if let pseudo = UserDefaults.standard.string(forKey: "user.pseudo") {
            let description = UserDefaults.standard.string(forKey: "user.description") ?? ""
            let gamesList : [Int] = UserDefaults.standard.array(forKey: "user.gamesList") as? [Int] ?? []
            let history : [Int] = UserDefaults.standard.array(forKey: "user.history") as? [Int] ?? []
            let likedGames : [Int] = UserDefaults.standard.array(forKey: "user.likedGames") as? [Int] ?? []
            let dislikedGames : [Int] = UserDefaults.standard.array(forKey: "user.dislikedGames") as? [Int] ?? []
            let preferences: [GameType]  = User.getPreferencesFromStrings(UserDefaults.standard.array(forKey: "user.preferences") as? [String] ?? [])
            let experiences : [Int] = UserDefaults.standard.array(forKey: "user.experiences") as? [Int] ?? []
            
            result = User(gamesList: gamesList, history: history, likedGames: likedGames, dislikedGames: dislikedGames, preferences: preferences, experiences: experiences, pseudo: pseudo, description: description)
        }
        
        return result
    }
    
    static func deleteUserFromUserDefault() {
        UserDefaults.standard.removeObject(forKey: "user.pseudo")
        UserDefaults.standard.removeObject(forKey: "user.description")
        UserDefaults.standard.removeObject(forKey: "user.gamesList")
        UserDefaults.standard.removeObject(forKey: "user.history")
        UserDefaults.standard.removeObject(forKey: "user.likedGames")
        UserDefaults.standard.removeObject(forKey: "user.dislikedGames")
        UserDefaults.standard.removeObject(forKey: "user.preferences")
        UserDefaults.standard.removeObject(forKey: "user.experiences")
    }
    
    static func getPreferencesAsStrings(_  values: [GameType]) -> [String] {
        var result: [String] = []
        
        for type in values {
            result.append("GameType.\(type.keyString)")
        }
        
        return result
    }
    
    static func getPreferencesFromStrings(_ values: [String]) -> [GameType] {
        var result: [GameType] = []
        
        for type in values {
            if type.hasPrefix("GameType.") {
                let typeTrimmed = type.components(separatedBy: ".")[1]
                result.append(GameType.fromStringValue(typeTrimmed))
            }
        }
        
        return result
    }
}

enum Motivation: String, CaseIterable, Identifiable {
    
    case passerLeTemps
    case exterioriser
    case seViderLeCrane
    case autre

    var id: String { self.rawValue }

}
    
enum WhichPlayer: String, CaseIterable, Identifiable {
    case jeuxCollectifs
    case egotrip

    var id: String { self.rawValue }
}

enum AreYou: String, CaseIterable, Identifiable {
    
    case man
    case woman
    case both

    var id: String { self.rawValue }

}

enum GameTypeTitles: String, CaseIterable, Identifiable {
    
    case action
    case aventure
    case rpg
    case simulation
    case strategy
    case reflexion
    case sport
    case openworld

    var id: String { self.rawValue }

}
