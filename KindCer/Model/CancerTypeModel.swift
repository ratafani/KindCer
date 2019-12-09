//
//  CancerTypeModel.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 06/12/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import Foundation
import CoreData
import Combine
import SwiftUI

struct CancerUserType {
    var id : NSManagedObjectID
    var name : String
    var tanngal : Date
}

class CancerModel: NSObject,ObservableObject{
    
    var mData = [CancerUserType]()
    let objectWillChange = PassthroughSubject<CancerModel,Never>()
    
    override init() {
        super.init()
        readData()
    }
    
    func fetchData(){
        objectWillChange.send(self)
    }
    
    func saveData(name:String, tanggal:Date){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "CancerType", into: context)
        
        entity.setValue(name, forKey: "name")
        entity.setValue(tanggal, forKey: "tanggal")
        fetchData()
    }
    
    func readData(){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CancerType")
        let sorting = NSSortDescriptor(key: "tanggal",ascending: true)
        fetchRequest.sortDescriptors = [sorting]
        
        mData = []
        do{
            let res = try context.fetch(fetchRequest)
            if res.count>0{
                for a in res as! [NSManagedObject]{
                    let name = a.value(forKey: "name") as? String
                    let tanggal = a.value(forKey: "tanggal") as? Date
                    let temp = CancerUserType(id: a.objectID, name: name ?? "", tanngal: tanggal ?? Date())
                    mData.append(temp)
                }
                
            }else{
                print("Kosong")
            }
        }catch{
            print("Something error")
        }
        
    }
    
    func updateData(data:NSManagedObjectID, name: String, date: Date){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        do{
            let obj =  try context.existingObject(with: data)
            obj.setValue(name, forKey: "name")
            obj.setValue(date, forKey: "tanggal")
            readData()
        }catch{
            
        }
        fetchData()
    }
    
    func deleteData(data:NSManagedObjectID){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        mData = []
        do{
            let obj =  try context.existingObject(with: data)
             context.delete(obj)
            readData()
        }catch{
            
        }
       
        
        fetchData()
    }
}



