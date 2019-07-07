//
//  FilmTableViewDelegate.swift
//  StarWarsAppSaleem
//
//  Created by Saleem Manjoo on 2019/07/07.
//  Copyright © 2019 Saleem Manjoo. All rights reserved.
//

import Foundation
import UIKit

class FilmTableViewDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    var films: [Film] = [Film]()
    
    var parentNavigationController: UINavigationController?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath) as! FilmCell

        let film: Film = films[indexPath.row]
        
        cell.addContent(film: film)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(120)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)

        let detailViewController: FilmDetailViewController = storyboard.instantiateViewController(withIdentifier: "FilmDetailViewController") as! FilmDetailViewController
        
        parentNavigationController?.pushViewController(detailViewController, animated: false)
    }
    
    func addToTableView(film: Film) {
        self.films.append(film)
    }
}
