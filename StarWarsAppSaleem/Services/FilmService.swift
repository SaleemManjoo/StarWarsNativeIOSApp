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
    
    func getCharacterNames(characterUrls: [String], completionHandler: @escaping ([String]) -> Void) {
        var characters = [String]()
        
        let group = DispatchGroup()
        
        for characterUrl in characterUrls {
            group.enter()
            
            swapi.getCharacterByUrl(urlString: characterUrl) { person in
                let name = person.name!
                
                characters.append(name)
                group.leave()
            }
        }
        
        group.wait()
        completionHandler(characters)
    }

    func getRatingByEpisodeId(episodeId: Int) -> Float{
        switch episodeId {
        case 1:
            return 6.5
        case 2:
            return 6.6
        case 3:
            return 7.6
        case 4:
            return 8.6
        case 5:
            return 8.7
        case 6:
            return 8.3
        case 7:
            return 8.0
        default:
            return 0
        }
    }
    
    func getImageUrlByEpisodeId(episodeId: Int) -> String {
        switch episodeId {
        case 1:
            return "https://m.media-amazon.com/images/M/MV5BYTRhNjcwNWQtMGJmMi00NmQyLWE2YzItODVmMTdjNWI0ZDA2XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_UX182_CR0,0,182,268_AL_.jpg"
        case 2:
            return "https://m.media-amazon.com/images/M/MV5BMDAzM2M0Y2UtZjRmZi00MzVlLTg4MjEtOTE3NzU5ZDVlMTU5XkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_SY999_CR0,0,659,999_AL_.jpg"
        case 3:
            return "https://m.media-amazon.com/images/M/MV5BNTc4MTc3NTQ5OF5BMl5BanBnXkFtZTcwOTg0NjI4NA@@._V1_UY268_CR9,0,182,268_AL_.jpg"
        case 4:
            return "https://m.media-amazon.com/images/M/MV5BNzVlY2MwMjktM2E4OS00Y2Y3LWE3ZjctYzhkZGM3YzA1ZWM2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX182_CR0,0,182,268_AL_.jpg"
        case 5:
            return "https://m.media-amazon.com/images/M/MV5BYmU1NDRjNDgtMzhiMi00NjZmLTg5NGItZDNiZjU5NTU4OTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX182_CR0,0,182,268_AL_.jpg"
        case 6:
            return "https://m.media-amazon.com/images/M/MV5BOWZlMjFiYzgtMTUzNC00Y2IzLTk1NTMtZmNhMTczNTk0ODk1XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_UX182_CR0,0,182,268_AL_.jpg"
        case 7:
            return "https://m.media-amazon.com/images/M/MV5BOTAzODEzNDAzMl5BMl5BanBnXkFtZTgwMDU1MTgzNzE@._V1_UX182_CR0,0,182,268_AL_.jpg"
        default:
            return ""
        }
    }
}
