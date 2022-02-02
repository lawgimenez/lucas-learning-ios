//
//  HomeViewController.swift
//  Lucas Learning
//
//  Created by Lawrence Gimenez on 11/27/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func callTapped(_ sender: UIButton) {
    }

    @IBAction func alphabetTapped(_ sender: UIButton) {
        let alphabetViewController = storyboard?.instantiateViewController(withIdentifier: "alphabet") as! AlphabetViewController
        navigationController?.pushViewController(alphabetViewController, animated: true)
    }
    
    @IBAction func numbersTapped(_ sender: UIButton) {
        let numbersViewController = storyboard?.instantiateViewController(withIdentifier: "numbers") as! NumbersViewController
        navigationController?.pushViewController(numbersViewController, animated: true)
    }
    
}
