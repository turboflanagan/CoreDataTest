//
//  ViewController.swift
//  CoreDataTest
//
//  Created by MacBook Pro on 12/16/15.
//  Copyright © 2015 Peter Flanagan. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.createNewPerson(firstName: "Peter", lastName: "Flanagan")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func createNewPerson(firstName firstName: String, lastName: String){
        
        guard let appD = UIApplication.sharedApplication().delegate as? AppDelegate else{
            
            return
        }
        
        let context = appD.managedObjectContext
        
        if let person = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: context) as? Person {
            
            person.firstName = firstName
            person.lastName = lastName
            
            do {
                try context.save()
            }
            catch {
                print("Oops! We got an error: \(error)")
            }
        }
    }
}












