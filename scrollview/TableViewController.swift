//
//  TableViewController.swift
//  scrollview
//
//  Created by AlienLi on 16/1/24.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let headerView = UIView()
    let refresh = UIView()
    let indicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headerView.backgroundColor = UIColor.whiteColor()
        headerView.frame = CGRectMake(0, -self.tableView.bounds.size.height, CGRectGetWidth(self.tableView.bounds), CGRectGetHeight(self.tableView.bounds))
        self.tableView.addSubview(headerView)
        
        
        
//        refresh.backgroundColor = UIColor.purpleColor()
        refresh.frame = CGRectMake(0, self.tableView.bounds.size.height - 100, headerView.bounds.size.width, 100)
        headerView.addSubview(refresh)
        
        indicator.color = UIColor.purpleColor()
        indicator.activityIndicatorViewStyle = .Gray
        refresh.addSubview(indicator)
        indicator.frame = refresh.bounds
        indicator.hidesWhenStopped = true

    }
    
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        
        print("\(scrollView.contentOffset.y)")
    
    
        
    }
    
    override func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if scrollView.contentOffset.y <= -100 {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.tableView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0)
                //开始刷新
                
                self.indicator.startAnimating()
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), { () -> Void in
                    
                    print("time's up")
                    self.indicator.stopAnimating()

                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
                        //停止刷新
                    })
                })
                
            })

        } else {
            
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
