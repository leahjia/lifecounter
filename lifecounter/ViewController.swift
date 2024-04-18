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
    let addFiveButton1 = UIButton()
    let addFiveButton2 = UIButton()
    let removeFiveButton1 = UIButton()
    let removeFiveButton2 = UIButton()
    let statusLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = UIColor.black
        configureStatusLabel()
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name: UIDevice.orientationDidChangeNotification, object: nil)
    }

    @objc func orientationChanged() {
        setupViews()
    }
    
    func setupViews() {
        if UIDevice.current.orientation.isLandscape {
        } else {
            let screenHeight = view.bounds.height
            let buttonWidth: CGFloat = 80
            let buttonHeight: CGFloat = 80
            
            configureLabel(lifeLabel1, text: "Player 1: \(life1)", yPos: screenHeight * 0.2 - 75)
            configureLabel(lifeLabel2, text: "Player 2: \(life2)", yPos: screenHeight * 0.65 - 75)
            
            configureButton(addButton1, title: "+", yPos: screenHeight * 0.2, xOffset: 65, width: buttonWidth, height: buttonHeight, player: 1)
            configureButton(removeButton1, title: "-", yPos: screenHeight * 0.2, xOffset: 175, width: buttonWidth, height: buttonHeight, player: 1)
            configureButton(addFiveButton1, title: "+5", yPos: screenHeight * 0.35,xOffset: 65,  width: buttonWidth, height: buttonHeight, player: 1)
            configureButton(removeFiveButton1, title: "-5", yPos: screenHeight * 0.35, xOffset: 175, width: buttonWidth, height: buttonHeight, player: 1)
            
            configureButton(addButton2, title: "+", yPos: screenHeight * 0.65,  xOffset: 65,width: buttonWidth, height: buttonHeight, player: 2)
            configureButton(removeButton2, title: "-", yPos: screenHeight * 0.65, xOffset: 175, width: buttonWidth, height: buttonHeight, player: 2)
            configureButton(addFiveButton2, title: "+5", yPos: screenHeight * 0.8, xOffset: 65, width: buttonWidth, height: buttonHeight, player: 2)
            configureButton(removeFiveButton2, title: "-5", yPos: screenHeight * 0.8, xOffset: 175, width: buttonWidth, height: buttonHeight, player: 2)
        }
    }

    func configureStatusLabel() {
        statusLabel.frame = CGRect(x: 0, y: view.bounds.height - 50, width: view.bounds.width, height: 50)
        statusLabel.textColor = .white
        statusLabel.textAlignment = .center
        statusLabel.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(statusLabel)
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
        button.frame = CGRect(x: (view.bounds.width / 2 - (2 * width)) + xOffset, y: yPos, width: width, height: height)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = width / 3
        button.tag = player
        button.addTarget(self, action: #selector(handleLifeChange), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func handleLifeChange(_ sender: UIButton) {
        let player = sender.tag
        var change = 0
        switch sender.currentTitle {
            case "+": change = 1
            case "-": change = -1
            case "+5": change = 5
            case "-5": change = -5
            default: break
        }
        updateLife(for: player, change: change)
    }

    func updateLife(for player: Int, change: Int) {
        if player == 1 {
            life1 += change
            updateLifeLabel(lifeLabel1, life: life1)
            if life1 <= 0 {
                statusLabel.text = "Player \(player) LOSES!"
            }
        } else if player == 2 {
            life2 += change
            updateLifeLabel(lifeLabel2, life: life2)
            if life2 <= 0 {
                statusLabel.text = "Player \(player) LOSES!"
            }
        }
    }

    func updateLifeLabel(_ label: UILabel, life: Int) {
        label.text = "Player \(label == lifeLabel1 ? 1 : 2): \(life)"
    }
}

