//
//  PokemonDataModel.swift
//  Pokemon Helper
//
//  Created by Student on 5/4/20.
//  Copyright © 2020 Louise Lu. All rights reserved.
//

import Foundation

protocol PokemonsDataModel {
    func getPokemons()->[Pokemon]
    //func getPokemon(_ name:String)->Pokemon
    func toggleFavorite()
    func favoritePokemons() -> [Pokemon]
    //func getCurrentPokemon()->Pokemon?
    
}
