//
//  Models.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import Foundation

struct Game: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let date: String
    let editor: String
    let video: String
    let image: String
    let description: String
    let pegi: String
    let price: String
}

enum GameType {
    
    enum Action : String {
        case plateformes = "Plateforme"
        case shooter = "Shooter"
        case combat = "Combat"
        case BTA = "Beat'em up"
        case survie = "Survie"
        case rhythm = "Rhythme"
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
}

enum Pegi: String {
    case pegi_3 = "PEGI 3"
    case pegi_7 = "PEGI 7"
    case pegi_12 = "PEGI 12"
    case pegi_16 = "PEGI 16"
    case pegi_18 = "PEGI 18"
}

