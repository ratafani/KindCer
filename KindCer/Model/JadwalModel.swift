//
//  JadwalModel.swift
//  KindCer
//
//  Created by Mauldy Putra on 15/11/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import Foundation
import CoreData
import Combine
import SwiftUI

struct JadwalType {
    var id : NSManagedObjectID
    var tempat : String
    var tanggal : Date
    var dokter : String
    var catatan : String
}

class JadwalModel : NSObject, ObservableObject{
    
    
    let objectWillChange = PassthroughSubject<JadwalModel,Never>()
    
    
    var data = [JadwalType]()
    var fData = [JadwalType]()
    var pData = [JadwalType]()
    
    override init() {
        super.init()
        self.readData()
        
    }
    func fetchData(){
        objectWillChange.send(self)
    }
    
    func saveData(jadwal: JadwalType){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Jadwal", into: context)
        
        entity.setValue(jadwal.tanggal, forKey: "tanggal")
        entity.setValue(jadwal.tempat, forKey: "tempat")
        entity.setValue(jadwal.catatan, forKey: "catatan")
        entity.setValue(jadwal.dokter, forKey: "dokter")
        
        readData()
    }
    
    func readData(){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Jadwal")
        let sorting = NSSortDescriptor(key: "tanggal",ascending: true)
        fetchRequest.sortDescriptors = [sorting]
        
        data = []
        
        do {
            let result = try context.fetch(fetchRequest)
            
            for r in result as! [NSManagedObject] {
                let tempat = r.value(forKey: "tempat") as! String
                let dokter = r.value(forKey: "dokter") as! String
                let tanggal = r.value(forKey: "tanggal") as! Date
                let catatan = r.value(forKey: "catatan") as! String
                
                let newJadwal = JadwalType(id: r.objectID, tempat: tempat, tanggal: tanggal, dokter: dokter, catatan: catatan)
                data.append(newJadwal)
                if tanggal.timeIntervalSince1970 >= Date().timeIntervalSince1970{
                    
                }
            }
            self.divideData()
            fetchData()
        } catch {
            
        }
    }
    func divideData(){
        pData = []
        fData = []
        for a in self.data{
            if a.tanggal.timeIntervalSince1970 <= Date().timeIntervalSince1970{
                self.pData.append(a)
            }else{
                self.fData.append(a)
            }
        }
    }
    func updateItem(id:NSManagedObjectID, key: String, value: Any){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        do{
            let obj =  try context.existingObject(with: id)
            obj.setValue(value, forKey: key)
            readData()
        }catch{
            
        }
        
    }
    
    func deleteItem(id:NSManagedObjectID){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        do{
            let obj =  try context.existingObject(with: id)
            context.delete(obj)
            readData()
        }catch{
            
        }
    }
}
