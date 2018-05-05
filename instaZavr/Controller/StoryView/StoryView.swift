//
//  StoryView.swift
//  instaZavr
//
//  Created by kote caava on 5/4/18.
//  Copyright © 2018 gamo. All rights reserved.
//

import UIKit

class StoryView: UIViewController {

    
    @IBOutlet weak var imgStoryView: UIImageView!
    // MARK: - Properties
    fileprivate var dataSource = [MovieObject]()
    
    // MARK: - Properties
    var dataObject: MovieObject?
    // MARK: - Properties
    var mainScreen: MainScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgStoryView.image = dataObject?.profilePic


    }


    @IBAction func leftBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)

    }
    @IBAction func rightBtnTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "xxxStoryView") as! StoryView
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
