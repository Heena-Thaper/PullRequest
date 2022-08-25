//
//  PRListViewController.swift
//  PullRequest
//
//  Created by heena thapar on 25/08/22.
//

import UIKit

class PRListViewController: UIViewController {
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loaderView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    var pullRequests: [PullRequest] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        showLoader()
        APIManager().fetchPullRequest(type: .close) { pullRequest in
            print(pullRequest)
            DispatchQueue.main.async {
                self.pullRequests = pullRequest
                self.tableView.reloadData()
                self.hideLoader()
            }
        }
        
    }
    
    func showLoader(){
        loaderView.isHidden = false
        activityIndicator.startAnimating()
    }
    

    func hideLoader(){
        loaderView.isHidden = true
        activityIndicator.stopAnimating()
    }

}
extension PRListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequests.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PRDetailCell") as? PRDetailCell else{
            return UITableViewCell()
        }
        let model =  pullRequests[indexPath.row]
        cell.update(data: model)
        return cell
    }
}
