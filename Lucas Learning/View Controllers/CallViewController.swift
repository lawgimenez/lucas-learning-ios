//
//  CallViewController.swift
//  Lucas Learning
//
//  Created by Lawrence Gimenez on 11/28/21.
//

import UIKit

class CallViewController: UIViewController {
    
    @IBOutlet weak var callCollectionView: UICollectionView!
    private let arrayContacts: [Contact] = [
        Contact(name: "Ma Moms", speechName: "Mama", image: UIImage(named: "MaMoms")),
        Contact(name: "Lucas", speechName: "Lucas", image: UIImage(named: "Bimbim")),
        Contact(name: "Pa Pops", speechName: "Papa", image: UIImage(named: "PaPops"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callCollectionView.dataSource = self
    }
}

extension CallViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayContacts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let callCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "call", for: indexPath) as! CallCollectionViewCell
        callCollectionViewCell.avatarImageView.image = arrayContacts[indexPath.row].image
        callCollectionViewCell.nameLabel.text = arrayContacts[indexPath.row].name
        return callCollectionViewCell
    }
}
