//
//  EventRoot.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI

struct EventRoot: View {

    var body: some View {

        NavigationView {

            ScrollView  {

                ForEach(events){event in

                    VStack{

                        NavigationLink(destination: EventScreen(event: event),
                                       label:{
                            ListEventRow(event: event)
                        })
                    }
                }
                .navigationBarTitle("Events")

            }

        }
    }
}
