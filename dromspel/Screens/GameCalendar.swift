//
//  Calendrier.swift
//  dromspel
//
//  Created by lucas on 28/10/2021.
//

import SwiftUI

enum CalendarState: Int {
    case sorties, events
}

fileprivate struct CalendarDate {
    let jour: Int
    let mois: Int
    let annee: Int
    
    private static let nilCalendar = CalendarDate(0,0,0)
    
    private init(_ jour: Int, _ mois: Int, _ annee: Int) {
        self.jour = jour
        self.mois = mois
        self.annee = annee
    }
    
    static func fromStringDate(_ date: String) -> CalendarDate {
        let strComponents = date.components(separatedBy: "/")
        
        if (strComponents.count < 3) {
            return CalendarDate(0,0,0)
        }
        
        if let j = Int(strComponents[0]),
           let m = Int(strComponents[1]) ,
           let a = Int(strComponents[2]) {
                return CalendarDate(j, m, a)
        }
        
        return CalendarDate(0,0,0)
    }
    
    static func fromStringDateWithoutDay(_ date: String) -> CalendarDate {
        let strComponents = date.components(separatedBy: "/")
        
        if (strComponents.count < 2) {
            return CalendarDate(0,0,0)
        }
        
        if let m = Int(strComponents[0]),
           let a = Int(strComponents[1]) {
                return CalendarDate(0, m, a)
        }
        
        return CalendarDate(0,0,0)
    }
    
    static func getCurrentDate() -> CalendarDate {
        let format = DateFormatter()
        format.dateFormat = "dd/MM/yyyy"
        
        return CalendarDate.fromStringDate(format.string(from: Date()))
    }
    
    func isNilCalendar() -> Bool {
        return self.compareDates(date: CalendarDate.nilCalendar) == 0
    }
    
    func compareDates(date: CalendarDate) -> Int {
        if (self.annee == date.annee) {
            
            if (self.mois == date.mois) {
                if (self.jour == date.jour) {
                    return 0
                }
                else {
                    if (self.jour > date.jour) {
                        return 1
                    }
                    else {
                        return -1
                    }
                }
            }
            else {
                if (self.mois > date.mois) {
                    return 1
                }
                else {
                    return -1
                }
            }
            
        }
        else {
            if (self.annee > date.annee) {
                return 1
            }
            else {
                return -1
            }
        }
    }
    
    func getStringDate() -> String {
        let d: LocalizedStringKey = "\(jour, specifier: "%.2d")/\(mois, specifier: "%.2d")/\(annee, specifier: "%.4d")"
        return d.stringValue()
    }
    
    func getStringDateWithoutDay() -> String {
        var date = getStringDate()
        date.removeFirst()
        date.removeFirst()
        date.removeFirst()
        return date;
    }
    
    static func getStringDateWithoutDay(_ str: String) -> String {
        if (str == "") {
            return ""
        }
        
        var str2 = str
        str2.removeFirst()
        str2.removeFirst()
        str2.removeFirst()
        return str2;
    }

}

struct GameCalendar: View {
    @State private var selection = CalendarState.sorties
    
    @State var searchResult = ""
    
    let activeUser: User
    
    fileprivate var currentDate: CalendarDate
    
    //Dictionnaire de jeux en fonction de leur date de sortie
    private var gameDictionary : [String:[Game]] = [:]
    
    //Dictionnaire d'évènement en fonction de leur date
    private var eventDictionary : [String:[Event]] = [:]
    
    //Tableau des clés, pour pouvoir ordonner les dates de jeux
    private var gameKeyValues : [String] = []
    
    //Tableau des clés, pour pouvoir ordonner les dates d'évènement
    private var eventKeyValues : [String] = []
    
    init(activeUser: User) {
        self.activeUser = activeUser
        self.currentDate = CalendarDate.getCurrentDate()
        gameDictionary = self.generateGameDictionnary()
        eventDictionary = self.generateEventDictionnary()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $selection) {
                    Text("Sorties")
                        .tag(CalendarState.sorties)
                    Text("Évènements")
                        .tag(CalendarState.events)
                }
                .pickerStyle(.segmented)
                SearchBar(binding: $searchResult)
                
