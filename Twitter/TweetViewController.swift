//
//  TweetViewController.swift
//  Twitter
//
//  Created by Andre Chang on 2/4/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet var tweetTxtView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTxtView.becomeFirstResponder()
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweet(_ sender: Any) {
        if (!tweetTxtView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTxtView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (Error) in
                print("Error posting tweet \(Error)")
            })
        } else {
            self.dismiss(animated:true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
