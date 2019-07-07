//
//  FilmCell.swift
//  StarWarsAppSaleem
//
//  Created by Saleem Manjoo on 2019/07/07.
//  Copyright © 2019 Saleem Manjoo. All rights reserved.
//

import UIKit

class FilmCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var producersLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func addContent(film: Film) {
        titleLabel.text = film.title
        releaseDateLabel.text = film.release_date
        directorLabel.text = film.director
        producersLabel.text = film.producer
        
        if (film.image_url != nil) {
            let url = URL(string: film.image_url!)
            
            //asynchronously add images from urls
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.posterImageView.image = UIImage(data: data!)
                }
            }
        }
    }
}
