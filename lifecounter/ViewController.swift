//
//  ViewController.swift
//  lifecounter
//
//  Created by Leah on 4/17/24.
//

import UIKit

class ViewController: UIViewController {
    
    var life1 = 20
    var life2 = 20
    let lifeLabel1 = UILabel()
    let lifeLabel2 = UILabel()
    let addButton1 = UIButton()
    let addButton2 = UIButton()
    let removeButton1 = UIButton()
    let removeButton2 = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = UIColor.black
    }
    
    func setupViews() {
        let screenHeight = view.bounds.height
        
        configureLabel(lifeLabel1, text: "Player 1: \(life1)", yPos: screenHeight * 0.25 - 75)
        configureLabel(lifeLabel2, text: "Player 2: \(life2)", yPos: screenHeight * 0.75 - 75)

        configureButton(addButton1, title: "+", yPos: screenHeight * 0.25, width: 100, height: 100, player: 1)
        configureButton(removeButton1, title: "-", yPos: screenHeight * 0.25, xOffset: 110, width: 100, height: 100, player: 1)

        configureButton(addButton2, title: "+", yPos: screenHeight * 0.75, width: 100, height: 100, player: 2)
        configureButton(removeButton2, title: "-", yPos: screenHeight * 0.75, xOffset: 110, width: 100, height: 100, player: 2)
    }
    
    func configureLabel(_ label: UILabel, text: String, yPos: CGFloat) {
        label.text = text
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.frame = CGRect(x: 100, y: yPos, width: 200, height: 50)
        view.addSubview(label)
    }
    
    func configureButton(_ button: UIButton, title: String, yPos: CGFloat, xOffset: CGFloat = 0, width: CGFloat, height: CGFloat, player: Int) {
        button.setTitle(title, for: .normal)
        button.frame = CGRect(x: (view.bounds.width / 2 - 100) + xOffset, y: yPos, width: width, height: height)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = width / 3
        button.tag = player
        button.addTarget(self, action: #selector(handleLifeChange), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func handleLifeChange(_ sender: UIButton) {
        let player = sender.tag
        let change = sender.currentTitle == "+" ? 1 : -1
        updateLife(for: player, change: change)
    }

    func updateLife(for player: Int, change: Int) {
        if player == 1 {
            life1 += change
            updateLifeLabel(lifeLabel1, life: life1)
        } else if player == 2 {
            life2 += change
            updateLifeLabel(lifeLabel2, life: life2)
        }
    }

    func updateLifeLabel(_ label: UILabel, life: Int) {
        label.text = label == lifeLabel1 ? "Player 1: \(life)" : "Player 2: \(life)"
    }
}

