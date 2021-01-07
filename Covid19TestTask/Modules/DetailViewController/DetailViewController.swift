//
//  DetailViewController.swift
//  Covid19TestTask
//
//  Created by Иван Юшков on 07.01.2021.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {

    public var country: CountryData!
    
    //MARK: - instances of UI elements
    private let countryLabel: UILabel = {
        let cl = UILabel()
        cl.textAlignment = .center
        cl.textColor = .black
        cl.font = UIFont.boldSystemFont(ofSize: 25)
        return cl
    }()
    
    private let newConfirmedLabel: UILabel = {
        let nl = UILabel()
        nl.textAlignment = .center
        nl.layer.borderWidth = 0.4
        nl.layer.borderColor = UIColor.black.cgColor
        nl.textColor = .black
        nl.font = UIFont.boldSystemFont(ofSize: 15)
        nl.layer.cornerRadius = 15
        return nl
    }()
    
    private let totalConfirmedLabel: UILabel = {
        let tl = UILabel()
        tl.textAlignment = .center
        tl.layer.borderWidth = 0.4
        tl.layer.borderColor = UIColor.black.cgColor
        tl.textColor = .black
        tl.font = UIFont.boldSystemFont(ofSize: 15)
        tl.layer.cornerRadius = 15
        return tl
    }()
    
    private let newDeathLabel: UILabel = {
        let nd = UILabel()
        nd.textAlignment = .center
        nd.layer.borderWidth = 0.4
        nd.layer.borderColor = UIColor.black.cgColor
        nd.textColor = .black
        nd.font = UIFont.boldSystemFont(ofSize: 15)
        nd.layer.cornerRadius = 15
        return nd
    }()
    
    private let totalDeathLabel: UILabel = {
        let td = UILabel()
        td.textAlignment = .center
        td.layer.borderWidth = 0.4
        td.layer.borderColor = UIColor.black.cgColor
        td.textColor = .black
        td.font = UIFont.boldSystemFont(ofSize: 15)
        td.layer.cornerRadius = 15
        return td
    }()
    
    private let newRecoveredLabel: UILabel = {
        let nr = UILabel()
        nr.textAlignment = .center
        nr.layer.borderWidth = 0.4
        nr.layer.borderColor = UIColor.black.cgColor
        nr.textColor = .black
        nr.font = UIFont.boldSystemFont(ofSize: 15)
        nr.layer.cornerRadius = 15
        return nr
    }()
    
    private let totalRecoveredLabel: UILabel = {
        let tr = UILabel()
        tr.textAlignment = .center
        tr.layer.borderWidth = 0.4
        tr.layer.borderColor = UIColor.black.cgColor
        tr.textColor = .black
        tr.font = UIFont.boldSystemFont(ofSize: 15)
        tr.layer.cornerRadius = 15
        return tr
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewElements()
        setupInterface()
    }
    
    //MARK: - Setup View elemets
    
    private func setupViewElements() {
        view.backgroundColor = .white
        view.addSubview(countryLabel)
        view.addSubview(newConfirmedLabel)
        view.addSubview(totalConfirmedLabel)
        view.addSubview(newDeathLabel)
        view.addSubview(totalDeathLabel)
        view.addSubview(newRecoveredLabel)
        view.addSubview(totalRecoveredLabel)
        
        countryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(view).multipliedBy(0.1)
            make.centerX.equalToSuperview()
        }
        
        newConfirmedLabel.snp.makeConstraints { (make) in
            make.top.equalTo(countryLabel.snp.bottom).offset(view.bounds.height / 7)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview().multipliedBy(0.05)
            make.centerX.equalToSuperview()
        }
        
        totalConfirmedLabel.snp.makeConstraints { (make) in
            make.top.equalTo(newConfirmedLabel.snp.bottom).offset(15)
            make.width.equalTo(newConfirmedLabel)
            make.height.equalTo(newConfirmedLabel)
            make.centerX.equalToSuperview()
        }
        
        newDeathLabel.snp.makeConstraints { (make) in
            make.top.equalTo(totalConfirmedLabel.snp.bottom).offset(15)
            make.width.equalTo(newConfirmedLabel)
            make.height.equalTo(newConfirmedLabel)
            make.centerX.equalToSuperview()
        }
        
        totalDeathLabel.snp.makeConstraints { (make) in
            make.top.equalTo(newDeathLabel.snp.bottom).offset(15)
            make.width.equalTo(newConfirmedLabel)
            make.height.equalTo(newConfirmedLabel)
            make.centerX.equalToSuperview()
        }
        
        newRecoveredLabel.snp.makeConstraints { (make) in
            make.top.equalTo(totalDeathLabel.snp.bottom).offset(15)
            make.width.equalTo(newConfirmedLabel)
            make.height.equalTo(newConfirmedLabel)
            make.centerX.equalToSuperview()
        }
        
        totalRecoveredLabel.snp.makeConstraints { (make) in
            make.top.equalTo(newRecoveredLabel.snp.bottom).offset(15)
            make.width.equalTo(newConfirmedLabel)
            make.height.equalTo(newConfirmedLabel)
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: - Setup interface method
    func setupInterface() {
        countryLabel.text = country.country
        newConfirmedLabel.text = country.newConfirmedText
        totalConfirmedLabel.text = country.totalConfirmedText
        newRecoveredLabel.text = country.newRecoveredText
        totalRecoveredLabel.text = country.totalRecoveredText
        newDeathLabel.text = country.newDeathText
        totalDeathLabel.text = country.totalDeathText
    }
}
