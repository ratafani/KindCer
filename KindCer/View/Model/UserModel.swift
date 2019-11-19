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
    var jenis_kanker : String
    var kondisi : String
    var kontak_penting : String
    var posisi_kanker : String
    var tgl_diagnosis : Date
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
        self.fetchData()
    }
    func fetchData() {
        objectWillChange.send(self)
    }
    
    func fetchUser(user:UserType){
        self.user_name = user.user_name
        self.jenis_kanker = user.jenis_kanker
        self.kondisi = user.kondisi
        self.kontak_penting = user.kontak_penting
        self.posisi_kanker = user.posisi_kanker
        self.tgl_diagnosis = user.tgl_diagnosis
        fetchData()
    }
    
    func saveData(user:UserType){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        
        entity.setValue(user.user_name, forKey: "user_name")
        entity.setValue(user.jenis_kanker, forKey: "jenis_kanker")
        entity.setValue(user.kondisi, forKey: "kondisi")
        entity.setValue(user.kontak_penting, forKey: "kontak_penting")
        entity.setValue(user.posisi_kanker, forKey: "posisi_kanker")
        entity.setValue(user.tgl_diagnosis, forKey: "tgl_diagnosis")
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
                up.setValue(user.jenis_kanker, forKey: "jenis_kanker")
                up.setValue(user.kondisi, forKey: "kondisi")
                up.setValue(user.kontak_penting, forKey: "kontak_penting")
                up.setValue(user.posisi_kanker, forKey: "posisi_kanker")
                up.setValue(user.tgl_diagnosis, forKey: "tgl_diagnosis")
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
                self.jenis_kanker = a.value(forKey: "jenis_kanker") as! String
                self.kondisi = a.value(forKey: "kondisi") as! String
                self.kontak_penting = a.value(forKey: "kontak_penting") as! String
                self.posisi_kanker = a.value(forKey: "posisi_kanker") as! String
                self.tgl_diagnosis = a.value(forKey: "tgl_diagnosis") as! Date
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
        
        do{
            let res = try context.fetch(fetchRequest)
            if res.count > 0{
                let up = res[0] as! NSManagedObject
                up.setValue(photo, forKey: "photo")
                
                try context.save()
                self.photo = photo
                fetchData()
            }else{
                let entity = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
                
                entity.setValue(photo, forKey: "photo")
                self.photo = photo
                fetchData()
            }
            
        }
        catch{
            
        }
    }
}
