//
//  GYTableViewCell.swift
//  tableviewShow---swift
//
//  Created by GeYang on 2017/1/5.
//  Copyright © 2017年 GeYang. All rights reserved.
//

import UIKit

let WIDTH = UIScreen.main.bounds.size.width;

class GYTableViewCell: UITableViewCell {
    var name : UILabel!;
    var selectedBtn : UIButton?;
    var line : UIView?;
    var titleView : UIView?;
    var title : UILabel!;
    var tableview : UITableView!;
    var models : GYModel!;
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.create();
    }

    //创建页面
    func create() -> Void {
        name = UILabel.init(frame: CGRect(x : 10, y : 10, width : 60, height : 20));
        name.font = UIFont.systemFont(ofSize: 14);
        name.text = "geyang";
        self.contentView.addSubview(name);
        
        selectedBtn = UIButton.init(frame: CGRect(x : WIDTH - 50, y : 0, width : 70, height : 50));
        selectedBtn?.setImage(UIImage.init(named: "下标黑.png"), for: .normal);
        selectedBtn?.transform = CGAffineTransform.init(rotationAngle: CGFloat(M_PI));
        selectedBtn?.addTarget(self, action: #selector(jump), for: .touchUpInside);
        self.contentView.addSubview(selectedBtn!);
        
        line = UIView.init(frame: CGRect(x : 0, y : name.frame.origin.y + name.frame.size.height + 5, width : 10, height : 2))
        line?.backgroundColor = UIColor.red;
        self.contentView.addSubview(line!);
        
        titleView = UIView.init(frame: CGRect(x : 0, y : 50 - 2, width : WIDTH, height : 2));
        titleView?.clipsToBounds = true;
        titleView?.backgroundColor = UIColor.white;
        self.contentView.addSubview(titleView!);
        
        title = UILabel.init(frame: CGRect(x : 10, y : 5, width : (titleView?.frame.size.width)! - 20, height : 0));
        title.numberOfLines = 0;
        title.textAlignment = .center;
        title.textColor = UIColor.darkGray.withAlphaComponent(0.4);
        title.font = UIFont.systemFont(ofSize: 14);
        titleView?.addSubview(title);
    }
    
    //展开按钮点击事件
    func jump() -> Void {
        if models.isShow! {
            //表示当前展开  需要合并
            models.isShow = false;
            models.height = 50;
            tableview.beginUpdates();
            tableview.endUpdates();
            UIView .animate(withDuration: 0.5, animations: {
                self.name.frame = CGRect(x : 10, y : 10, width : self.getNameWidth().width, height : 20);
                self.line?.frame = CGRect(x : 0, y : self.name.frame.origin.y + self.name.frame.size.height + 5, width : 10, height : 2);
                self.titleView?.frame = CGRect(x : 0, y : 50 - 2, width : WIDTH, height : 2);
                self.title.frame = CGRect(x : 10, y : 5, width : (self.titleView?.frame.size.width)! - 20, height : 0);
                self.selectedBtn?.transform = CGAffineTransform.init(rotationAngle: CGFloat(M_PI));
            })
        }else{
            //当前合并   需要展开
            models.isShow = true;
            models.height = (titleView?.frame.origin.y)! + title.frame.origin.y + self.getContext().height + 5;
            tableview.beginUpdates();
            tableview.endUpdates();
            UIView .animate(withDuration: 0.5, animations: { 
                self.name.frame = CGRect(x : WIDTH / 2 - self.getNameWidth().width / 2, y : 10, width : self.getNameWidth().width, height : 20)
                self.line?.frame = CGRect(x : 0, y : self.name.frame.origin.y + self.name.frame.size.height + 5, width : WIDTH, height : 2);
                self.titleView?.frame = CGRect(x : 0, y : 50 - 2, width : WIDTH, height : self.title.frame.origin.y + self.getContext().height + 5);
                self.title.frame = CGRect(x : 10, y : 5, width : (self.titleView?.frame.size.width)! - 20, height : self.getContext().height);
                self.selectedBtn?.transform = CGAffineTransform.identity;
            });
        }
    }

    //配置数据
    func loadData(data : GYModel) -> Void{
        models = data;
        name.text = models.name! as String;
        title.text = models.titleView! as String;
        if models.isShow! {
            //表示当前为展开状态
            self.name.frame = CGRect(x : WIDTH / 2 - self.getNameWidth().width / 2, y : 10, width : self.getNameWidth().width, height : 20);
            self.line?.frame = CGRect(x : 0, y : self.name.frame.origin.y + self.name.frame.size.height + 5, width : WIDTH, height : 2);
            self.selectedBtn?.transform = CGAffineTransform.identity;
            self.titleView?.frame = CGRect(x : 0, y : 50 - 2, width : WIDTH, height : self.title.frame.origin.y + self.getContext().height + 5);
            self.title.frame = CGRect(x : 10, y : 5, width : (titleView?.frame.size.width)! - 20, height : self.getContext().height);
        }else{
            //表示当前为合并状态
            self.name.frame = CGRect(x : 10, y : 10, width : self.getNameWidth().width, height : 20);
            self.line?.frame = CGRect(x : 0, y : self.name.frame.origin.y + self.name.frame.size.height + 5, width : 10, height : 2);
            self.titleView?.frame = CGRect(x : 0, y : 50 - 2, width : WIDTH, height : 2);
            self.title.frame = CGRect(x : 10, y : 5, width : (titleView?.frame.size.width)! - 20, height : 0);
            self.selectedBtn?.transform = CGAffineTransform.init(rotationAngle: CGFloat(M_PI));
        }
    }
    
    //获取名称的宽度
    func getNameWidth() -> CGSize {
        return name.sizeThatFits(CGSize(width : WIDTH, height : CGFloat(MAXFLOAT)));
    }
    
    //获取文字的高度
    func getContext() -> CGSize {
        return title.sizeThatFits(CGSize(width : WIDTH - 20, height : CGFloat(MAXFLOAT)));
    }
    
}
