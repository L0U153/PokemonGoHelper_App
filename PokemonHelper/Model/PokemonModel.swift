//
//  PokemonModel.swift
//  Pokemon Helper
//
//  Created by Student on 5/4/20.
//  Copyright © 2020 Louise Lu. All rights reserved.
//

import Foundation

class PokemonModel:NSObject,PokemonsDataModel{

    
    private var fileLocation: URL!
    
    var currentIndex:Int?

    private let BASE_URL = "https://pokeapi.co/api/v2/"
    static let shared = PokemonModel()
    let LOADED_COUNT=10
    
    var pokemons = [Pokemon]()
    var name:String?
    var id:Int?
    var enterMethod:String?
    
    
    
    override init() {
        //print("PokemonModel\n")
        super.init()
        
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
         fileLocation = documentsDirectory.appendingPathComponent("pokemons.json")
        //print("\(fileLocation)\n")
        if FileManager.default.fileExists(atPath: fileLocation.path){
            print("find file")
            NSObject.self.load()
        }
        else{
            //print("call API\n")
            for i in 1...LOADED_COUNT{
            getPokemonAPI(i, onSuccess: {(pokemon) in
                DispatchQueue.main.async{
                print("loading api")
                    self.pokemons.append(pokemon)
                }           
            })
                print(self.pokemons.count)
                print(self.getPokemons().count)
            
            self.pokemons.sort{ $0.id < $1.id }
            self.save()
            }
            
        }
    }
    

    
    func getPokemonAPI(_ dex:Int, onSuccess: @escaping (Pokemon) -> Void) {
       
        if let url = URL(string: "\(BASE_URL)pokemon/\(dex)"){
                URLSession.shared.dataTask(with: url,completionHandler: {(data, response, error) in
                    if let data = data{
                        guard let json=(try? JSONSerialization.jsonObject(with:data,options:JSONSerialization.ReadingOptions.mutableContainers)) as? [String:Any] else{
                            print("no json data")
                            return
                        }
                        //load json data into pokemon struct
                        if let id=json["id"],let name=json["name"]{
                            //temp=Pokemon.init("\(id)",name as! String)
                             print("\(id) \(name)")
                            
                            //load types
                            if let types=json["types"] as? [String:Any]{
                                for i in 0..<types.count{
                                    if let type1=types["\(i)"] as? [String:Any]{
                                        if let type2=type1["type"] as? [String:Any]{
                                            if let typeName=type2["name"] as? String {
                                                //temp?.addType(typeName)
                                                
                                            }
                                        }
                                    }
                                }
                            }
                                //load abilities
                            if let abilities=json["abilities"] as? NSDictionary{
                                for i in 0..<abilities.count{
                                    if let ability1=abilities["\(i)"] as? [String:Any]{
                                        if let ability2=ability1["type"] as? [String:Any]{
                                            if let abilityName=ability2["name"] as? String {
                                                //temp?.addAbility(abilityName)
                                                
                                            }
                                        }
                                    }
                                }
                            }
                            
                        }
                        
                    }
             }).resume()
        }
        
        
        
        
//        for i in 1...5{
//            var temp:Pokemon?
//            if let url = URL(string: "\(BASE_URL)pokemon/\(i)"){
//                    URLSession.shared.dataTask(with: url,completionHandler: {(data, response, error) in
//                        if let Data = data{
//                            guard let json=(try? JSONSerialization.jsonObject(with:Data,options:JSONSerialization.ReadingOptions.mutableContainers)) as? [String:Any] else{
//                                print("no json data")
//                                return
//                            }
//                            //load json data into pokemon struct
//                            if let id=json["id"],let name=json["name"]{
//                                //var temp=Pokemon.init("\(id)",name as! String)
//                                print("\(id) \(name)\n")
//
//                            //load types
//                            if let types=json["types"] as? [String:Any]{
//                                print("a")
//                                for n in 0..<types.count{
//                                    if let type1=types["\(n)"] as? [String:Any]{
//                                        print("b")
//                                        if let type2=type1["type"] as? [String:Any]{
//                                            print("c")
//                                            if let typeName=type2["name"] as? String {
//
//                                                print("type")
//                                            }
//                                        }
//                                    }
//                                }
//                            }
//                                //load abilities
//                                if let abilities=json["abilities"] as? [String:Any]{
//                                    for n in 0..<abilities.count{
//                                        if let ability1=abilities["\(n)"] as? [String:Any]{
//                                            if let ability2=ability1["type"] as? [String:Any]{
//                                                if let abilityName=ability2["name"] as? String {
//                                                    //temp.addAbility(abilityName)
//                                                    print("Ability")
//                                                }
//                                            }
//                                        }
//                                    }
//                                }
//
//                                self.pokemons.append(temp)
//                                // print("\(self.pokemons.count)\n")
//                            }
//
//                        }
//                 }).resume()
//
//            }
//        }
//        self.pokemons.sort{ $0.id < $1.id }
//        self.save()
//    }




//        var fillingStr:String="1"
//        if enterMethod=="search"{
//            fillingStr=name
//        }
//        else if enterMethod=="browse"{
//            fillingStr="\(String(describing: id))"
//        }
//        if let url = URL(string: "\(BASE_URL)pokemon/\(fillingStr)"){
//        let urlRequest = URLRequest(url: url)
//            //urlRequest.setValue("Client-ID \(ACCESS_KEY)", forHTTPHeaderField: "Authorization")
//            URLSession.shared.dataTask(with: urlRequest, completionHandler: {(data, response, error) in
//                if let data = data{
//                    // We have data!!!
//                    do{
//                        let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
//                        print("This pokemon is \(pokemon.name).\n")
//                        onSuccess(pokemon)
//
//
//                    } catch {
//                        print(error)
//                    }
//                }
//                }).resume()
//        }
//    }
    }
        
        
        
        
        
    
    func searchPokemon(_ name:String,onSuccess: @escaping () -> Void)->Pokemon?{
        var temp:Pokemon?
        if let url = URL(string: "\(BASE_URL)pokemon/\(name)"){
                URLSession.shared.dataTask(with: url,completionHandler: {(data, response, error) in
                    if let data = data{
                        guard let json=(try? JSONSerialization.jsonObject(with:data,options:JSONSerialization.ReadingOptions.mutableContainers)) as? [String:Any] else{
                            print("no json data")
                            return
                        }
                        //load json data into pokemon struct
                        if let id=json["id"],let name=json["name"]{
                            //temp=Pokemon.init("\(id)",name as! String)
                           
                            //load types
                            if let types=json["types"] as? [String:Any]{
                                for i in 0..<types.count{
                                    if let type1=types["\(i)"] as? [String:Any]{
                                        if let type2=type1["type"] as? [String:Any]{
                                            if let typeName=type2["name"] as? String {
                                                //temp?.addType(typeName)
                                                
                                            }
                                        }
                                    }
                                }
                            }
                                //load abilities
                            if let abilities=json["abilities"] as? NSDictionary{
                                for i in 0..<abilities.count{
                                    if let ability1=abilities["\(i)"] as? [String:Any]{
                                        if let ability2=ability1["type"] as? [String:Any]{
                                            if let abilityName=ability2["name"] as? String {
                                                //temp?.addAbility(abilityName)
                                                
                                            }
                                        }
                                    }
                                }
                            }
                            
                        }
                        
                    }
             }).resume()
        }
        return temp ?? nil
        }


