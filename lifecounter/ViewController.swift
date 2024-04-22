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

    var strings: [String] = ["Player 1", "Player 2", "Player 3", "Player 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .black

        tableView.dataSource = self
    }

    private func parseLifeCount(from label: UILabel) -> Int? {
        guard let lifeText = label.text else { return nil }
        let components = lifeText.components(separatedBy: ":")
        guard components.count == 2 else { return nil }
        return Int(components[1].trimmingCharacters(in: .whitespaces))
    }
    
    private func updateLife(label: UILabel, change: Int) {
        if let currentLife = parseLifeCount(from: label) {
            let newLife = currentLife + change
            label.text = "Player \(label == label1 ? "1" : "2") life: \(newLife)"
            if newLife <= 0 {
                loser.text = "Player \(label == label1 ? "1" : "2") LOSES!"
            }
        }
    }

    @IBAction func player1plus1(_ sender: Any) {
        updateLife(label: label1, change: 1)
    }

    @IBAction func player1plus5(_ sender: Any) {
        let plusAmount = Int(changeNum1.text!) ?? 0
        updateLife(label: label1, change: plusAmount)
    }

    @IBAction func player1minus1(_ sender: Any) {
        updateLife(label: label1, change: -1)
    }

    @IBAction func player1minus5(_ sender: Any) {
        let minusAmount = Int(changeNum1.text!) ?? 0
        updateLife(label: label1, change: -minusAmount)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = strings[indexPath.row]
        return cell
    }
}
