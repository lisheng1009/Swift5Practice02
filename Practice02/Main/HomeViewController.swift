//
//  HomeViewController.swift
//  使用纯Alamofire进行网络请求, 手动解析JSON
//
//  Created by 安静清晨 on 2019/11/21.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit
import MJRefresh

class HomeViewController: UIViewController {
    
    var page : Int = 1
    lazy var tableview = UITableView()
    lazy var dataArray2 : [QiuBaiModel] = [QiuBaiModel]()

    let advString = "http://m2.qiushibaike.com/article/list/imgrank"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        //basic
        setupTableView()
        loadData()
        
        //refresh
        tableview.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: self.loadMoreData)
    }
    
    func loadMoreData(){
        NetworkTool.requestData(urlString: advString, type: .GET, paras: ["page": page + 1, "count" : 10]) { (respnse) in
            
            let resultDict = respnse as? [String:NSObject]
            let items = resultDict!["items"] as? [[String:NSObject]]
            for item in items! {
               let model = QiuBaiModel(dict: item)
                self.dataArray2.append(model)
                print(model.name)
                }
            self.tableview.reloadData()
            self.tableview.mj_footer.endRefreshing()
            self.page += 1
        }
    }
    
    func loadData(){
        NetworkTool.requestData(urlString: advString, type: .GET, paras: ["page": 1, "count" : 10]) { (respnse) in
            
            let resultDict = respnse as? [String:NSObject]
            let items = resultDict!["items"] as? [[String:NSObject]]
            for item in items! {
               let model = QiuBaiModel(dict: item)
                self.dataArray2.append(model)
                print(model.name)
                }
            self.tableview.reloadData()
        }
    }
    
    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "QiuBaiTableViewCell", bundle: nil), forCellReuseIdentifier: "QBCell")
        tableview.frame = view.bounds
        view.addSubview(tableview)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "QBCell") as! QiuBaiTableViewCell
                
                let model = dataArray2[indexPath.row]
                cell.name.text = model.name
                cell.content.text = model.content
                cell.userId.text = model.userId
                cell.selectionStyle = .none
                return cell
        
        

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        80
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
}

