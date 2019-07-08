//
//  Swapi.swift
//  StarWarsAppSaleem
//
//  Created by Saleem Manjoo on 2019/07/07.
//  Copyright © 2019 Saleem Manjoo. All rights reserved.
//

import Foundation

class Swapi {
    private let baseURL = "https://swapi.co/api/"
    
    func getFilms(completionHandler: @escaping (_ films: AllFilmsResponse)->Void) {
        let resource = "films"
        let urlString = baseURL + resource

        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                let allFilmsResponse = try JSONDecoder().decode(AllFilmsResponse.self, from: data!)
                
                _ = completionHandler(allFilmsResponse)
            } catch { return }
        }.resume()
    }
    
    func getCharacterByUrl(urlString: String, completionHandler: @escaping (_ person: Person)->Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                let person = try JSONDecoder().decode(Person.self, from: data!)
                
                _ = completionHandler(person)
            } catch { return }
        }.resume()
    }
}
