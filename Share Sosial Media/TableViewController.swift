//
//  TableViewController.swift
//  Share Sosial Media
//
//  Created by hint on 20/08/18.
//  Copyright © 2018 ZidniRyi. All rights reserved.
//

import UIKit
import Social

class TableViewController: UITableViewController {
    
    let dataGambar = [#imageLiteral(resourceName: "burger"),#imageLiteral(resourceName: "flafa"),#imageLiteral(resourceName: "sandwich"),#imageLiteral(resourceName: "udang"),#imageLiteral(resourceName: "burger"),#imageLiteral(resourceName: "flafa")]
    
    let namaFood = ["burger", "flafa", "sandwich", "udang", "ayam", "ikan"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataGambar.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        // Configure the cell...
        cell?.cellImage.image = dataGambar[indexPath.row]
        cell?.celllabel.text = namaFood[indexPath.row]

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    Bikin alert
        
        let alert = UIAlertController(title: nil, message: "Share Using", preferredStyle: .actionSheet)
        let actionFb = UIAlertAction(title: "Share FB", style: .default) { (fb) in
            
//            Cek device teregister acebook belum/ cek fb available or not
//            Kalau tersedia
            if (SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook)){
                let fb = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
//                Insert Tulisan
                fb?.setInitialText(self.namaFood[indexPath.row])
//                Insert image
                fb?.add(self.dataGambar[indexPath.row])
                
                self.present(fb!, animated: true, completion: nil)
                
                
            }
//            Kalau tidak tersedia
            else{
                
                let alerttm = UIAlertController(title: nil, message: "not ava", preferredStyle: .alert)
                
                let actionOk = UIAlertAction(title: "ok", style: .default, handler: nil)  
                alerttm.addAction(actionOk)
                    
                    self.present(alerttm, animated: true, completion: nil)
                }
                
                
            
            }
//            alert.addAction(actionFb)
//          self.present(alert, animated: true, completion: nil)
        
// --------------------- Twitter ------------------------------------------------------------
        
        let actionTw = UIAlertAction(title: "Share Twitter", style: .default) { (Tw) in
            
            //            Cek device teregister acebook belum/ cek fb available or not
            //            Kalau tersedia
            if (SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter)){
                let tw = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                //                Insert Tulisan
                tw?.setInitialText(self.namaFood[indexPath.row])
                //                Insert image
                tw?.add(self.dataGambar[indexPath.row])
                
                self.present(tw!, animated: true, completion: nil)
                
                
            }
                //            Kalau tidak tersedia
            else{
                
                let alerttm2 = UIAlertController(title: nil, message: "not ava", preferredStyle: .alert)
                
                let actionOk2 = UIAlertAction(title: "ok", style: .default, handler: nil)
                alerttm2.addAction(actionOk2)
                
                self.present(alerttm2, animated: true, completion: nil)
            }
            
            
            
        }
        alert.addAction(actionFb)
        alert.addAction(actionTw)
        self.present(alert, animated: true, completion: nil)

        
        
        }
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


