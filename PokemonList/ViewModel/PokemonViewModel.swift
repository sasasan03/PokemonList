//
//  PokemonViewModel.swift
//  PokemonList
//
//  Created by sako0602 on 2023/03/27.
//

import SwiftUI


final class PokemonViewModel: ObservableObject, Identifiable {
    //リスト表示するためのインスタンス
    @Published var pokemons: [Pokemon] = [Pokemon]()
    
//    init(){
//        loadPokemons()
//    }
    //取得してきたデータをpokemonsへ格納するメソッド。
    func loadPokemons() {
        let pokeAPIClient = PokeAPIClient()
        print("a")
        pokeAPIClient.fetch { [weak self] result in
            switch result {
            case .success(let pokemon):
                self?.pokemons.append(pokemon)
            case .failure(let error):
                print(error)
            }
        }
    }
}
