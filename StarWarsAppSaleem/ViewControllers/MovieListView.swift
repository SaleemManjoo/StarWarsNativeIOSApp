//
//  ViewController.swift
//  StarWarsAppSaleem
//
//  Created by Saleem Manjoo on 2019/07/07.
//  Copyright © 2019 Saleem Manjoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var filmTableView: UITableView!
    
    var filmTableViewDelegate = FilmTableViewDelegate()
    let filmService = FilmService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true

        self.initNibs()
        self.filmTableView.delegate = self.filmTableViewDelegate
        self.filmTableView.dataSource = self.filmTableViewDelegate
        self.filmTableViewDelegate.parentNavigationController = self.navigationController
        
        filmService.getAllFilms { films in
            for var film in films {
                let imageUrl = self.filmService.getImageUrlByEpisodeId(episodeId: film.episode_id!)
                let rating = self.filmService.getRatingByEpisodeId(episodeId: film.episode_id!)
                
                film.image_url = imageUrl
                film.rating = rating
                
                self.filmTableViewDelegate.addToTableView(film: film)
            }
            
            self.filmTableView.performSelector(onMainThread: #selector(UICollectionView.reloadData), with: nil, waitUntilDone: true)
        }
    }
    
    private func initNibs() {
        filmTableView.register(UINib(nibName: "FilmCell", bundle: nil), forCellReuseIdentifier: "FilmCell")
    }
}

