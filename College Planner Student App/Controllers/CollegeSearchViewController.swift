//
//  FirstViewController.swift
//  College Planner Student App
//
//  Created by Dayana on 8/28/19.
//  Copyright © 2019 Dayana Rios. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CollegeSearchViewController: UIViewController {

    let API_KEY = "&api_key=8leipfCCZHqsYOqYWjVvAncLtfbJfKshyKCAuLIV"
    let URL = "https://api.data.gov/ed/collegescorecard/v1/schools.json?"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //can append &_fields=id,school.name to end before api key to limit the field retrieved
        let schoolNameRequest = "school.name="
        let schoolIDRequest = "id=164924"
        let cityRequest = "school.city=los%20angeles"
        let fields = "&_fields=id,school.name,latest.admissions.admission_rate.overall"
        let test = "https://api.data.gov/ed/collegescorecard/v1/schools?school.state=ca&api_key=8leipfCCZHqsYOqYWjVvAncLtfbJfKshyKCAuLIV&_fields=school.name"
        //getSchool(url: URL + cityRequest  + API_KEY)
        getSchool(url: test)

        
    }
    
    func getSchool(url : String){
        Alamofire.request(url, method : .get).responseJSON{
            response in
            if response.result.isSuccess{
                print("Success! Got school data")
                
                let schoolJSON : JSON = JSON(response.result.value!)
                
                print(schoolJSON)
                //self.updateWeatherData(json: weatherJSON)
                
            }
            else{
                print("Error \(response.result.error)")
                //self.cityLabel.text = "Connection Issues. Unable to retrieve weather data. "
            }
        }
    }
    
    


}

