//
//  ViewModel.swift
//  TopMovies
//
//  Created by nikita lalwani on 8/22/20.
//  Copyright © 2020 nikita lalwani. All rights reserved.
//

import UIKit

class ViewModel: NSObject {

    @IBOutlet var moviesClient: MoviesClient!
    var movie: [NSDictionary]?
    
    func numberOfItemsInSection(_ section: Int) -> Int {
        return movie?.count ?? 0
    }
    
    func titleForItemInIndexpath(_ indexPath: IndexPath) -> String {
        return movie?[indexPath.row].value(forKeyPath: "im:name.label") as? String ?? ""
    }
    
    func fetchMovies(completion: @escaping () -> ()) {
        moviesClient.fetchMovies { movies in
            self.movie = movies
            completion()
        }
    }
}
