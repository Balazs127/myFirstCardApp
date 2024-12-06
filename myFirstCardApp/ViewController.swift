//
//  ViewController.swift
//  myFirstCardApp
//
//  Created by Kis, Balazs on 06/12/2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewCards()
        // Do any additional setup after loading the view.
    }
    
    let faces: [String] = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king", "ace"]
    
    let suits: [String] = ["spades", "hearts", "diamonds", "clubs"]
    
    let values: [Int] = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 1]
    
    @IBOutlet weak var firstCard: UIImageView!
    
    @IBOutlet weak var secondCard: UIImageView!
    
    var cardsValue = 0
    var higherOrLower = 0
    
    @IBOutlet weak var cardsValueLabel: UILabel!
    @IBOutlet weak var playerScore: UILabel!
    var playerScoreValue = 0
    
    @IBAction func higherButton(_ sender: Any) {
        if (cardsValue >= higherOrLower) {
            playerScoreValue += 1
        } else {
            playerScoreValue = 0
        }

        NewCards()
    }
    
    @IBAction func lowerButton(_ sender: Any) {
        if (cardsValue <= higherOrLower) {
            playerScoreValue += 1
        } else {
            playerScoreValue = 0
        }
        
        NewCards()
    }
    
    func NewCards() {
        playerScore.text = String(playerScoreValue)
        cardsValue = 0
        higherOrLower = Int.random(in: 2..<20)
        print(higherOrLower)
        var randomFace = Int.random(in: 0..<faces.count)
        
        var face = faces[randomFace]
        var suit = suits.randomElement()!
        firstCard.image = UIImage(named: "\(face)_of_\(suit)")
    
        cardsValue += values[randomFace]
        
        randomFace = Int.random(in: 0..<faces.count)
        
        face = faces[randomFace]
        suit = suits.randomElement()!
        secondCard.image = UIImage(named: "\(face)_of_\(suit)")
        
        cardsValue += values[randomFace]
        
        cardsValueLabel.text = String(cardsValue)
    }
    
}
