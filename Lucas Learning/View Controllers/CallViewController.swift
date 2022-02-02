//
//  CallViewController.swift
//  Lucas Learning
//
//  Created by Lawrence Gimenez on 11/28/21.
//

import UIKit

class CallViewController: UIViewController {
    
    @IBOutlet weak var callCollectionView: UICollectionView!
//    private let arrayContacts: [Contact] = [
//        Contact(
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callCollectionView.dataSource = self
    }
}

extension CallViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let callCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "call", for: indexPath) as! CallCollectionViewCell
        return callCollectionViewCell
    }
}
