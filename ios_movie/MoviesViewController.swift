//
//  MoviesViewController.swift
//  ios_movie
//
//  Created by Charles Merriam on 9/22/14.
//  Copyright (c) 2014 Charles Merriam. All rights reserved.
//

import UIKit

var movies: [NSDictionary] = []
var currentMovie: NSDictionary = NSDictionary()  // total kludge for passing variables

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    // var movies: [NSDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        var url = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=zptatrrdy26ps6s3nj9hd6bs&limit=20&country=us"
        
        var request = NSURLRequest(URL: NSURL(string: url))

        
        NSURLConnection.sendAsynchronousRequest(
            request,
            queue: NSOperationQueue.mainQueue()
            ) {  // now the completion handler parameter as a closure
                (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void // closure parameter & return types
                in
                var object = NSJSONSerialization.JSONObjectWithData(data, options: nil, error:nil) as NSDictionary
                
                // println("object: \(object)")
                movies = object["movies"] as [NSDictionary]
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
        UITableViewCell
    {
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var view_to_show = segue.destinationViewController as UIViewController
        if segue.identifier == "Detail Segue" {
            println("Passing the right thing")
            var row = self.tableView.indexPathForSelectedRow()?.row
            println("Row is \(row)")
            var detail = segue.destinationViewController as DetailViewController
            detail.index = row
            
        }
        println("Segue to \(view_to_show.title)")
    }
}
