//
//  postRequestViewController.swift
//  AlamoFireGetData
//
//  Created by Admin on 28/10/2019.
//  Copyright © 2019 Brain Plow. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class postRequestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       postRequest()
    }
    

  func postRequest(){
    
    let urlString = "https://apis.sell4bids.com/authentication/login"

    Alamofire.request(urlString, method: .post,parameters: ["email": "zeeshan.memon@brainplow.com", "password":"123456"],encoding: JSONEncoding.default, headers: nil).responseJSON {
    response in
      switch response.result {
                    case .success:
                        print(response)

                        break
                    case .failure(let error):

                        print(error)
                    }
    }
 
  }
  

}
