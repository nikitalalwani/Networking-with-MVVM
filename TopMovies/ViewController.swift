//
//  ViewController.swift
//  TopMovies
//
//  Created by nikita lalwani on 8/22/20.
//  Copyright © 2020 nikita lalwani. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var viewModel: ViewModel!
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.fetchMovies {
            DispatchQueue.main.async {
               self.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        configureCell(cell: cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath) {
        cell.textLabel?.text = viewModel.titleForItemInIndexpath(indexPath)
    }

}

