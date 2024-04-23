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

    var players: [String] = ["Player 1 life: 20", "Player 2 life: 20", "Player 3 life: 20", "Player 4 life: 20", "Player 5 life: 20", "Player 6 life: 20", "Player 7 life: 20", "Player 8 life: 20"]
    
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
        cell.playerLabel.tag = indexPath.row + 1
        return cell
    }
}
