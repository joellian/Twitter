//
//  HomeTableTableViewController.swift
//  Twitter
//
//  Created by Joel Lian on 10/2/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class HomeTableTableViewController: UITableViewController {
    
    var tweetArray = [NSDictionary]().self
    var numberOfTweet: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to
    }
    
    func loadTweet(){
        
        let myUrl = "https://api.twitter.com/1.1/statuses/home_timeline.json"
        
        let myParams = ["count": 10]
        
        TwitterAPICaller.client?.getDictionariesRequest(url:myUrl, parameters: myParams, success: { (tweets:[NSDictionary]) in
            self.tweetArray.removeAll()
            for tweet in tweets{
                self.tweetArray.append(tweet)
            }
                self.tableView.reloadData()
            
        }, failure: { (error:Error) in
            print("Could not retrieve tweets!")
            print(error.localizedDescription)
            
        })
        
            
    }
    
    
    
    
    
    
    
    
    @IBAction func onLogout(_ sender: Any) {
        TwitterAPICaller.client?.logout()
        self.dismiss(animated: true)
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetsCellTableViewCell
        
        
        let user = tweetArray[indexPath.row]["user"] as! NSDictionary
        
        cell.userNameLabel.text = user["name"] as? String
        cell.tweetContent.text = tweetArray[indexPath.row]["text"] as? String
        return cell
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
            return tweetArray.count
    }

    

}
