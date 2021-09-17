//
//  DetailViewController.swift
//  Pokemon Helper
//
//  Created by Student on 5/4/20.
//  Copyright © 2020 Louise Lu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    private var model = PokemonModel.shared
    //variable
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var abilityLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var shareBarButton: UIBarButtonItem!
    
    var pokemonId:String?
    var poke:Pokemon?
    var navTitleText: String=NSLocalizedString("Detail", comment: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("detail")
        // Do any additional setup after loading the view.
        //localization
        nameLabel.text=NSLocalizedString("Name: ",comment: "")
    pokedexLabel.text=NSLocalizedString("Pokedex: ",comment: "")
        typeLabel.text=NSLocalizedString("Type: ",comment: "")
    abilityLabel.text=NSLocalizedString("Ability: ",comment: "")
        //if the pokemon exist, set up information in this page
        
        if let id=(pokemonId as NSString?)?.integerValue{
            poke=model.getPokemons()[id]
            if let temp=poke{
                nameLabel.text="\(NSLocalizedString("Name: ",comment: ""))\(temp.name)"
                
                pokedexLabel.text="\(NSLocalizedString("Pokedex: ",comment: ""))\(temp.id)"
                
                for j in temp.types{
                    typeLabel.text?.append(contentsOf: "\(j.type.name) ")
                }
                
                
                for j in temp.abilities{
                    abilityLabel.text?.append(contentsOf: "\(j.ability.name) ")
                }
                
                if temp.liked{
                    likeButton.setTitle(NSLocalizedString("Unlike",comment: ""), for: .normal)
                }
                else{
                    likeButton.setTitle(NSLocalizedString("Like",comment: ""), for: .normal)
                }
            }
            else{
                print("Pokemon doesn't exist")
                //fix here
                //exit(1)
                
            }

        }
        else{
            print("Invalid Id")
        }
        navBar.title=navTitleText
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func likeButtonTapped(_ sender: Any) {
        model.toggleFavorite()
    }
    
    @IBAction func shareIsTapped(_ sender: Any) {
        //share to twitter/facebook/message
        let tweetText = "Come check out my Pokemon \(nameLabel.text!)!\n"

        let shareString = "https://twitter.com/intent/tweet?text=\(tweetText)"

        // encode a space
        let escapedShareString = shareString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!

        // cast to an url
        let url = URL(string: escapedShareString)

        // open in safari
        UIApplication.shared.openURL(url!)
    }
    
    @IBAction func cancelIsTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
