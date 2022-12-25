//
//  FinishedTaskList.swift
//  To Do List
//
//  Created by Алексей Артамонов on 25.12.2022.
//

import UIKit

protocol FinishedTaskDelegate: AnyObject {
    func finishedTask(with result: Target)
}

final class FinishedTaskList: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var finishedTargets: [Target] = []
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        registerCell()
    }
}
