//
//  GuideViewController.swift
//  Practice02
//
//  Created by 安静清晨 on 2019/11/21.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit

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
