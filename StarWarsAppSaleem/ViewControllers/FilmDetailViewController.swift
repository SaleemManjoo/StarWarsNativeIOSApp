//
//  FilmDetailViewController.swift
//  StarWarsAppSaleem
//
//  Created by Saleem Manjoo on 2019/07/07.
//  Copyright © 2019 Saleem Manjoo. All rights reserved.
//

import Foundation
import UIKit

class FilmDetailViewController: ParentViewController {
    var film: Film!
    
    let filmService = FilmService()
    
    var characters = [String]()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var charactersLabel: UILabel!
    @IBOutlet weak var crawlingTextLabel: UILabel!
    
    @IBOutlet weak var detailTextView: UIView!
    @IBOutlet weak var crawlingTextView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.titleLabel.text = self.film.title
        self.releaseDateLabel.text = self.film.release_date
        self.charactersLabel.text = ""
        
        startSpinner()
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let group = DispatchGroup()
            
            group.enter()
            self.filmService.getCharacterNames(characterUrls: self.film.characters!) { chars in
                self.characters = chars
                group.leave()
            }
            
            group.wait()
            
            self.charactersLabel.text = self.createCharactersString(characters: self.characters)
            self.charactersLabel.sizeToFit()
            
            self.initializeOpeningCrawl()
            self.animateOpeningCrawl()
            
            self.stopSpinner()
        }
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
    
    private func initializeOpeningCrawl() {
        crawlingTextLabel.text = film.opening_crawl
        crawlingTextLabel.sizeToFit()
        
        let transformLayer = CATransformLayer()
        var perspective = CATransform3DIdentity
        perspective.m34 = -1 / 500
        transformLayer.transform = perspective
        
        transformLayer.addSublayer(crawlingTextView.layer)
        self.view.layer.addSublayer(transformLayer)
        
        crawlingTextView.layer.transform = CATransform3DMakeRotation(1.5, 1, 0, 0)
        
        crawlingTextLabel.center.x = self.view.center.x - 50
        crawlingTextLabel.center.y = self.view.center.y + (crawlingTextLabel.bounds.size.height / 1.8)
        
    }
    
    private func animateOpeningCrawl() {
        UIView.animate(withDuration: 60) {
            self.crawlingTextLabel.center.y = self.crawlingTextView.bounds.height - (self.crawlingTextLabel.bounds.height * 4)
        }
    }
}
