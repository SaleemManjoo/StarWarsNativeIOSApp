//
//  ParentViewController.swift
//  StarWarsAppSaleem
//
//  Created by Saleem Manjoo on 2019/07/09.
//  Copyright © 2019 Saleem Manjoo. All rights reserved.
//

import Foundation
import UIKit

class ParentViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style: .whiteLarge)
    
    func stopSpinner() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.spinner.removeFromSuperview()
        }
    }
    
    func startSpinner() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
