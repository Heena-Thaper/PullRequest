//
//  APIManager.swift
//  PullRequest
//
//  Created by heena thapar on 25/08/22.
//

import Foundation

class APIManager: NSObject  {
    
    func fetchPullRequest(type: PR_STATUS, completion: @escaping ([PullRequest]) -> Void) {
        
        let url = URL(string: "\(API_URL)?state=\(type.rawValue)")!

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                   if let pullRequest = try? JSONDecoder().decode([PullRequest].self, from: data) {
                       print(pullRequest)
                       completion(pullRequest)
                   } else {
                       print("Invalid Response")
                   }
               } else if let error = error {
                   print("HTTP Request Failed \(error)")
               }
        }

        task.resume()
    }
    
}
