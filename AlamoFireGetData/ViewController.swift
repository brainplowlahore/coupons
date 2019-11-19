//
//  ViewController.swift
//  AlamoFireGetData
//
//  Created by Admin on 28/10/2019.
//  Copyright © 2019 Brain Plow. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.idArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = myTableView.dequeueReusableCell(withIdentifier: mycustomTableViewCell) as! myTableViewCell
    cell.idLabel.text = idArray[indexPath.row]
    cell.nameLabel.text = nameArray[indexPath.row]
    return cell
  }
  
  
  var idArray = [String]()
  var nameArray = [String]()
  
  @IBOutlet var myTableView: UITableView!
  
  let mycustomTableViewCell = "myTableViewCell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let nibCell = UINib(nibName: mycustomTableViewCell, bundle: nil)
    self.myTableView.register(nibCell, forCellReuseIdentifier: mycustomTableViewCell)
    
   
    getApiData()
    
  }
  
  func getApiData(){
    let url = "https://reqres.in/api/users?page=2"
    
    Alamofire.request(url, method: .get).responseJSON { (myRespnse) in
      
      switch myRespnse.result{
        
      case .success:
        // print(myRespnse.value)
        
        let myResult = try? JSON(data: myRespnse.data!)
        
        // print(myResult?["data"])
        let dataArray = myResult!["data"]
        
        self.idArray.removeAll()
        self.nameArray.removeAll()
        
        for i in dataArray.arrayValue
        {
          let id = i["id"].stringValue
          self.idArray.append(id)
          
          let name = i["first_name"].stringValue
          self.nameArray.append(name)
        }
        self.myTableView.reloadData()
        
        break
        
      case .failure:
        print(myRespnse.error!)
        break
      }
    }
    
  }
  
}

