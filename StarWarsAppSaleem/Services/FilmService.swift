//
//  FilmService.swift
//  StarWarsAppSaleem
//
//  Created by Saleem Manjoo on 2019/07/07.
//  Copyright © 2019 Saleem Manjoo. All rights reserved.
//

import Foundation

class FilmService {
    
    let swapi = Swapi()
    
    func getAllFilms(completionHandler: @escaping ([Film])->Void) {
        swapi.getFilms(completionHandler: { (allFilmsResponse) in
            let films = allFilmsResponse.results
            
            completionHandler(films!)
        })
    }
    
}
