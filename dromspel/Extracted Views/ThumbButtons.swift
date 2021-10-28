//
//  PoucesButtons.swift
//  dromspiel
//
//  Created by lucas on 26/10/2021.
//
import SwiftUI

/*
 Structure représentant le pouce pointant vers le haut
  Cette structure est en "fileprivate" car on ne doit pas pouvoir y acceder depuis un autre fichier
 */
fileprivate struct ThumbUp: View {
    //Variable d'environnement pour récupérer le mode d'affichage de l'IPhone (Clair, Sombre)
    @Environment(\.colorScheme) var colorScheme
    //Bool indiquant si l'on dessine ce pouce-ci, en "@Binding" pour que l'on puisse le modifier depuis cette structure (le pouce visé : ThumbUp)
    @Binding var drawThumb: Bool
    //Bool indiquant si l'on dessine l'autre pouce, en "@Binding" pour que l'on puisse le modifier depuis cette structure (le pouce visé : ThumbDown)
    @Binding var drawOtherThumb: Bool
    //L'index du jeu ciblé dans le tableau global "games", en "@State" pour que l'on puisse le modifier a partir d'un bouton
    //Cette variable ne sera pas utilisée en dehors de cette structure
    @State var gameIndex : Int
    //La variable permettant de savoir si le bouton est coché/validé ou non, en "@State" pour que l'on puisse le modifier a partir d'un bouton
    //Cette variable ne sera pas utilisée en dehors de cette structure
    @State var isValidated: Bool = false
    //L'utilisateur qui utilise ce bouton, en "@ObservedObject" pour que les changements s'actualisent a l'affichage quand on change une valeur "@Published" dans l'utilisateur
    @ObservedObject var activeUser : User
    //Le jeu ciblé sur lequel le pouce agira dans la structure "activeUser"
    let game: Game
    //La taille du pouce
    let size: Double
    
    //Le corps du pouce ou l'on met nos Views
    var body: some View {
        //Une ZStack pour que l'on puisse superposer le symbol du pouce rempli et de son contour
        ZStack {
            //Le pouce rempli
            Image(systemName: "hand.thumbsup.fill")
                .font(.system(size: size))
                .foregroundColor(isValidated ? .green : .blue)
            //Le contour du pouce
            //Puisque ce symbol est déclaré en dessous du pouce plein, il se trouvera donc devant en terme de profondeur donc c'est lui qui sera vérifié si l'on appuie sur le pouce, on lui applique donc le modifier "onTapGesture"
            Image(systemName: "hand.thumbsup")
                  .foregroundColor(colorScheme == .dark ? .white : .black)
                  .font(.system(size: size+2)) //On dessine le contour un peu plus grand que le pouce sinon c'est moche.
            }
                .onTapGesture(perform: onTap) //On indique que dès que l'utilisateur appuie sur le pouce, la fonction "onTap" (se trouvant plus bas dans cette structure) est appelée
                .onAppear(perform: appear) //On indique que dès que le pouce est affiché, la fonction "appear" (se trouvant plus bas dans cette structure) est appelée
    }
    
    //Fonction vérifiant que l'index entré est valide (si il n'est pas égal a -1)
    func isValidIndex(_ index: Int) -> Bool {
        return index >= 0
    }
    
    //Fonction appelée lorque l'utilisateur appuie sur le pouce.
    func onTap() {
        //On vérifie que la variable "gameIndex" est valide
        if isValidIndex(gameIndex) {
            if self.isValidated { //Si le bouton est déja coché/validé alors
                
                //On calcule l'index de la valeur "gameIndex" dans le tableau contenant les jeux que l'utilisateur a aimé (tableau de Int)
                //Comme la fonction firstIndex retourne un Optional(Int), nous devons l'unwrapper dans la constante "gIndex"
                //La constante "gIndex" contient donc l'index de la valeur "gameIndex" dans le tableau "likedGames"
                if let gIndex = self.activeUser.likedGames.firstIndex(of: gameIndex) {
                    
                    //On retire du tableau "likedGames" la valeur contenu a l'index "gIndex"
                    self.activeUser.likedGames.remove(at: gIndex)
                }
            } else { //Si le bouton n'est pas coché/validé alors
                
                //On ajoute la variable "gameIndex" dans le tableau "likedGames"
                self.activeUser.likedGames.append(gameIndex)
            }

            self.isValidated.toggle() //On change l'état de validation du bouton
            drawOtherThumb = !self.isValidated // On indique si il faut dessiner l'autre pouce ou non en fonction de l'état de validation du ce bouton (par exemple si ce bouton est coché, alors l'autre pouce disparaîtra)
        }
    }
    
    //Fonction appelée lorsque le pouce apparaît
    func appear() {
        //On vérifie que la variable "gameIndex" est valide
        if !isValidIndex(gameIndex) { //Si "gameIndex" n'est pas valide
            
            //On calcule l'index de la valeur "game" dans le tableau global de jeux disponibles (tableau de Game)
            //Comme la fonction firstIndex retourne un Optional(Int), nous devons l'unwrapper dans la constante "gIndex"
            //La constante "gIndex" contient donc l'index de la valeur voulue pour la variable "gameIndex" (c'est-à-dire l'index de la variable "game" dans le tableau global "games")
            if let gIndex = games.firstIndex(of: self.game) {
                self.gameIndex = gIndex
            }
        }
        
        //On définit l'état de validation du bouton en vérifiant si la valeur "gameIndex" est contenue dans le tableau "likedGames" (si le jeu est un jeu que l'utilisateur a aimé)
        isValidated = (activeUser.likedGames.contains(gameIndex))
    }
}

