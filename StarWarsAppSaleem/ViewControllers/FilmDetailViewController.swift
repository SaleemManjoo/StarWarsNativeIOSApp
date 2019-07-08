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
    
    var charactersString = ""
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var charactersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        titleLabel.text = film.title
        releaseDateLabel.text = film.release_date
        
        let group = DispatchGroup()
        
        group.enter()
        filmService.getCharactersString(characterUrls: film.characters!) { characters in
            self.charactersString = characters
            group.leave()
        }
        
        group.wait()
        charactersLabel.text = charactersString
    }
    
}
