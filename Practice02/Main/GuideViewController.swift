//
//  GuideViewController.swift
//  Practice02
//
//  Created by 安静清晨 on 2019/11/21.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit
import Moya
import RxSwift

class GuideViewController: UIViewController {
    
    @IBOutlet weak var logBtn: UIButton!
    
    @IBOutlet weak var enterBtn: UIButton!
    
    @IBAction func toEnter(_ sender: Any) {
        
        if self.enterMain != nil {
            self.enterMain!()
        }
        
    }
    
    
    @IBAction func toLog(_ sender: Any) {
        if self.enterLog != nil {
            self.enterLog!()
        }
    }
    
    var enterMain: (() -> ())?
    var enterLog: (() -> ())?
    
    
    lazy var scroll = UIScrollView(frame: view.bounds)
    lazy var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
        setupScrollview()
        
        ///1. moya简单使用
        //        testMoya()
        
        ///2. moya使用 +  错误处理
        //        testMoya2()
        
        ///3. moya + Rxswift 简单使用
//        moyaRxSwift()
        
        ///4.handyJSON
        handyJSON()
    }
    
    func handyJSON(){
        let provider = MoyaProvider<SongService>()
        provider.rx
            .request(.detail(id: "20"))
            .asObservable()
            .mapModel(SongWrapper.self).subscribe(onNext: { (model) in
                print(model.data.title!)
                print(model.data.user?.nickname! ?? "")
            })
    }
    
    
    func moyaRxSwift(){
        let provider = MoyaProvider<SongService>()
        provider
            .rx
            .request(.detail(id: "1"))
            .subscribe(onSuccess: { (response) in
            //请求成功
            let data = response.data
            let code = response.statusCode
            
            //将data转为字符串
            let dataString=String(data: data, encoding: .utf8)
            
            print("RegisterController request sheet detail success:\(code),\(dataString)")
            
            let sheetWrapper = SongWrapper.deserialize(from: dataString)
                print(sheetWrapper?.data.title!)
                
                
        }) { (error) in
            print(error)
        }
    }
    
    
    ///加上请求错误判断
    func testMoya2(){
        ///加上错误判断
        print("testMoya-error")
        let provider = MoyaProvider<SongService>(plugins:[NetworkLoggerPlugin()])
        provider.request(.detail(id: "100000")) { (result) in
            switch result {
            case let .success(response):
                //请求成功
                let data = response.data
                let code = response.statusCode
                
                //将data转为字符串
                let dataString=String(data: data, encoding: .utf8)
                
                print("RegisterController request sheet detail success:\(code),\(dataString)")
                
            case let .failure(error):
                //请求失败
                print("RegisterController request sheet detail failed:\(error)")
                
                //错误类型转为MoyaError
                let error=error as! MoyaError
                
                //MoyaError是一个枚举
                switch error {
                case .imageMapping(let response):
                    print("图片解析错误")
                case .jsonMapping(let response):
                    print("JSON解析错误")
                case .statusCode(let response):
                    print("状态错误")
                case .stringMapping(let response):
                    print("字符串映射错误")
                case .underlying(let nsError as NSError, let response):
                    print("这里将错误转为了NSError")
                    
                    switch nsError.code {
                    case NSURLErrorNotConnectedToInternet:
                        print("网络不太好，请稍后再试！")
                    case NSURLErrorTimedOut:
                        print("连接超时，请稍后再试！")
                    default:
                        print("未知错误，请稍后再试！")
                    }
                    
                case .objectMapping(_, _):
                    print("对象解码错误")
                case .encodableMapping(_):
                    print("对象编码错误")
                case .requestMapping(_):
                    print("请求映射错误")
                case .parameterEncoding(_):
                    print("参数编码错误")
                }
                
            }
            
        }
        
        
    }
    
    func testMoya(){
        print("testMoya")
        
        
        //moya插件
        let networkActivityPlugin=NetworkActivityPlugin(networkActivityClosure: { (changeType, targetType) in
            //changeType类型是NetworkActivityChangeType
            //通过它能监听到开始请求和结束请求
            
            //targetType类型是TargetType
            //就是我们这里的service
            //通过它能判断是那个请求
            
            if NetworkActivityChangeType.began==changeType{
                //开始请求
                print("began request:\(targetType.path)")
                //可以放置请求动画  转圈
            }else{
                //结束请求
                print("end request:\(targetType.path)")
                //移除请求动画
            }
            
        })
        
        
        
        
        
        let provider = MoyaProvider<SongService>(plugins:[NetworkLoggerPlugin(),networkActivityPlugin])
        provider.request(.detail(id: "1")) { (result) in
            //result类型是Result<Response, MoyaError>
            switch result {
            case let .success(response):
                //请求成功
                let data = response.data
                let code = response.statusCode
                
                //将data转为String
                //data的类型为Data
                let dataString = String(data: data, encoding: String.Encoding.utf8)
                print("RegisterController request song detail succes:\(code),\(dataString)")
            case let .failure(error):
                //请求失败
                print("RegisterController request song detail failed:\(error)")
            }
        }
        
        
    }
    
    func setupScrollview(){
        view.addSubview(scroll)
        scroll.contentSize = CGSize(width: view.bounds.width * 3, height: 0)
        for i in 0...2 {
            let iv = UIImageView(image: UIImage(named: "scroll_0\(i+1)"))
            scroll.addSubview(iv)
            iv.frame = CGRect(x: Int(view.bounds.width) * i, y: 0, width: Int(view.bounds.width), height: Int(view.bounds.height))
        }
        view.sendSubviewToBack(scroll)
        // 以上为最基本  必须有一个contentSize.
        
        //去掉边界滑动指示
        scroll.showsHorizontalScrollIndicator = false
        //分页
        scroll.isPagingEnabled = true
        //分页符
        pageControl.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 40)
        pageControl.center = CGPoint(x: view.center.x, y: view.bounds.height - 350)
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        pageControl.currentPage = 0
        pageControl.numberOfPages = 3
        pageControl.addTarget(self, action: #selector(changePage), for: .valueChanged)
        view.addSubview(pageControl)
        //代理
        scroll.delegate = self
    }
    
    @objc func changePage(){
        scroll.setContentOffset(CGPoint(x: Int(view.bounds.width) * pageControl.currentPage, y: 0), animated: true)
        print(pageControl.currentPage)
    }
    
    func setupButtons(){
        enterBtn.layer.cornerRadius = CGFloat(SIZE_MAINBUTTON_RADIUS)
        enterBtn.clipsToBounds = true
        enterBtn.layer.borderWidth = 1.0
        enterBtn.layer.borderColor = UIColor.init(red: 90.0/255.0, green: 165.0/255.0, blue: 39.0/255.0, alpha: 1).cgColor
        logBtn.layer.cornerRadius = CGFloat(SIZE_MAINBUTTON_RADIUS)
        logBtn.clipsToBounds = true
    }
}

extension GuideViewController : UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / view.bounds.width)
    }
    
}
