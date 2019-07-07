//
//  Film.swift
//  StarWarsAppSaleem
//
//  Created by Saleem Manjoo on 2019/07/07.
//  Copyright © 2019 Saleem Manjoo. All rights reserved.
//

import Foundation

struct Film : Decodable{
    let title: String?
    let release_date: String?
    let producer: String?
    let director: String?
    let episode_id: Int?
    var rating: Float?
    var image_url: String?
}
