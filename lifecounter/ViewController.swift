//
//  ViewController.swift
//  lifecounter
//
//  Created by Leah on 4/17/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var history: UIButton!
    @IBOutlet weak var playerStepper: UIStepper!

    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var tableView: UITableView!

    var players: [String] = ["Player 1 life: 20", "Player 2 life: 20", "Player 3 life: 20", "Player 4 life: 20"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        playerStepper.minimumValue = 2
        playerStepper.maximumValue = 8
        playerStepper.value = Double(players.count)
        playerStepper.stepValue = 1  // Increment by 1

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(playerCellTableViewCell.nib(), forCellReuseIdentifier: playerCellTableViewCell.identifier)
    }
    
    @IBAction func resetPlayerLives(_ sender: UIButton) {
        for index in 0..<players.count {
            let playerNumber = index + 1
            players[index] = "Player \(playerNumber) life: 20"
        }
        tableView.reloadData()
    }

    
    @IBAction func playerStepperChanged(_ sender: UIStepper) {
        let newCount = Int(sender.value)
        
        while newCount > players.count && players.count < 8 {
            let newPlayerNumber = players.count + 1
            players.append("Player \(newPlayerNumber) life: 20")
        }
        
        while newCount < players.count && players.count > 2 {
            players.removeLast()
        }
        
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: playerCellTableViewCell.identifier, for: indexPath) as! playerCellTableViewCell
        cell.playerLabel.text = players[indexPath.row]
        cell.playerLabel.tag = indexPath.row + 1
        return cell
    }
}
