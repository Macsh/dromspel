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

struct Event: Identifiable {
    let id = UUID()
    let name: String
    let date: String
    let image: String
    let localisation: String
    let description: String
    let link: String
}


enum Action : String {
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

enum ActionAventure : String {
    case survivalHorror = "Survival Horror"
    case metroidVania = "Metroidvania"
    case infiltration = "Infiltration"
}

enum Aventure : String {
    case textAdventures = "Aventures textuelles"
    case graphicAdventures = "Aventures graphiques"
    case visualNovel = "Visual Novels"
    case interactiveMovie = "Fiction Intéractive"
}

enum RPG: String {
    case actionRPG = "Action RPG"
    case MMORPG = "MMORPG"
    case rogueLikes = "Rogue-Likes"
    case tacticalRPG = "RPG tactique"
    case sandboxRPG = "RPG bac a sable"
    case dungeonsRPG = "RPG donjons"
    case JRPG = "RPG japonais"
    case monsterTamer = "Capture de monstres"
    case hackAndSlash = "Hack'n'Slash"
}

enum Simulation : String {
    case constructionAndManagement = "Gestion"
    case life = "God game"
    case vehicles = "Simulation de véhicule"
}

enum Strategy: String {
    case MOBA = "MOBA"
    case RTS = "Real-time strategy"
    case towerDefense = "Tower Défense"
    case TBS = "stratégie au tour par tour"
    case warGames = "jeux de guerre"
}

enum Reflexion: String {
    case puzzle = "Puzzle"
    case labyrinth = "Labyrinth"
}

enum Sport: String {
    case racing = "Course"
    case sports = "Sport"
}

enum OpenWorld: String {
    case sandbox = "Bac à sable"
    case openWorld = "Monde ouvert"
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
    var experiences: [Game] = []
    var pseudo: String = ""
    var description: String = ""
    
    init(gamesList: [Int] = [], history: [Int] = [],likedGames: [Int] = [],dislikedGames: [Int] = [],preferences : [GameType] = [],experiences: [Game] = [],pseudo: String = "",description: String = "") {
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
}

