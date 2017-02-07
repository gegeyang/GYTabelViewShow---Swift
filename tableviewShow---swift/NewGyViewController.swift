//
//  NewGyViewController.swift
//  tableviewShow---swift
//
//  Created by GeYang on 2017/1/5.
//  Copyright © 2017年 GeYang. All rights reserved.
//

import UIKit

class NewGyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var GYtaleview : UITableView?;
    var muarr : NSMutableArray? = [];
    var arr : NSArray? = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        arr = [ ["name":"名", "titleView":"哈哈哈哈哈哈"],
                ["name":"名称2名称2名称2名称2", "titleView":"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈"],
                ["name":"名称3", "titleView":"哈"]
        ];

        for dic in arr! {
            //创建模型类
            muarr?.add(GYModel.init(dict: dic as! NSDictionary))
        }
        
        //创建tableview
        GYtaleview = UITableView.init(frame: CGRect(x : 0, y : 0, width : UIScreen.main.bounds.size.width, height : UIScreen.main.bounds.size.height), style: .plain);
        GYtaleview?.delegate = self;
        GYtaleview?.dataSource = self;
        GYtaleview?.tableFooterView = UIView.init();
        GYtaleview?.separatorStyle = .none;
        self.view.addSubview(GYtaleview!);
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (muarr?.count)!;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        GYtaleview?.register(GYTableViewCell.classForCoder(), forCellReuseIdentifier: "cell");
        let cell : GYTableViewCell = GYTableViewCell.init(style: .default, reuseIdentifier: "cell");
        cell.selectionStyle = .none;
        cell.tableview = GYtaleview;
        cell.loadData(data: muarr?[indexPath.row] as! GYModel);
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let models = muarr?[indexPath.row] as! GYModel!;
        return (models?.height)!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
    }
    
}
