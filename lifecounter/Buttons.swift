//
//  Buttons.swift
//  lifecounter
//
//  Created by Leah on 4/17/24.
//

import Foundation

extension ViewController {

    @IBAction func player1plus1(_ sender: Any) {
        print("player1plus1")
        if let lifeText = label1.text {
            let components = lifeText.components(separatedBy: ":")
            if components.count == 2, let currentLife = Int(components[1].trimmingCharacters(in: .whitespaces)) {
                let newLife = currentLife + 1
                label1.text = "Player 1 life: \(newLife)"
            }
        }
    }
    @IBAction func player1plus5(_ sender: Any) {
        print("player1plus5")
        if let lifeText = label1.text {
            let components = lifeText.components(separatedBy: ":")
            if components.count == 2, let currentLife = Int(components[1].trimmingCharacters(in: .whitespaces)) {
                let newLife = currentLife + 5
                label1.text = "Player 1 life: \(newLife)"
            }
        }
 }
    @IBAction func player1minus1(_ sender: Any) {
        print("player1minus1")
        if let lifeText = label1.text {
            let components = lifeText.components(separatedBy: ":")
            if components.count == 2, let currentLife = Int(components[1].trimmingCharacters(in: .whitespaces)) {
                let newLife = currentLife - 1
                if newLife <= 0 {
                    loser.text = "Player 1 LOSES!"
                }
                label1.text = "Player 1 life: \(newLife)"
            }
        }
 }
    @IBAction func player1minus5(_ sender: Any) {
        print("player1minus5")
        if let lifeText = label1.text {
            let components = lifeText.components(separatedBy: ":")
            if components.count == 2, let currentLife = Int(components[1].trimmingCharacters(in: .whitespaces)) {
                let newLife = currentLife - 5
                if newLife <= 0 {
                    loser.text = "Player 1 LOSES!"
                }
                label1.text = "Player 1 life: \(newLife)"
            }
        }
 }
    
    @IBAction func player2plus1(_ sender: Any) {
        print("player2plus1")
        if let lifeText = label2.text {
            let components = lifeText.components(separatedBy: ":")
            if components.count == 2, let currentLife = Int(components[1].trimmingCharacters(in: .whitespaces)) {
                let newLife = currentLife + 1
                label2.text = "Player 2 life: \(newLife)"
            }
        }
  }
    @IBAction func player2plus5(_ sender: Any) {
        print("player2plus5")
        if let lifeText = label2.text {
            let components = lifeText.components(separatedBy: ":")
            if components.count == 2, let currentLife = Int(components[1].trimmingCharacters(in: .whitespaces)) {
                let newLife = currentLife + 5
                label2.text = "Player 2 life: \(newLife)"
            }
        }
  }
    @IBAction func player2minus1(_ sender: Any) {
        print("player2minus1")
        if let lifeText = label2.text {
            let components = lifeText.components(separatedBy: ":")
            if components.count == 2, let currentLife = Int(components[1].trimmingCharacters(in: .whitespaces)) {
                let newLife = currentLife - 1
                if newLife <= 0 {
                    loser.text = "Player 2 LOSES!"
                }
                label2.text = "Player 2 life: \(newLife)"
            }
        }
  }
 
@IBAction func player2minus5(_ sender: Any) {
    print("player2minus5")
    if let lifeText = label2.text {
        let components = lifeText.components(separatedBy: ":")
        if components.count == 2, let currentLife = Int(components[1].trimmingCharacters(in: .whitespaces)) {
            let newLife = currentLife - 5
            if newLife <= 0 {
                loser.text = "Player 2 LOSES!"
            }
            label2.text = "Player 2 life: \(newLife)"
        }
    }
}
}
