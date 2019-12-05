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
}

class UserModel : NSObject,ObservableObject {
    
    
    let objectWillChange = PassthroughSubject<UserModel, Never>()
    
    var user_name : String = ""
    var jenis_kanker : String = ""
    var kondisi : String = ""
    var kontak_penting : String = ""
    var posisi_kanker : String = ""
    var tgl_diagnosis : Date = Date()
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
        fetchData()
    }
    
    func saveData(user:UserType){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        
        entity.setValue(user.user_name, forKey: "user_name")
        entity.setValue(user.photo, forKey: "photo")
        
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
                
                self.user_name = a.value(forKey: "user_name") as! String
                self.photo = a.value(forKey: "photo") as! Data
            }else{
                
            }
            
        }
        catch{
            
        }
    }
    
    
    
    
    func updatePhoto(photo:Data){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let user = UserType(user_name: user_name,photo: photo)
        do{
            let res = try context.fetch(fetchRequest)
            if res.count > 0{
                let up = res[0] as! NSManagedObject
                up.setValue(photo, forKey: "photo")
                up.setValue(user_name, forKey: "user_name")
                try context.save()
                
                fetchUser(user: user)
            }else{
                
                saveData(user: user)
            }
            
        }
        catch{
            
        }
    }
    
    func updateDataUser(photo:Data, userName:String){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let user = UserType(user_name: userName,photo: photo)
        
        do{
            let res = try context.fetch(fetchRequest)
            if res.count > 0{
                let up = res[0] as! NSManagedObject
                up.setValue(photo, forKey: "photo")
                up.setValue(userName, forKey: "user_name")
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