    func getPokemons()->[Pokemon]{
        return PokemonModel.shared.pokemons
    }
    
    func toggleFavorite() {
        if let index=currentIndex{
            if pokemons[index].liked{
                pokemons[index].liked=false
            }
            else{
                pokemons[index].liked=true
            }
            save()
        }
    }
    
    func favoritePokemons() -> [Pokemon] {
        var favPokemon=[Pokemon]()
        for i in pokemons{
            if i.liked{
                favPokemon.append(i)
            }
        }
        return favPokemon
    }
    
//    func getCurrentPokemon()->Pokemon?{
//        if let index=currentIndex{
//            if index>=0&&index<pokemons.count{
//            return pokemons[index]
//            }
//        }
//            return nil
//    }
    
    func load(){
         do {
             let data = try Data(contentsOf: fileLocation)
            let decoder = JSONDecoder()
            pokemons = try decoder.decode([Pokemon].self, from: data)
         } catch{
             print("err \(error)")
         }
     }
    
    func save(){
        do{
            let encoder = JSONEncoder()
            let data = try encoder.encode(pokemons)
            let jsonString = String(data: data, encoding: .utf8)!
            try jsonString.write(to: fileLocation, atomically: true, encoding: .utf8)
        } catch{
            print("err \(error)")
        }
    }
}


