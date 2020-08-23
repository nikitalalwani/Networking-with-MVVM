//
//  ViewModel.swift
//  TopMovies
//
//  Created by nikita lalwani on 8/22/20.
//  Copyright © 2020 nikita lalwani. All rights reserved.
//

import UIKit

class ViewModel: NSObject {

    func numberOfItemsInSection(_ section: Int) -> Int {
        return 10
    }
    
    func titleForItemInIndexpath(_ indexPath: IndexPath) -> String {
        return "hello world"
    }
}
