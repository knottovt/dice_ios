//
//  ViewController.swift
//  Dice
//
//  Created by Visarut Tippun on 29/12/2562 BE.
//  Copyright © 2562 Visarut Tippun. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    @IBOutlet weak var diceImageViewThree: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var prevSum: UILabel!
    
    var isReset = false
    let imageName = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rollButton.layer.cornerRadius = 8
        self.reset()
        
    }
    
    
    @IBAction func didTapRollButton(_ sender: UIButton) {
        self.isReset = false
        let one = randomNumber()
        let two = randomNumber()
        let three = randomNumber()
        self.setDice(one, two, three)
    }
    
    @IBAction func didTapResetButton(_ sender: UIButton) {
        self.reset()
    }
    
    func randomNumber() -> Int {
        return Int.random(in: 1...6)
    }
    
    
    func reset() {
        self.isReset = true
        self.setDice(4, 4, 4)
    }
    
    func setDice(_ one:Int, _ two: Int, _ three: Int) {
        let sum = one + two + three
        
        if self.isReset {
            self.sumLabel.text = "Let Roll!"
            self.prevSum.text = "Prev: - "
        } else {
            if self.sumLabel.text == "Let Roll!" {
                self.prevSum.text = "Prev: - "
            } else {
                self.prevSum.text = "Prev: " + (self.sumLabel.text ?? "-")
            }
            
            self.sumLabel.text = String(sum)
        }
        
        self.diceImageViewOne.image = UIImage(named: imageName[one - 1])
        self.diceImageViewTwo.image = UIImage(named: imageName[two - 1])
        self.diceImageViewThree.image = UIImage(named: imageName[three - 1])
    }
}

