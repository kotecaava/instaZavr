//
//  DetailScreen.swift
//  instaZavr
//
//  Created by kote caava on 4/30/18.
//  Copyright © 2018 gamo. All rights reserved.
//

import UIKit

class DetailScreen: UIViewController {
   
    @IBOutlet weak var lblTitle: UILabel!
    
    
    // MARK: - Properties
    var dataObject: MovieObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = dataObject?.name

    }

}
