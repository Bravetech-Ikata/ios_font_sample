//
//  ViewController.swift
//  FontSample
//
//  Created by ikata on 2016/03/21.
//  Copyright © 2016年 BraveTechnology Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var familyNameArr: [String] = [String]()
    var fontNamrArr: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.familyNameArr = UIFont.familyNames()
        for item in self.familyNameArr {
            for item2 in UIFont.fontNamesForFamilyName(item) {
                self.fontNamrArr.append(item2)
            }
        }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK - UITableViewDelegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fontNamrArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: FontCell = tableView.dequeueReusableCellWithIdentifier("FontCell", forIndexPath: indexPath) as! FontCell
        
        cell.setLabelFont(self.fontNamrArr[indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc: DetailViewController = storyBoard.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        vc.fontName = self.fontNamrArr[indexPath.row]
        self.presentViewController(vc, animated: true, completion: nil)
    }
}

