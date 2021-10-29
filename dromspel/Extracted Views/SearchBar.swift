//
//  SearchBar.swift
//  dromspel
//
//  Created by lucas on 28/10/2021.
//

import SwiftUI

struct SearchBar: View {
    @Binding var binding: String
    
    @State private var isEditing: Bool = false
    
    var body: some View {
        /*if #available(iOS 15.0, *) {
            Text("YOLO")
                .searchable(text: $binding)
        } else {
            Text("TEST")
        }*/
        HStack {
            TextField("Search ...", text: $binding)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
            }
                .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
         
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.binding = ""
                }) {
                    Text("Cancel")
                }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
            }
        }
        .overlay(
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8)
            }
        )
    }
}

extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window = windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true // set to `false` if you don't want to detect tap during other gestures
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(binding: .constant(""))
    }
}