/*
 Structure représentant le pouce pointant vers le bas
  Cette structure est en "fileprivate" car on ne doit pas pouvoir y acceder depuis un autre fichier
 */
fileprivate struct ThumbDown: View {
    //Variable d'environnement pour récupérer le mode d'affichage de l'IPhone (Clair, Sombre)
    @Environment(\.colorScheme) var colorScheme
    //Bool indiquant si l'on dessine ce pouce-ci, en "@Binding" pour que l'on puisse le modifier depuis cette structure (le pouce visé : ThumbDown)
    @Binding var drawThumb: Bool
    //Bool indiquant si l'on dessine l'autre pouce, en "@Binding" pour que l'on puisse le modifier depuis cette structure (le pouce visé : ThumbUp)
    @Binding var drawOtherThumb: Bool
    //L'index du jeu ciblé dans le tableau global "games", en "@State" pour que l'on puisse le modifier a partir d'un bouton
    //Cette variable ne sera pas utilisée en dehors de cette structure
    @State var gameIndex : Int
    //La variable permettant de savoir si le bouton est coché/validé ou non, en "@State" pour que l'on puisse le modifier a partir d'un bouton
    //Cette variable ne sera pas utilisée en dehors de cette structure
    @State var isValidated: Bool = false
    //L'utilisateur qui utilise ce bouton, en "@ObservedObject" pour que les changements s'actualisent a l'affichage quand on change une valeur "@Published" dans l'utilisateur
    @ObservedObject var activeUser : User
    //Le jeu ciblé sur lequel le pouce agira dans la structure "activeUser"
    let game: Game
    //La taille du pouce
    let size: Double
    
    //Le corps du pouce ou l'on met nos Views
    var body: some View {
        //Une ZStack pour que l'on puisse superposer le symbol du pouce rempli et de son contour
        ZStack {
            //Le pouce rempli
            Image(systemName: "hand.thumbsdown.fill")
                .font(.system(size: size))
                .foregroundColor(isValidated ? .black : .red)
            //Le contour du pouce
            //Puisque ce symbol est déclaré en dessous du pouce plein, il se trouvera donc devant en terme de profondeur donc c'est lui qui sera vérifié si l'on appuie sur le pouce, on lui applique donc le modifier "onTapGesture"
            Image(systemName: "hand.thumbsdown")
                .foregroundColor(colorScheme == .dark ? .white : isValidated ? .white : .black) //Les contour du pouce ne se voyant pas en mode clair quand le pouce est coché/validé, on ajoute une seconde condition (ou commentce le "isValidated") pour changer la couleur du coutour en blanc si le bouton est validé
                .font(.system(size: size+2)) //On dessine le contour un peu plus grand que le pouce sinon c'est moche.
        }
            .onTapGesture(perform: onTap) //On indique que dès que l'utilisateur appuie sur le pouce, la fonction "onTap" (se trouvant plus bas dans cette structure) est appelée
            .onAppear(perform: appear) //On indique que dès que le pouce est affiché, la fonction "appear" (se trouvant plus bas dans cette structure) est appelée
    }
    
    //Fonction vérifiant que l'index entré est valide (si il n'est pas égal a -1)
    func isValidIndex(_ index: Int) -> Bool {
        return index >= 0
    }
    
    //Fonction appelée lorque l'utilisateur appuie sur le pouce.
    func onTap() {
        //On vérifie que la variable "gameIndex" est valide
        if isValidIndex(gameIndex) {
            if self.isValidated {  //Si le bouton est déja coché/validé alors
                
                //On calcule l'index de la valeur "gameIndex" dans le tableau contenant les jeux que l'utilisateur n'a pas aimé (tableau de Int)
                //Comme la fonction firstIndex retourne un Optional(Int), nous devons l'unwrapper dans la constante "gIndex"
                //La constante "gIndex" contient donc l'index de la valeur "gameIndex" dans le tableau "dislikedGames"
                if let gIndex = self.activeUser.dislikedGames.firstIndex(of: gameIndex) {
                    
                    //On retire du tableau "dislikedGames" la valeur contenu a l'index "gIndex"
                    self.activeUser.dislikedGames.remove(at: gIndex)
                }
            } else { //Si le bouton n'est pas coché/validé alors
                
                //On ajoute la variable "gameIndex" dans le tableau "dilikedGames"
                self.activeUser.dislikedGames.append(gameIndex)
            }
            
            self.isValidated.toggle() //On change l'état de validation du bouton
            drawOtherThumb = !self.isValidated // On indique si il faut dessiner l'autre pouce ou non en fonction de l'état de validation du ce bouton (par exemple si ce bouton est coché, alors l'autre pouce disparaîtra)
        }
    }
    
    //Fonction appelée lorsque le pouce apparaît
    func appear() {
        //On vérifie que la variable "gameIndex" est valide
        if !isValidIndex(gameIndex) { //Si "gameIndex" n'est pas valide
            
            //On calcule l'index de la valeur "game" dans le tableau global de jeux disponibles (tableau de Game)
            //Comme la fonction firstIndex retourne un Optional(Int), nous devons l'unwrapper dans la constante "gIndex"
            //La constante "gIndex" contient donc l'index de la valeur voulue pour la variable "gameIndex" (c'est-à-dire l'index de la variable "game" dans le tableau global "games")
            if let gIndex = games.firstIndex(of: self.game) {
                self.gameIndex = gIndex
            }
        }
        
        //On définit l'état de validation du bouton en vérifiant si la valeur "gameIndex" est contenue dans le tableau "dislikedGames" (si le jeu est un jeu que l'utilisateur n'a pas aimé)
        isValidated = (activeUser.dislikedGames.contains(gameIndex))
    }
}

