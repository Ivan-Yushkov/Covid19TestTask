//
//  CustomTableViewCell.swift
//  Covid19TestTask
//
//  Created by Иван Юшков on 07.01.2021.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "cellIdentifier"

    let countryLabel: UILabel = {
        let cl = UILabel()
        cl.numberOfLines = 0
        cl.textColor = .black
        cl.font = UIFont.boldSystemFont(ofSize: 15)
        cl.textAlignment = .center
//        cl.backgroundColor = .systemGray
//        cl.layer.borderColor = UIColor.black.cgColor
//        cl.layer.borderWidth = 0.2
        cl.layer.cornerRadius = cl.frame.height / 10
        return cl
    }()
    
    let newConfirmedLabel: UILabel = {
        let nl = UILabel()
        nl.textColor = .black
        nl.font = UIFont.boldSystemFont(ofSize: 11)
        nl.textAlignment = .center
        return nl
    }()
    
    let totalConfirmedLabel: UILabel = {
        let tl = UILabel()
        tl.textColor = .black
        tl.font = UIFont.boldSystemFont(ofSize: 11)
        tl.textAlignment = .center
        return tl
    }()
    
    let dateLabel: UILabel = {
        let dl = UILabel()
        dl.textColor = .black
        dl.font = UIFont.boldSystemFont(ofSize: 11)
        dl.textAlignment = .center
        return dl
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(countryLabel)
        addSubview(newConfirmedLabel)
        addSubview(totalConfirmedLabel)
        addSubview(dateLabel)
        //backgroundColor = #colorLiteral(red: 0.8004776554, green: 0.7963956601, blue: 0.7968230785, alpha: 1)
        countryLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.left.equalTo(countryLabel.snp.right)
            make.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.33)
        }
        
        newConfirmedLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom)
            make.left.equalTo(countryLabel.snp.right)
            make.height.equalToSuperview().multipliedBy(0.33)
        }
        
        totalConfirmedLabel.snp.makeConstraints { (make) in
            make.top.equalTo(newConfirmedLabel.snp.bottom)
            make.left.equalTo(countryLabel.snp.right)
            make.height.equalToSuperview().multipliedBy(0.33)
        }
        
    }

  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
