//
//  ViewController.swift
//  FontSample
//
//  Created by ikata on 2016/03/21.
//  Copyright © 2016年 BraveTechnology Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    enum FONT_TYPE: Int {
        case FAMILY
        case FONT
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnChange: UIButton!
    
    var familyNameArr: [String] = [String]()
    var fontNameArr: [String] = [String]()
    var currentType: FONT_TYPE = .FAMILY
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.familyNameArr = UIFont.familyNames()
        for item in self.familyNameArr {
            self.fontNameArr.append(item)
        }
        
        self.btnChange.setTitle("フォントに変更", forState: UIControlState.Normal)
        
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
        return self.fontNameArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: FontCell = tableView.dequeueReusableCellWithIdentifier("FontCell", forIndexPath: indexPath) as! FontCell
        
        cell.setLabelFont(self.fontNameArr[indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc: DetailViewController = storyBoard.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        vc.fontName = self.fontNameArr[indexPath.row]
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func pushBtnChange(sender: AnyObject) {
        self.changeFontType()
    }
    
    
    private func changeFontType() {
        switch self.currentType {
        case .FONT:
            self.btnChange.setTitle("フォントに変更", forState: UIControlState.Normal)
            self.currentType = .FAMILY
            self.familyNameArr = UIFont.familyNames()
            self.fontNameArr.removeAll()
            for item in self.familyNameArr {
                self.fontNameArr.append(item)
            }
            break
        case .FAMILY:
            self.btnChange.setTitle("ファミリーに変更", forState: UIControlState.Normal)
            self.currentType = .FONT
            self.familyNameArr = UIFont.familyNames()
            self.fontNameArr.removeAll()
            for item in self.familyNameArr {
                for item2 in UIFont.fontNamesForFamilyName(item) {
                    self.fontNameArr.append(item2)
                }
            }
            break
        }
        self.tableView.reloadData()
    }
}

