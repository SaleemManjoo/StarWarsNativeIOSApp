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
        
        self.initNibs()
        self.filmTableView.delegate = self.filmTableViewDelegate
        self.filmTableView.dataSource = self.filmTableViewDelegate
        
        filmService.getAllFilms { films in
            self.filmTableViewDelegate.setDataSource(f: films)
            
            self.filmTableView.performSelector(onMainThread: #selector(UICollectionView.reloadData), with: nil, waitUntilDone: true)
        }
    }

    
    private func initNibs() {
        filmTableView.register(UINib(nibName: "FilmCell", bundle: nil), forCellReuseIdentifier: "FilmCell")
    }
}

