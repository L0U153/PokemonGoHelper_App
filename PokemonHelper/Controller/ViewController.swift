//
//  ViewController.swift
//  Triplanner
//
//  Created by Student on 5/4/20.
//  Copyright © 2020 Louise Lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //variable
    private var model = PokemonModel.shared
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        print("app started")
        super.viewDidLoad()
        
        //searchTextField.delegate = self as! UITextFieldDelegate
        // Do any additional setup after loading the view.
        titleLabel.text=NSLocalizedString("Pokemon Helper",comment: "")
        searchTextField.text=""
        searchTextField.placeholder=NSLocalizedString("Pokemon Name",comment: "")
        searchButton.setTitle(NSLocalizedString("Search", comment: ""), for: .normal)
        searchButton.isEnabled=false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(userDidTapped))
        view.addGestureRecognizer(tap)
        searchTextField.becomeFirstResponder()
       
    }
    
    @objc func userDidTapped(){
        searchTextField.resignFirstResponder()
    }
    @IBAction func searchOnTap(_ sender: Any) {
        
        if let id=searchValidation(){
            model.currentIndex=id
            searchTextField.text=""
        }
        else{
            //stop
        }
        
    }
    
    @IBAction func editTextField(_ sender: Any) {
        searchTextField.becomeFirstResponder()
        if let content=searchTextField.text{
            if content != ""{
                searchButton.isEnabled=true
            }
            else{
                searchButton.isEnabled=false
            }
        }
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
    
    
    func searchValidation()->Int?{
        
        //to do
        return nil
    }
    
}