/*
 Structure réunissant les deux boutons "pouces" pour faciliter l'intégration dans d'autres pages.
 */
struct ThumbButtons: View {
    //L'index du jeu ciblé dans le tableau global "games", en "@State" pour que l'on puisse le modifier a partir d'un bouton
    //Cette variable ne sera pas utilisée en dehors de cette structure
    //Il est possible de ne pas spécifier cet index à l'initialisation mais il est préférable de le spécifier si possible pour de meilleures performances
    var gameIndex: Int
    //L'utilisateur qui utilise les boutons "pouces"
    var activeUser : User
    //Le jeu ciblé sur lequel les pouces agiront dans la structure "activeUser"
    let game: Game
    //La taille des pouces
    let size: Double
    //L'espacement entre les deux pouces
    let spacing: Double
    
    //Variable indiquant si l'on dessine le pouce pointant vers le haut
    //Cette variable est en "@State" pour pouvoir l'utiliser en tant que binding pour les pouces
    @State var drawThumbUp = true
    //Variable indiquant si l'on dessine le pouce pointant vers le bas
    //Cette variable est en "@State" pour pouvoir l'utiliser en tant que binding pour les pouces
    @State var drawThumbDown = true
    
    //Initialisateur pour faciliter l'intégration dans d'autres écrans
    init(size: Double = 30, spacing: Double = 0, activeUser: User, game: Game, gameIndex: Int = -1) {
        self.size = size
        self.activeUser = activeUser
        self.game = game
        self.spacing = spacing
        self.gameIndex = gameIndex
        
        //On vérifie que la variable "gameIndex" est valide
        if !isValidIndex(self.gameIndex) { //Si "gameIndex" n'est pas valide
            
            //On calcule l'index de la valeur "game" dans le tableau global de jeux disponibles (tableau de Game)
            //Comme la fonction firstIndex retourne un Optional(Int), nous devons l'unwrapper dans la constante "gIndex"
            //La constante "gIndex" contient donc l'index de la valeur voulue pour la variable "gameIndex" (c'est-à-dire l'index de la variable "game" dans le tableau global "games")
            if let gIndex = games.firstIndex(of: self.game) {
                self.gameIndex = gIndex
            }
        }
    }
    
