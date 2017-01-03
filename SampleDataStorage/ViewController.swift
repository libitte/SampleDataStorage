//
//  ViewController.swift
//  SampleDataStorage
//
//  Created by Nobuto Hachiya on 2017/01/03.
//  Copyright © 2017年 Nobuto Hachiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 画面表示時にデータを格納
        let userDefaults = UserDefaults.standard
        let data = MyData()
        data.valueString = "test"
        
        // シリアライズ処理
        let archiveData = NSKeyedArchiver.archivedData(withRootObject: data)
        userDefaults.set(archiveData, forKey: "data")
        userDefaults.synchronize()
        

        if let storedData = userDefaults.object(forKey: "data") as? Data {
            if let unarchivedData = NSKeyedUnarchiver.unarchiveObject(with: storedData) as? MyData {
                if let valueString = unarchivedData.valueString {
                    print("デシリアライズデータ: " + valueString)
                }

            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


//    @IBAction func tapActionButton(_ sender: Any) {
//        let userDefaults = UserDefaults.standard
//        userDefaults.set(textField.text, forKey: "data")
//        userDefaults.synchronize()
//    }
}

