//
//  GYModel.swift
//  tableviewShow---swift
//
//  Created by GeYang on 2017/1/5.
//  Copyright © 2017年 GeYang. All rights reserved.
//

import UIKit


class GYModel: NSObject {
    
    var name : NSString!;
    var titleView : NSString!;
    var isShow : Bool!;
    var height : CGFloat!;
    
    init(dict : NSDictionary){
        super.init();
        name = dict.value(forKey: "name") as! NSString!;
        titleView = dict.value(forKey: "titleView") as! NSString!;
        isShow = false;
        height = 50;
    }
}