    //Le corps du pouce ou l'on met nos Views
    var body: some View {
        HStack {
            //On dessine le pouce pointant vers le haut si la variable "drawThumbUp" est "vrai"
            if drawThumbUp {
                ThumbUp(drawThumb: $drawThumbUp,
                        drawOtherThumb: $drawThumbDown,
                        gameIndex: self.gameIndex,
                        activeUser: activeUser, game: game, size: size)
            }
            
            //On dessine l'espacement si les deux pouces sont affichés
            if drawThumbUp && drawThumbDown {
                Spacer()
                .frame(width: spacing)
            }
            
            //On dessine le pouce pointant vers le bas si la variable "drawThumbDown" est "vrai"
            if drawThumbDown {
                ThumbDown(drawThumb: $drawThumbDown,
                          drawOtherThumb: $drawThumbUp,
                          gameIndex: self.gameIndex,
                          activeUser: activeUser, game: game, size: size)
            }
        }
        .animation(.easeInOut(duration: 0.2)) //On paramètre une animation en mode easeInOut durant 0.2 secondes
        .onAppear(perform: { //Quand cette structure
            
            //Si le jeu est un jeu que l'utilisateur n'a pas aimé, alors on affiche pas le pouce pointant vers le haut
            drawThumbUp = !(activeUser.dislikedGames.contains(gameIndex))
            
            //Si le jeu est un jeu que l'utilisateur a aimé, alors on affiche pas le pouce pointant vers le bas
            drawThumbDown = !(activeUser.likedGames.contains(gameIndex))
        })
    }
    
    //Fonction vérifiant que l'index entré est valide (si il n'est pas égal a -1)
    func isValidIndex(_ index: Int) -> Bool {
        return index >= 0
    }
}

struct ThumbButtons_Previews: PreviewProvider {
    static var previews: some View {
        ThumbButtons(size: 30,activeUser: user, game: games[0])
            .preferredColorScheme(.dark)
    }
}

