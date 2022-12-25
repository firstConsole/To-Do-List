//
//  ListViewController.swift
//  To Do List
//
//  Created by Алексей Артамонов on 19.12.2022.
//

import UIKit

protocol TargetDelegate: AnyObject {
    func didAddTarget(with result: Target)
}

final class ListViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addTargetButton: UIBarButtonItem!
    @IBOutlet weak var finishTargetButton: UIBarButtonItem!
    
    // MARK: - Properties
    
    var targets: [Target] = []
    var doneTargets: [Target] = []
    var priority: Priority?
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        finishTargetButton.isEnabled = false
        
        registerCells()
    }
    
    // MARK: Actions
    
    @IBAction func addTargetButton(_ sender: UIBarButtonItem) {
        addTarget()
    }
}

