//
//  DetailViewController.swift
//  FontSample
//
//  Created by ikata on 2016/03/21.
//  Copyright © 2016年 BraveTechnology Inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var tvFontDetail: UITextView!
    
    var fontName: String!
    
    var keyBoardToolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tvFontDetail.font = UIFont(name: self.fontName, size: 12.0)
        
        self.keyBoardToolBar = UIToolbar(frame:
            CGRectMake(
                0,
                0,
                self.view.frame.size.width,
                44
            )
        )
        
        var items: [UIBarButtonItem] = [UIBarButtonItem]()
        
        items.append(UIBarButtonItem(title: "閉じる", style: UIBarButtonItemStyle.Plain, target: self, action: "pushBtnKeyClose:"))
        
        self.keyBoardToolBar.items = items
        self.tvFontDetail.inputAccessoryView = self.keyBoardToolBar
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func pushBtnClose(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func pushBtnKeyClose(sender: AnyObject) {
        self.tvFontDetail.resignFirstResponder()
    }
}
