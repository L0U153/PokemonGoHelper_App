//
//  Pokemon.swift
//  Pokemon Helper
//
//  Created by Student on 5/4/20.
//  Copyright © 2020 Louise Lu. All rights reserved.
//

import Foundation

struct pokemonAbilities:Equatable,Decodable,Encodable{
    let ability:pokemonAbility
    let slot:Int
    let is_hidden:Bool

}

struct pokemonTypes:Equatable,Decodable,Encodable{
    let type:pokemonType
    let slot:Int
}

struct pokemonType:Equatable,Decodable,Encodable{
    let name:String
    let url:String    
}

struct pokemonAbility:Equatable,Decodable,Encodable{
    let name:String
    let url:String
}

struct form:Equatable,Decodable,Encodable{
    let name:String
    let url:String
}

struct game_indice:Equatable,Decodable,Encodable{
    let version:[Version]
    let game_index:Int
}

struct Item:Equatable,Decodable,Encodable{
    let name:String
    let url:String
}

struct version_detail:Equatable,Decodable,Encodable{
    let rarity:Int
    let version:game_Version
}

struct game_Version:Equatable,Decodable,Encodable{
    let name:String
    let url:String
}

struct held_item:Equatable,Decodable,Encodable{
    let item:Item
    let version_details:[version_detail]
}

struct Version:Equatable,Decodable,Encodable{
    let name:String
    let url:String
}

struct move:Equatable,Decodable,Encodable{
    let name:String
    let url:String
}

struct Species:Equatable,Decodable,Encodable{
    let name:String
    let url:String
}

struct Stat:Equatable,Decodable,Encodable{
    let name:String
    let url:String
}

struct Stats:Equatable,Decodable,Encodable{
    let base_stat:Int
    let effort:Int
    let stat:Stat
}



struct Sprites:Equatable,Decodable,Encodable{
    let back_default:String
    let back_female:String
    let back_shiny:String
    let back_shiny_female:String
    let front_default:String
    let front_female:String
    let front_shiny:String
    let front_shiny_female:String
}

struct Pokemon:Equatable,Decodable,Encodable{

    let abilities:[pokemonAbilities]
    let base_experience:Int?
    let forms:[form]?
    let game_indices:[game_indice]?
    let height:Int
    let held_items:[held_item]?
    let id:Int
    let is_default:Bool?
    let location_area_encounters:String?
    let moves:[move]?
    let name:String
    let species:[Species]?
    let sprites:[Sprites]?
    let stats:[Stats]?
    let types:[pokemonTypes]
    let weight:Int?
    
    public var liked:Bool=false
    
//    enum CodingKeys: String, CodingKey {
//        case abilities = "abilities"
//        case ability="ability"
////        case base_experience = "base_experience"
////        case forms = "forms"
////        case game_indices = "game_indices"
////        case height = "height"
////        case held_items = "held_items"
//        case id = "id"
////        case is_default = "is_default"
////        case location_area_encounters = "location_area_encounters"
////        case moves = "moves"
//        case name = "name"
////        case species = "species"
////        case sprites = "sprites"
////        case stats = "stats"
//        case types = "types"
//        case type="type"
////        case weight = "weight"
//    }
    
    
    
//    init(from decoder: Decoder) throws {
//           let container = try decoder.container(keyedBy: CodingKeys.self)
//           id = try container.decode(Int.self, forKey: .id)
//           name = try container.decode(String.self, forKey: .name)
//           let Abilities = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .abilities)
//        for i in 0..<Abilities.count
//        {
//            let ability = try abilities.decode(pokemonAbility.self, forKey: .ability)
//        }
//           
//           
////           let additionalInfo = try values.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .additionalInfo)
////           elevation = try additionalInfo.decode(Double.self, forKey: .elevation)
//       }
}