                ScrollView {
                    VStack {
                        ForEach(selection == CalendarState.sorties ? gameKeyValues : eventKeyValues, id: \.self) { key in

                        let dateForComparison = CalendarDate.fromStringDateWithoutDay(key)

                        //On affiche les jeu a partir de la date actuelle
                        if !(key != "" && (dateForComparison.compareDates(date: currentDate) <= 0)) {
                            let toAff = key == "" ? "Disponible prochainement" : key
                            GameCalendarListSeparator(toAff)
//                            Spacer()
//                                .frame(height: 15)
                            if selection == CalendarState.sorties {
                                if let dictionary = gameDictionary[key] {
                                    ForEach(dictionary, id: \.self) { game in
                                        Spacer(minLength: 50)
                                        ListGameRowCalendar(game: game, activeUser: activeUser)
                                    }
                                    Spacer()
                                    .frame(height: 50)
                                }
                            }
                            else {
                                if let dictionary = eventDictionary[key] {
                                    ForEach(dictionary, id: \.self) { event in
                                        Spacer(minLength: 50)
                                        ListEventRow(event: event)
                                        }
                                    Spacer()
                                    .frame(height: 50)
                                    }
                                }
                            }
                        }
                    }
                }
                
            }
            .navigationBarTitle(Text(selection == CalendarState.sorties ? "Sorties" : "Évènements"), displayMode: .inline)
        }
    }
    
    mutating private func generateGameDictionnary() -> [String:[Game]] {
        
        var result: [String:[Game]] = [:]
        
        //On ajoute les jeux dans le dictionnary
        for g in games {
            
            let date = CalendarDate.getStringDateWithoutDay(g.date)
            if var array = result[date] {
                array.append(g)
                result[date] = array
            }
            else {
                result[date] = [g]
                gameKeyValues.append(date)
            }
        }
        
        //On ordonne les mois
        gameKeyValues = gameKeyValues.sorted(by: { elem1, elem2 in
            if (elem1 == "") {
                return false
            } else if (elem2 == "") {
                return true
            }
            
            let date1 = CalendarDate.fromStringDateWithoutDay(elem1)
            let date2 = CalendarDate.fromStringDateWithoutDay(elem2)
            
            return date1.compareDates(date: date2) < 0
        })
        
        //on ordonne les dates a l'intérieur des mois
        for key in gameKeyValues {
            if let array = result[key] {
                result[key] = array.sorted(by: { game1, game2 in
                    return game1.date < game2.date
                })
            }
        }
        
        return result
    }
    
    mutating private func generateEventDictionnary() -> [String:[Event]] {
        
        var result: [String:[Event]] = [:]
        
        //On ajoute les events dans le dictionnary
        for g in events {
            
            let date = CalendarDate.getStringDateWithoutDay(g.date)
            if var array = result[date] {
                array.append(g)
                result[date] = array
            }
            else {
                result[date] = [g]
                eventKeyValues.append(date)
            }
        }
        
        //On ordonne les mois
        eventKeyValues = eventKeyValues.sorted(by: { elem1, elem2 in
            if (elem1 == "") {
                return false
            } else if (elem2 == "") {
                return true
            }
            
            let date1 = CalendarDate.fromStringDateWithoutDay(elem1)
            let date2 = CalendarDate.fromStringDateWithoutDay(elem2)
            
            return date1.compareDates(date: date2) < 0
        })
        
        //on ordonne les dates a l'intérieur des mois
        for key in eventKeyValues {
            if let array = result[key] {
                result[key] = array.sorted(by: { game1, game2 in
                    return game1.date < game2.date
                })
            }
        }
        
        return result
    }
    
}

//Extensionspour les String
extension LocalizedStringKey {
    var stringKey: String {
        let description = "\(self)"

        let components = description.components(separatedBy: "key: \"")
            .map { $0.components(separatedBy: "\",") }

        return components[1][0]
    }
}

extension String {
    static func localizedString(for key: String,
                                locale: Locale = .current) -> String {
        
        let language = locale.languageCode
        let path = Bundle.main.path(forResource: language, ofType: "lproj")!
        let bundle = Bundle(path: path)!
        let localizedString = NSLocalizedString(key, bundle: bundle, comment: "")
        
        return localizedString
    }
}

extension LocalizedStringKey {
    func stringValue(locale: Locale = .current) -> String {
        return .localizedString(for: self.stringKey, locale: locale)
    }
}

struct GameCalendar_Previews: PreviewProvider {
    static var previews: some View {
        GameCalendar(activeUser: user)
            .preferredColorScheme(.dark)
    }
}
