//
//  SearchBar.swift
//  NHS Offers
//
//  Created by Dalia on 09/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    
    var placeholder: String

    class Coordinator: NSObject, UISearchBarDelegate, UITextFieldDelegate {

        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            
            searchBar.text = ""
            text = searchBar.text!
            searchBar.resignFirstResponder()
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
             
            UIApplication.shared.endEditing()
            
            return true
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchTextField.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        searchBar.showsCancelButton = true
        searchBar.barTintColor = UIColor.white
        searchBar.searchTextField.backgroundColor = UIColor.white
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
