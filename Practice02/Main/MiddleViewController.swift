//
//  MiddleViewController.swift
//  使用Moya进行网络请求, 假如rRxSwift响应式处理, 使用HandyJSON解析请求结果
//
//  Created by 安静清晨 on 2019/12/08.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//



import UIKit
import Moya
import RxSwift
import MBProgressHUD

class MiddleViewController: UIViewController {
    var songArray:[SongModel2]?
    lazy var tableview = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        setupTableView()
        nine()
    }
    
    func nine(){
        let mb = MBProgressHUD.showAdded(to: view, animated: true)
        mb.label.text = "loading"
        mb.mode = .text
    let provider = MoyaProvider<SongService>()
    provider
        .rx
        .request(.detail(id: "1"))
        .asObservable()
        .mapObjectArray(SongModel2.self, designatedPath: "data.songs").subscribe(onNext: { (res) in
//            print(res!)
            MBProgressHUD.hide(for: self.view, animated: true)
            self.songArray = res
            self.tableview.reloadData()
            }, onError: { (error) in
                
                let mb = MBProgressHUD.showAdded(to: self.view, animated: true)
                mb.label.text = error.localizedDescription
                mb.mode = .text
                mb.hide(animated: true, afterDelay: 3)
//                print(SLError.SLRequestFailed(error: error))
            }, onCompleted: {
                
            }) {
                
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


extension MiddleViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QBCell") as! QiuBaiTableViewCell
        
        let model = songArray![indexPath.row]
        cell.name.text = model.title
        cell.content.text = model.banner
        cell.userId.text = model.uri
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}


extension MiddleViewController:UITableViewDelegate{
    
}
