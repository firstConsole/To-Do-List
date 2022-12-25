//
//  ListViewCell.swift
//  To Do List
//
//  Created by Алексей Артамонов on 19.12.2022.
//

import UIKit

final class ListViewCell: UITableViewCell {
    
    // MARK: - IBOutlets

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var checkBoxView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var checkboxImage: UIImageView!
    @IBOutlet weak var fireImage: UIImageView!
    
    // MARK: - Static properties
    
    static let identificator: String = "ListCell"
    static let nib: String = "ListViewCell"
    var isChecked: Bool = false
    weak var finishedTask: FinishedTaskDelegate?
    var target: Target?
    
    // MARK: - configure cell
    
    func configure() {
        
        DispatchQueue.main.async {
            self.checkBoxView.layer.cornerRadius = 15
            self.checkBoxView.layer.borderColor = UIColor.lightGray.cgColor
            self.checkBoxView.layer.borderWidth = 0.5
            self.checkBoxView.layer.backgroundColor = UIColor.systemBackground.cgColor
            
            self.checkboxImage.isHidden = true
        }
        
        let onTap = UITapGestureRecognizer(target: self, action: #selector(didTapCheckbox))
        checkBoxView.addGestureRecognizer(onTap)
    }
    
    @objc func didTapCheckbox() {
        toggle()
    }
    
    func toggle() {
        self.isChecked = !isChecked
        
        if isChecked {
            
            DispatchQueue.main.async {
                self.mainView.backgroundColor = #colorLiteral(red: 0.8412827849, green: 0.9984998107, blue: 0.8825204372, alpha: 1)
                self.checkboxImage.isHidden = false
            }
        } else {
            DispatchQueue.main.async {
                self.mainView.backgroundColor = UIColor.systemBackground
                self.checkboxImage.isHidden = true
            }
        }
    }
}
