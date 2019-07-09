//
//  FilmDetailViewController.swift
//  StarWarsAppSaleem
//
//  Created by Saleem Manjoo on 2019/07/07.
//  Copyright © 2019 Saleem Manjoo. All rights reserved.
//

import Foundation
import UIKit

class FilmDetailViewController: UIViewController {
    var film: Film!
    
    let filmService = FilmService()
    
    var characters = [String]()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var charactersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = film.title
        releaseDateLabel.text = film.release_date
        
        let group = DispatchGroup()
        
        group.enter()
        filmService.getCharacterNames(characterUrls: film.characters!) { chars in
            self.characters = chars
            group.leave()
        }
        
        group.wait()
        
        charactersLabel.text = createCharactersString(characters: self.characters)
        charactersLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        
        charactersLabel.adjustsFontSizeToFitWidth = true

        charactersLabel.sizeToFit()
        charactersLabel.adjustsFontSizeToFitWidth = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        charactersLabel.sizeToFit()

    }
    
    private func createCharactersString(characters: [String]) -> String{
        var charactersString = ""
        
        for character in characters {
            if(character == characters[0]) {
                charactersString = character
            } else {
                charactersString = charactersString + ", " + character
            }
        }
        
        return charactersString
    }
}
