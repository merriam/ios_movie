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
    
    var movies: [NSDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        var url = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=zptatrrdy26ps6s3nj9hd6bs&limit=20&country=us"
        
        var request = NSURLRequest(URL: NSURL(string: url))
        var request2 = NSURLRequest(URL: NSURL(string: "yourkeygoeshere"))
        var x = NSURL(string: url)
        var y = NSURLRequest(URL: x)
        
        
        NSURLConnection.sendAsynchronousRequest(
            request,
            queue: NSOperationQueue.mainQueue()
            ) {  // now the completion handler parameter as a closure
                (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void // closure parameter & return types
                in
                var object = NSJSONSerialization.JSONObjectWithData(data, options: nil, error:nil) as NSDictionary
                
                println("object: \(object)")
                self.movies = object["movies"] as [NSDictionary]
                self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func  tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
        //  what's that mean in the declaration  the second
        UITableViewCell {
            println("I'm at row \(indexPath.row), section \(indexPath.section)")
            
            var cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as MovieCell
            var movie = movies[indexPath.row]

            cell.movieTitleLabel.text = movie["title"] as? String
            cell.synopsisLabel.text = movie["synopsis"] as? String
            var posters = movie["posters"] as NSDictionary
            var posterUrl = posters["thumbnail"] as String
            
            cell.posterView.setImageWithURL(NSURL(string: posterUrl))
            
            
            
            
            
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
