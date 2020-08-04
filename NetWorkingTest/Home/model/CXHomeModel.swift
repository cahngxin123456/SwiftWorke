
//
//  CXHomeModel.swift
//  NetWorkingTest
//
//  Created by changmacpor on 2020/4/14.
//  Copyright © 2020 changmacpor. All rights reserved.
//

import UIKit

//class CXHomeModel:NSObject, Mappable  {
//    var code : Int?
//    var msg : String?
//    var data : CXHomeModelData?
//    
//    required init?(map: Map) {
//        
//    }
//    
//    func mapping(map: Map) {
//        data            <- map["data"]
//        code            <- map["code"]
//        msg             <- map["msg"]
//    }
//}
//class CXHomeModelData:NSObject, Mappable  {
//    var products : [CXProductsData]?
//    
//    
//    required init?(map: Map) {
//        
//    }
//    
//    func mapping(map: Map) {
//        products      <- map["products"]
//    }
//}
//class CXProductsData:NSObject, Mappable  {
//    var product_id : String?
//    var thumb : String?
//    var name : String?
//    //    var description : String?
//    var price : String?
//    var special : String?
//    var rating : String?
//    var href : String?
//    
//    
//    required init?(map: Map) {
//        
//    }
//    
//    
//    func mapping(map: Map) {
//        product_id       <- map["product_id"]
//        thumb            <- map["thumb"]
//        name             <- map["name"]
//        price            <- map["price"]
//        special          <- map["special"]
//        rating           <- map["rating"]
//        href             <- map["href"]
//        
//    }
//}
class CXHomeModel: Mappable {
    var code: Int = 0
    var msg: String?
    var data: CXHomeModelData?

    required init?(map: Map) {}

    func mapping(map: Map) {
        code   <- map["code"]
        msg   <- map["msg"]
        data   <- map["data"]
    }
}

class CXHomeModelData: Mappable {
    var products = [Products]()
    var store: Store?

    required init?(map: Map) {}

    func mapping(map: Map) {
        products   <- map["products"]
        store   <- map["store"]
    }
}

class Store: Mappable {
    var name: String?
    var store_id: Int = 0
    var url: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        name   <- map["name"]
        store_id   <- map["store_id"]
        url   <- map["url"]
    }
}

class Options: Mappable {
    var product_option_value = [Product_option_value]()
    var product_option = [Product_option]()

    required init?(map: Map) {}

    func mapping(map: Map) {
        product_option_value   <- map["product_option_value"]
        product_option   <- map["product_option"]
    }
}

class Product_option_value: Mappable {
    var product_encode: String?
    var product_option_value_id: String?
    var price: String?
    var quantity: String?
    var sort_order: String?
    var option_value_id: String?
    var image: String?
    var option_prev_name: String?
    var option_last_name: String?
    var group_buy_price: String?
    var product_option_description_id: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        product_encode   <- map["product_encode"]
        product_option_value_id   <- map["product_option_value_id"]
        price   <- map["price"]
        quantity   <- map["quantity"]
        sort_order   <- map["sort_order"]
        option_value_id   <- map["option_value_id"]
        image   <- map["image"]
        option_prev_name   <- map["option_prev_name"]
        option_last_name   <- map["option_last_name"]
        group_buy_price   <- map["group_buy_price"]
        product_option_description_id   <- map["product_option_description_id"]
    }
}

class Product_option_description: Mappable {
    var name: String?
    var product_option_description_id: String?
    var out_stock: Int = 0

    required init?(map: Map) {}

    func mapping(map: Map) {
        name   <- map["name"]
        product_option_description_id   <- map["product_option_description_id"]
        out_stock   <- map["out_stock"]
    }
}

class Product_option: Mappable {
    var product_option_description = [Product_option_description]()
    var name: String?
    var product_option_id: String?
    var sort_order: String?
    var out_stock: Int = 0
    var required: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        product_option_description   <- map["product_option_description"]
        name   <- map["name"]
        product_option_id   <- map["product_option_id"]
        sort_order   <- map["sort_order"]
        out_stock   <- map["out_stock"]
        required   <- map["required"]
    }
}

class Products: Mappable {
    var rating: Int = 0
    var special: String?
    var description: String?
    var href: String?
    var name: String?
    var thumb: String?
    var product_id: String?
    var options: Options?
    var price: String?
    var customer_image: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        rating   <- map["rating"]
        special   <- map["special"]
        description   <- map["description"]
        href   <- map["href"]
        name   <- map["name"]
        thumb   <- map["thumb"]
        product_id   <- map["product_id"]
        options   <- map["options"]
        price   <- map["price"]
        customer_image   <- map["customer_image"]
    }
}
