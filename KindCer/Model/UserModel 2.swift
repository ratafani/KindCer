//
//  UserModel.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 13/11/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI
import Combine

struct UserType {
    var user_name : String
    var photo : Data
    var tanggal_lahir : Date
}

class UserModel : NSObject,ObservableObject {
    
    
    let objectWillChange = PassthroughSubject<UserModel, Never>()
    
    var user_name : String = ""
    var tanggal_lahir : Date = Date()
    var photo : Data = Data()
    
    override init() {
        super.init()
        self.readData()
    }
    func fetchData() {
        objectWillChange.send(self)
    }
    
    func fetchUser(user:UserType){
        self.user_name = user.user_name
        self.photo = user.photo
        self.tanggal_lahir = user.tanggal_lahir
        fetchData()
    }
    
    func saveData(user:UserType){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        
        entity.setValue(user.user_name, forKey: "user_name")
        entity.setValue(user.photo, forKey: "photo")
        entity.setValue(user.tanggal_lahir, forKey: "tanggal_lahir")
        
        fetchUser(user: user)
    }
    
    func updateData(user:UserType) {
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        
        do{
            let res = try context.fetch(fetchRequest)
        
            if res.count > 0{
                let up = res[0] as! NSManagedObject
                up.setValue(user.user_name, forKey: "user_name")
                up.setValue(user.photo, forKey: "photo")
                up.setValue(user.tanggal_lahir, forKey: "tanggal_lahir")
                try context.save()
                fetchUser(user: user)
            }else{
                saveData(user: user)
            }
            
        }
        catch{
            
        }
    }
    
    func readData(){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        do{
            let res = try context.fetch(fetchRequest)
            if res.count > 0{
                let a = res[0] as! NSManagedObject
                
                guard let mName = a.value(forKey: "user_name")else{
                    return
                }
                self.user_name = mName as! String
                guard let mPhoto = a.value(forKey: "photo") else {
                    return
                }
                self.photo =  mPhoto as! Data
                
                
                guard let da =  a.value(forKey: "tanggal_lahir") else {
                    return
                }
                self.tanggal_lahir = da as! Date
                
            }else{
                
            }
            
        }
        catch{
            
        }
    }
    
    
    func updateDataUser(photo:Data, userName:String, date: Date){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let user = UserType(user_name: userName,photo: photo,tanggal_lahir: date)
        
        do{
            let res = try context.fetch(fetchRequest)
            if res.count > 0{
                let up = res[0] as! NSManagedObject
                up.setValue(photo, forKey: "photo")
                up.setValue(userName, forKey: "user_name")
                up.setValue(date, forKey: "tanggal_lahir")
                try context.save()
                
                fetchUser(user: user)
            }else{
                
                saveData(user: user)
            }
            
        }
        catch{
            
        }
    }
}
