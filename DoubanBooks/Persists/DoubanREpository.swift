//
//  DoubanREpository.swift
//  DoubanBooks
//
//  Created by wang on 2019/10/12.
//  Copyright © 2019年 wang. All rights reserved.
//

import Foundation
import CoreData
class DouBanRepository {
    var app: AppDelegate
    var context: NSManagedObjectContext
    init(_ app: AppDelegate) {
        self.app = app
        context = app.persistentContainer.viewContext
    }
    func insert(vm: VMCategory) {
        let description = NSEntityDescription.entity(forEntityName: VMCategory.entityName, in: context)
        let category = NSManagedObject(entity: description!,insertInto: context)
        category.setValue(vm.id, forKey: VMCategory.colId)
        category.setValue(vm.image, forKey: VMCategory.colImage)
        category.setValue(vm.name, forKey: VMCategory.colName)
        app.saveContext()
    }
    func isExists(name:String) throws -> Bool {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: VMCategory.entityName)
        fetch.predicate = NSPredicate(format: "\(VMCategory.colName) =%@",name)
        do{
            let result = try context.fetch(fetch) as! [VMCategory]
            return result.count > 0
        }catch{
            throw DataError.entityExistsError("判断数据2失败")
        }
    }
    
    func get() throws -> [VMCategory] {
        var categories = [VMCategory]()
       let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: VMCategory.entityName)
        do{
            let result = try context.fetch(fetch) as! [VMCategory]
            for c in result{
                let vm = VMCategory()
                vm.id =  c.id
                vm.image = c.image
                vm.name = c.name
                categories.append(vm)
                
        }
        }catch{
            throw DataError.reanCollectionError("读取聚合数据失败")
        }
        return categories
    }
}
        
//    func delete(id: UUID) throws {
//        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName:
//            VMCategory.entityname)
//        fetch.predicate = NSPredicate(format: "id = %@",
//                                      id.uuidString)
//        let result = try context.fetch(fetch) as! [Category]
//        for m in result {
//            context.delete(m)
//        }
//        app.saveContext()
//    }
