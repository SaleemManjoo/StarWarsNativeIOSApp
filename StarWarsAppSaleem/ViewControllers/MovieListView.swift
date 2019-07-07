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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initNibs()
        
        self.filmTableView.delegate = filmTableViewDelegate
        self.filmTableView.dataSource = filmTableViewDelegate
    }

    private func initNibs() {
        filmTableView.register(UINib(nibName: "FilmCell", bundle: nil), forCellReuseIdentifier: "FilmCell")
    }
}

