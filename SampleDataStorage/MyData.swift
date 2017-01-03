//
//  MyData.swift
//  SampleDataStorage
//
//  Created by Nobuto Hachiya on 2017/01/03.
//  Copyright © 2017年 Nobuto Hachiya. All rights reserved.
//

import Foundation

class MyData: NSObject, NSCoding {
    var valueString: String?
    
    override init() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        valueString = aDecoder.decodeObject(forKey: "valueString") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(valueString, forKey: "valueString")
        
    }
}
