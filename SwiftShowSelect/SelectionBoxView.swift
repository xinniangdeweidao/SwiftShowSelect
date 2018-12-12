//
//  SelectionBoxView.swift
//  EYEE
//
//  Created by 李真 on 2018/12/3.
//  Copyright © 2018年 zali. All rights reserved.
//

import UIKit

enum SelectionBoxBtnType: Int{
    ///全部
    case all = 0
    ///娃哈哈
    case wahaha
    ///三只松鼠
    case sanzhisongshu
    ///面包
    case bread
    ///牛奶
    case milk
}
protocol SelectionBoxBtnClickDelegate: class {
    func SelectionBtnClickWithType(selectionType: SelectionBoxBtnType)
}
class SelectionBoxView: UIView {

    lazy var backBigImgV: UIImageView = {
        let backBigImgV = UIImageView()
        backBigImgV.image = UIImage.init(named: "jiandingshaixuanbg")
        backBigImgV.isUserInteractionEnabled = true
        return backBigImgV
    }()
    
    weak var delegate: SelectionBoxBtnClickDelegate?
    var selectedBtn: UIButton = UIButton()
    let titleArr: [String] = ["全部","娃哈哈","三只松鼠","面包","牛奶"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.isUserInteractionEnabled = true
         backBigImgV.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        self.addSubview(self.backBigImgV)
        for i in 0..<titleArr.count {
            let btn: UIButton = UIButton.init(frame: CGRect(x: 0, y: CGFloat(i) * 31, width: 80, height: 30))
            btn.setTitle(titleArr[i], for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            btn.tag = 10 + i
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.addTarget(self, action: #selector(selectionBtnClick(sender:)), for: .touchUpInside)
            if i == 0{
                btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
                selectedBtn = btn //默认选中
            }
            self.backBigImgV.addSubview(btn)
            if i < 4{
                let line: UIView = UIView.init(frame: CGRect(x: 5, y: CGFloat(i + 1) * 31, width: btn.frame.size.width - 10, height: 1))
                line.center.x = btn.center.x
                line.backgroundColor = UIColor.lightGray
                self.backBigImgV.addSubview(line)
            }
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func configBtnUI(selectedType: SelectionBoxBtnType)  {
        selectedBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        let btn = self.viewWithTag(10 + selectedType.rawValue) as! UIButton
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        selectedBtn = btn
    }
    func showSelectionView(supV: UIView){
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
            self.alpha = 1
            self.layoutIfNeeded()
        }) { (success) in
            supV.addSubview(self)
        }
    }
    func hideSelectionView() {
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
            self.alpha = 0
            self.layoutIfNeeded()
        }) { (success) in
             self.removeFromSuperview()
        }
    }
    @objc func selectionBtnClick(sender: UIButton) {
        selectedBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        selectedBtn = sender
      
        switch sender.tag {
        case 10:
            self.delegate?.SelectionBtnClickWithType(selectionType: .all)
        case 11:
            self.delegate?.SelectionBtnClickWithType(selectionType: .wahaha)
        case 12:
            self.delegate?.SelectionBtnClickWithType(selectionType: .sanzhisongshu)
        case 13:
            self.delegate?.SelectionBtnClickWithType(selectionType: .bread)
        case 14:
            self.delegate?.SelectionBtnClickWithType(selectionType: .milk)
        default:
            self.delegate?.SelectionBtnClickWithType(selectionType: .all)
        }
        hideSelectionView()
    }
}
