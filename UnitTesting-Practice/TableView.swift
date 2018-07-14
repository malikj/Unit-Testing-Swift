//
//  TableView.swift
//  UnitTesting-Practice
//
//  Created by malikj on 14/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import Foundation
import UIKit

protocol SelectionViewControllerDelegate: class {
    func didSelect(_ selectionViewController: SelectionViewController, item: String)
}

class SelectionViewController: UIViewController, UITableViewDelegate {
    
    private weak var delegate: SelectionViewControllerDelegate?
    private let items: [String]
    
    init(items: [String], delegate: SelectionViewControllerDelegate) {
        self.items = items
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        delegate?.didSelect(self, item: item)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
}
