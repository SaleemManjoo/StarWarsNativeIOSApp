//
//  AllFilmsResponse.swift
//  StarWarsAppSaleem
//
//  Created by Saleem Manjoo on 2019/07/07.
//  Copyright © 2019 Saleem Manjoo. All rights reserved.
//

import Foundation

struct AllFilmsResponse: Decodable {
    let results: [Film]?
}
