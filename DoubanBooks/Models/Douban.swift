//
//  Douban.swift
//  DoubanBooks
//
//  Created by wang on 2019/10/12.
//  Copyright © 2019年 wang. All rights reserved.
//

import UIKit

class Douban {
    var id:UUID
    var categoryId:String?
    var title:String?
    var author:String?
    var isbn10:String?
    var isbn13:String?
    var publisher:String?
    var pubdate:String?
    var summary:String?
    var page:Int32?
    var price:Float?
    var image:String?
    var autorINtro:String?
    
    
    
    
    
    
   
    
    init(categoryId:String,title:String,author:String,isbn10:String,isbn13:String,publisher:String,pubdate:String,summary:String,page:Int32,image:String,autorINtro:String,price:Float){
        self.id=UUID()
        self.categoryId=categoryId
        self.title=title
        self.author=author
        self.isbn10=isbn10
        self.isbn13=isbn13
        self.publisher=publisher
        self.pubdate=pubdate
        self.summary=summary
        self.page=page
        self.image=image
        self.autorINtro=autorINtro
        self.price=price
    }
    
    init(){
        self.id=UUID()
    }

}
