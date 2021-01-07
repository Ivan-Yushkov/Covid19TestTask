//
//  WorldCasesView.swift
//  Covid19TestTask
//
//  Created by Иван Юшков on 07.01.2021.
//

import UIKit
import SnapKit

class WorldCasesView: UIView {

    let worldLabel: UILabel = {
        let wl = UILabel()
        wl.textColor = .black
        wl.textAlignment = .center
        wl.font = UIFont.boldSystemFont(ofSize: 20)
        wl.text = "World"
        return wl
    }()
    
    let newConfirmedLabel: UILabel = {
        let nl = UILabel()
        nl.numberOfLines = 0
        nl.textColor = .black
        nl.textAlignment = .center
        nl.font = UIFont.boldSystemFont(ofSize: 15)
        return nl
    }()
    
    let totalConfirmedLabel: UILabel = {
        let tl = UILabel()
        tl.numberOfLines = 0
        tl.textColor = .black
        tl.textAlignment = .center
        tl.font = UIFont.boldSystemFont(ofSize: 15)
        return tl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        //backgroundColor = #colorLiteral(red: 0.8805001704, green: 0.9070980107, blue: 0.9245061528, alpha: 1)
        addSubview(worldLabel)
        addSubview(newConfirmedLabel)
        addSubview(totalConfirmedLabel)
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.4
        worldLabel.isHidden = true
       
        worldLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
        newConfirmedLabel.snp.makeConstraints { (make) in
            make.top.equalTo(worldLabel.snp.bottom)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        
        totalConfirmedLabel.snp.makeConstraints { (make) in
            make.top.equalTo(worldLabel.snp.bottom)
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalTo(newConfirmedLabel.snp.right)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
