//
//  MoviesViewController.swift
//  ios_movie
//
//  Created by Charles Merriam on 9/22/14.
//  Copyright (c) 2014 Charles Merriam. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func  tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
        //  what's that mean in the declaration  the second
        UITableViewCell {
        println("I'm at row \(indexPath.row), section \(indexPath.section)")
            
        var cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as MovieCell
        
        cell.movieTitleLabel.text = "Title"
        cell.synopsisLabel.text = "Synopsis"
        // cell.textLabel!.text = "Hello from row \(indexPath.row), section \(indexPath.section)"
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
