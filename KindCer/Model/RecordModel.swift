//
//  RecordModel.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 14/11/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import Foundation
import CoreData
import Combine
import SwiftUI

struct RecordType {
    var id : NSManagedObjectID
    var type : String
    var kondisi : String
    var catatan_record : String
    var obat : String
    var catatan_obat : String
    var tanggal : Date
    var penjelasan : String
}


class RecordModel : NSObject,ObservableObject{
    
    
    let objectWillChange = PassthroughSubject<RecordModel,Never>()
    
    var mData = [RecordType]()
    var isDangerous = false
    func fetchData(){
        objectWillChange.send(self)
    }
    
    override init() {
        super.init()
        readData(date: Date())
    }
    var dateFormatter : DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    func readData(date:Date){
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Record")
        let aDate = date.addingTimeInterval(-24*60*60)
        
        let sorting = NSSortDescriptor(key: "tanggal",ascending: true)
        fetchRequest.sortDescriptors = [sorting]
        //        let datePredicate = NSPredicate(format: "tanggal > %@", aDate as NSDate)
        //
        //        fetchRequest.predicate = datePredicate
        mData = []
        do{
            let res = try context.fetch(fetchRequest)
            
            if res.count>0{
                
                for a in res as! [NSManagedObject]{
                    let ad = a.value(forKey: "tanggal")as! Date
                    //                    print("the date",(ad.timeIntervalSince1970 < date.timeIntervalSince1970), ad.timeIntervalSince1970,date.timeIntervalSince1970)
                    
                    if ad.timeIntervalSince1970 <= date.timeIntervalSince1970 && ad.timeIntervalSince1970 > aDate.timeIntervalSince1970{
                        let p = a.value(forKey: "penjelasan") as? String
                        
                        StaticModel.id = a.objectID
                        let rec = RecordType(id: a.objectID, type: a.value(forKey: "type") as! String, kondisi: a.value(forKey: "kondisi")as! String, catatan_record: a.value(forKey: "catatan_record")as! String, obat: a.value(forKey: "obat")as! String, catatan_obat: a.value(forKey: "catatan_obat")as! String, tanggal: a.value(forKey: "tanggal")as! Date,penjelasan: p ?? "")
                        mData.append(rec)
                        if rec.kondisi == "Bahaya"{
                            self.isDangerous = true
                        }
                    }
                    
                }
                //                print(mData)
                
                fetchData()
            }else{
                print("kosong")
            }
        }catch{
            
        }
    }
    
    func readAllData(){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Record")
        let sorting = NSSortDescriptor(key: "tanggal",ascending: true)
        fetchRequest.sortDescriptors = [sorting]
        
        mData = []
        do{
            let res = try context.fetch(fetchRequest)
            
            if res.count>0{
                
                for a in res as! [NSManagedObject]{
                    
                    let p = a.value(forKey: "penjelasan") as? String
                    
                    StaticModel.id = a.objectID
                    let rec = RecordType(id: a.objectID, type: a.value(forKey: "type") as! String, kondisi: a.value(forKey: "kondisi")as! String, catatan_record: a.value(forKey: "catatan_record")as! String, obat: a.value(forKey: "obat")as! String, catatan_obat: a.value(forKey: "catatan_obat")as! String, tanggal: a.value(forKey: "tanggal")as! Date,penjelasan: p ?? "")
                    mData.append(rec)
                    
                }
                fetchData()
            }else{
                print("kosong")
            }
        }catch{
            
        }
    }
    
    func saveData(record:RecordType){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Record", into: context)
        
        entity.setValue(record.type, forKey: "type")
        entity.setValue(record.kondisi, forKey: "kondisi")
        entity.setValue(record.catatan_record, forKey: "catatan_record")
        entity.setValue(record.obat, forKey: "obat")
        entity.setValue(record.catatan_obat, forKey: "catatan_obat")
        entity.setValue(record.tanggal, forKey: "tanggal")
        entity.setValue(record.penjelasan, forKey: "penjelasan")
        
        readData(date: record.tanggal)
    }
    
    
    func updateInId(id: NSManagedObjectID, key:String, value:Any, tgl: Date){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        do{
            let obj =  try context.existingObject(with: id)
            obj.setValue(value, forKey: key)
            readData(date: tgl)
        }catch{
            
        }
    }
    
    func recordAtIndex(id: NSManagedObjectID)->RecordType{
        var a = RecordType(id: StaticModel.id, type: "String", kondisi: "", catatan_record: "", obat: "", catatan_obat: "", tanggal: Date(), penjelasan: "")
        for r in mData{
            if r.id == id{
                a = r
            }
        }
        return a
    }
    
    func allType()->[String]{
        
        var s = [String]()
        for a in mData{
            s.append(a.type)
        }
        
        return s.uniques
    }
    
    func allDate(type:String)->[Date]{
        var d = [Date]()
        
        for a in mData{
            if a.type == type{
            d.append(a.tanggal)
            }
        }
        
        return d.uniques
    }
}

extension Array where Element: Hashable {
    var uniques: Array {
        var buffer = Array()
        var added = Set<Element>()
        for elem in self {
            if !added.contains(elem) {
                buffer.append(elem)
                added.insert(elem)
            }
        }
        return buffer
    }
}
