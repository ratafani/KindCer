//
//  ObatModel.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 30/12/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import SwiftUI
import CoreData
import Combine

struct ObatType {
    var id : NSManagedObjectID
    var name : String
    var jadwal : [String]
    var jenis : String
    var aturan : String
    
}
struct ObatHistory{
    var id : NSManagedObjectID
    var name : String
    var time : Date
    var status : String
}

class ObatModel : NSObject, ObservableObject{
    
    let objectWillChange = PassthroughSubject<ObatModel,Never>()
    var data = [ObatHistory]()
    var listObat = [ObatType]()
    
    override init() {
        super.init()
        readListObat()
        readObatHariIni()
    }
    
    func fetchData(){
        objectWillChange.send(self)
    }
    
    func readListObat(){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Obat")
        listObat = []
        do {
            let result = try context.fetch(fetchRequest)
            
            for r in result as! [NSManagedObject] {
                guard let name = r.value(forKey: "name") else{
                    return
                }
                guard let jadwal = r.value(forKey: "jadwal") else{
                    return
                }
                guard let jenis = r.value(forKey: "jenis") else{
                    return
                }
                
                guard let aturan = r.value(forKey: "aturan") else{
                    return
                }
                let jadwalData = jadwal as! String
                let setStringAsData = jadwalData.data(using: String.Encoding.utf16)
                let listDate: Set<String> = try! JSONDecoder().decode(Set<String>.self, from: setStringAsData!)
                
                var arnum = [Int]()
                for a in Array(listDate){
                    if let number = Int(a.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) {
                        arnum.append(number)
                    }
                }
                
                arnum = arnum.sorted()
                
                var sArr = [String]()
                for n in arnum{
                    sArr.append("\(n/100):\(n%100==0 ? "00":String(n%100))")
                }
                let obj = ObatType(id: r.objectID,
                                   name: name as! String,
                                   jadwal: sArr,
                                   jenis: jenis as! String,
                                   aturan: aturan as! String
                                   )
                
                listObat.append(obj)
            }
            
            fetchData()
        } catch {
            
        }
    }
    
    func readObatHariIni(){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ObatRiwayat")
        let sorting = NSSortDescriptor(key: "jam",ascending: true)
        fetchRequest.sortDescriptors = [sorting]
        let calendar = Calendar.current
        data = []
        do {
            let result = try context.fetch(fetchRequest)
            
            for r in result as! [NSManagedObject] {
                guard let name = r.value(forKey: "name") else{
                    return
                }
                guard let jam = r.value(forKey: "jam") else{
                    return
                }
                guard let status = r.value(forKey: "status") else{
                    return
                }
                let date = calendar.startOfDay(for: jam as! Date)
                let obj = ObatHistory(id: r.objectID, name: name as! String, time: date, status: status as! String)
                data.append(obj)
            }
            
            fetchData()
        } catch {
            
        }
    }
    
    func saveListObat(obat: ObatType){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Obat", into: context)
        let setJadwal = Set(obat.jadwal)
        entity.setValue(obat.name, forKey: "name")
        entity.setValue(obat.aturan, forKey: "aturan")
        entity.setValue(obat.jenis, forKey: "jenis")
        entity.setValue(setJadwal.description, forKey: "jadwal")
        
        fetchData()
        readListObat()
        readObatHariIni()
    }
    
    func saveRiwayatObat(obat : ObatHistory){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "ObatRiwayat", into: context)
        
        entity.setValue(obat.name, forKey: "name")
        entity.setValue(obat.time, forKey: "jam")
        entity.setValue(obat.status, forKey: "status")
        
        fetchData()
        readListObat()
        readObatHariIni()
    }
    
    func deleteItem(id:NSManagedObjectID){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        do{
            let obj =  try context.existingObject(with: id)
            context.delete(obj)
            fetchData()
            readListObat()
            readObatHariIni()
        }catch{
            
        }
    }
    
    func getData(obat:String)-> [ObatHistory]{
        var mData = [ObatHistory]()
        
        let calendar = Calendar.current

        
        
        for o in self.data{
            if o.name == obat{
                if calendar.isDateInToday(o.time){
                    mData.append(o)
                }
            }
        }
        
        return mData
    }
    
}
