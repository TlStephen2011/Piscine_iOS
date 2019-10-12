//
//  TweetTableViewController.swift
//  Tweeter
//
//  Created by Tyrone Stephen on 2019/10/12.
//  Copyright © 2019 Tyrone Stephen. All rights reserved.
//

import UIKit

class TweetTableViewController: UITableViewController, APITwitterDelegate {
    
    var tweets: [Tweet] = []
    var api: APIController?
    
    func process(tweets t: [Tweet]) {
        tweets = t
        
        for t in tweets {
            print(t)
        }        
    }
    
    func onError(error e: NSError) {
        print(e.description)
    }
    
    private func loadDummyTweets() {
        api?.getTweets(query: "randomQuery")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api = APIController(delegate: self, token: "123")
        loadDummyTweets()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "tweetCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TweetTableViewCell  else {
            fatalError("The dequeued cell is not an instance of TweetTableViewCell.")
        }

        let tweet = tweets[indexPath.row]
        
        cell.nameLabel.text = tweet.name
        cell.tweetLabel.text = tweet.text
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
