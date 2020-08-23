//
//  MoviesClient.swift
//  TopMovies
//
//  Created by nikita lalwani on 8/22/20.
//  Copyright © 2020 nikita lalwani. All rights reserved.
//

import UIKit

class MoviesClient: NSObject {

    func fetchMovies(completion: @escaping (_ movies: [NSDictionary]?) -> ()) {
        
        //fetch the data
        let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        let url = URL(string: urlString)!
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        
        let task = session.dataTask(with: url) { (data, response, error) -> Void in
            if error != nil {
                completion(nil)
                return
            }
            
            do {
                guard let json = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed) as? NSDictionary else {
                    return
                }
                if let movies = json.value(forKeyPath: "feed.entry") as? [NSDictionary] {
                    completion(movies)
                    return
                }
            }
            catch {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
}
