//
//  ViewController.swift
//  lifecounter
//
//  Created by Leah on 4/17/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var changeNum1: UITextField!
    @IBOutlet weak var loser: UILabel!

    @IBOutlet weak var tableView: UITableView!

    var players: [String] = ["Player 1", "Player 2", "Player 3", "Player 4", "Player 5", "Player 6", "Player 7", "Player 8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .black

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(playerCellTableViewCell.nib(), forCellReuseIdentifier: playerCellTableViewCell.identifier)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: playerCellTableViewCell.identifier, for: indexPath) as! playerCellTableViewCell
        cell.playerLabel.text = players[indexPath.row]
        return cell
    }
}
