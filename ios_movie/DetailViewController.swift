//
//  DetailViewController.swift
//  ios_movie
//
//  Created by Charles Merriam on 9/25/14.
//  Copyright (c) 2014 Charles Merriam. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var index : Int? = nil  // the index into movies; always set by something else
    
    @IBOutlet weak var movieNameNavigationItem: UINavigationItem!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var criticsLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // var index = 1
        // var movie = movies[index] as NSDictionary
        var movie = movies[index!] as NSDictionary
        println(movie)
        movieNameNavigationItem.title = movie["title"] as? String
        var syn = "Synopsis:  "
        syn += movie["synopsis"]! as String
        synopsisLabel.text = syn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
