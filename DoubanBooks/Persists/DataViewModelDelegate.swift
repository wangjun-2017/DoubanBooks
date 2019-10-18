//
//  DataViewModelDelegate.swift
//  DoubanBooks
//
//  Created by wang on 2019/10/15.
//  Copyright © 2019年 wang. All rights reserved.
//

import Foundation
import CoreData
protocol DataViewModelDelegate {
    
    ///视图模型必须具有id属性
    var id: UUID{get}
    ///
    static var entityName: String{get}
    ///视图模型对应的CoreData Entity属性与对应的视图模型对象的属性值集合
    ///
    /// - returns：key是CoreData Entity的各个属性的名称，Any是对于的值
    func entityPairs() -> Dictionary<String,Any?> 
   
    ///根据查询结果组装视图模型对象
    ///
    /// - parameter result： fetch方法查询结果
    func packageSelf(result:NSFetchRequestResult)
}
