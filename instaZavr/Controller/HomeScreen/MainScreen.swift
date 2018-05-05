//
//  MainScreen.swift
//  instaZavr
//
//  Created by kote caava on 4/30/18.
//  Copyright © 2018 gamo. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Properties
    fileprivate var dataSource = [MovieObject]()
    let number: CGFloat = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFirstElements()
        self.tableView.reloadData()
    }
    //    private func fetchData () {
    //        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
    //            self?.loadFirstElements()
    //            DispatchQueue.main.async {
    //                self?.tableView.delegate = self
    //                self?.tableView.dataSource = self
    //                self?.tableView.reloadData()
    //            }
    //        }
    //    }
    // MARK: - FUN
    
    fileprivate func loadFirstElements () {
        for i in 1..<20 {
            let object = MovieObject()
            object.image = UIImage(named: "\(Int(arc4random_uniform(4)))")
            object.name = "konstantine tsaava\(i)"
            object.description = "asdasdasdadasdasdasdas"
            object.profilePic = UIImage(named: "\(Int(arc4random_uniform(4)))")
            self.dataSource.append(object)
        }
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    //    private func dummyDataGeneratorForFunAndOnlyTodayAndNeverAgain () {
    //        for i in 0..<200000 {
    //
    //            let object = MovieObject()
    ////            object.description = "Moulin Rouge is a cabaret in Paris, France. The original house, which burned down in 1915, was co-founded in 1889 by Charles Zidler and Joseph Oller, who also owned the Paris Olympia."
    ////            object.image = UIImage(named: "test_\(Int(arc4random_uniform(8)))")
    ////            object.name = "\(i) Moulin Rouge - Cabaret in Paris"
    //
    //            self.dataSource.append(object)
    //        }
    //    }
    // MARK: - Actions
}

extension MainScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "xxxMainScreenCell", for: indexPath) as! MainScreenCell
        
        let object = dataSource[indexPath.row]
        
        
        cell.imgProfPic.image = object.profilePic
        cell.lblNameOfUser.text = object.name
        cell.imgContentImage.image = object.image
        cell.lblDescOfUser.text = object.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "xxxDetailScreen") as! DetailScreen
        vc.dataObject = self.dataSource[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
extension MainScreen: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vcb = storyboard?.instantiateViewController(withIdentifier: "xxxStoryView") as! StoryView
        vcb.dataObject = self.dataSource[indexPath.row]
        
        navigationController?.pushViewController(vcb, animated: true)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellb = collectionView.dequeueReusableCell(withReuseIdentifier: "xxxCollectionViewCell", for: indexPath) as! CollectionViewCell
        
        let objectb = dataSource[indexPath.row]
        
        cellb.imgNewStory.image = objectb.profilePic
        
        return cellb
        
    }
}


