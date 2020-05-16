//
//  DetailPageUIView.swift
//  ELeMel
//
//  Created by thomas on 2020/5/11.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class DetailPageUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    var titleView: DetailPageTitleUIView?
    var contentView: DetailPageContentUIView?
    
    let DetailPageUIViewHeight = 800
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initView()
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initView(){
        let titleViewFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44)
        titleView = DetailPageTitleUIView(frame: titleViewFrame)
        
        let contentViewFrame = CGRect(x: 0, y: 44, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 88 - 44)
        contentView = DetailPageContentUIView(frame: contentViewFrame)
        
        self.addSubview(contentView!)
        self.addSubview(titleView!)

        
        
    }
    
    
    
    
}
