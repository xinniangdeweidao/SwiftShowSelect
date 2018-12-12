//
//  ViewController.swift
//  SwiftShowSelect
//
//  Created by 李真 on 2018/12/12.
//  Copyright © 2018年 李真. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /// 屏幕宽度
    let screenWidth: CGFloat = UIScreen.main.bounds.size.width
    /// 屏幕高度
    let screenHeight: CGFloat = UIScreen.main.bounds.size.height
    lazy var selectBtn: UIButton = {
        let selectBtn = UIButton.init(type: .custom)
        selectBtn.frame = CGRect(x: 100, y: 100, width: 100, height: 20)
        selectBtn.setTitle("全部", for: .normal)
        selectBtn.setTitleColor(UIColor.black, for: .normal)
        selectBtn.titleLabel?.textAlignment = .right
        selectBtn.addTarget(self, action: #selector(selectBtnClick), for: .touchUpInside)
        return selectBtn
    }()
    
    lazy var selectionBoxV: SelectionBoxView = {
        let selectionBoxV = SelectionBoxView.init(frame: CGRect(x:  selectBtn.frame.origin.x + 10, y:  selectBtn.frame.origin.y + 20, width: 80, height: 154))
        selectionBoxV.delegate = self
        selectionBoxV.alpha = 0
        return selectionBoxV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(selectBtn)
    }
    @objc func selectBtnClick(){
        
        let rect2 = selectBtn.frame
        self.selectionBoxV.frame = CGRect(x: rect2.origin.x, y: rect2.origin.y + 20, width: 80, height: self.selectionBoxV.frame.size.height)
        self.selectionBoxV.showSelectionView(supV: self.view)
        
    }
    func updateTopSelectBtnWidth(titleStr: String){
        selectBtn.setTitle(titleStr, for: .normal)
    }
}
//MARK: - SelectionBoxBtnClickDelegate
extension ViewController: SelectionBoxBtnClickDelegate {
    func SelectionBtnClickWithType(selectionType: SelectionBoxBtnType) {
        print(selectionType.rawValue)
        switch selectionType {
        case .all:
            selectBtn.setTitle(selectionBoxV.titleArr[0], for: .normal)
        case .wahaha:
            selectBtn.setTitle(selectionBoxV.titleArr[1], for: .normal)
        case .sanzhisongshu:
            selectBtn.setTitle(selectionBoxV.titleArr[2], for: .normal)
        case .bread:
            selectBtn.setTitle(selectionBoxV.titleArr[3], for: .normal)
        case .milk:
            selectBtn.setTitle(selectionBoxV.titleArr[4], for: .normal)
        }
    }
}

