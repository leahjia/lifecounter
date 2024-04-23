//
//  playerCellTableViewCell.swift
//  lifecounter
//
//  Created by Leah on 4/22/24.
//

import UIKit

class playerCellTableViewCell: UITableViewCell {
    
    static let identifier = "playerCellTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "playerCellTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var changeNum: UITextField!

    @IBAction func minusOne(_ sender: Any) {
        updateLife(label: playerLabel, change: -1)
    }
    
    @IBAction func plusOne(_ sender: Any) {
        updateLife(label: playerLabel, change: 1)
    }
    
    @IBAction func minusNum(_ sender: Any) {
        let num = Int(changeNum.text!) ?? 0
        updateLife(label: playerLabel, change: -num)
    }
    
    @IBAction func plusNum(_ sender: Any) {
        updateLife(label: playerLabel, change: Int(changeNum.text!) ?? 0)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func parseLifeCount(from label: UILabel) -> Int? {
        guard let lifeText = label.text else { return nil }
        let components = lifeText.components(separatedBy: ":")
        guard components.count == 2 else { return nil }
        return Int(components[1].trimmingCharacters(in: .whitespaces))
    }
    
    weak var viewController: ViewController?
    private func updateLife(label: UILabel, change: Int) {
        if let currentLife = parseLifeCount(from: label) {
            let newLife = currentLife + change
            label.text = "Player \(playerLabel.tag) life: \(newLife)"
            if newLife < 0 {
                viewController?.endGame()
            }
        }
    }

}
