//
//  ViewController.swift
//  Covid19TestTask
//
//  Created by Иван Юшков on 07.01.2021.
//

import UIKit
import SnapKit

protocol MainViewControllerProtocol: class {
    func updateInterface(currentSummary: [CountryData], global: GlobalData)
    func showActivityIndicator(message: String)
    func hideActivityIndicator()
}

class MainViewController: UIViewController, MainViewControllerProtocol {

    public var presenter: PresenterMainVCProtocol?
    private var tableView: UITableView!
    private var countries: [CountryData]?
    private let spinner = SpinnerViewController()
    private var worldView: WorldCasesView!
   
    override func loadView() {
        super.loadView()
        addChild(spinner)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfiguratorMainVC().configure(view: self, networking: DI.resolve())
        presenter?.getCurrentSummary()
        setupWorldView()
        setupTableView()
        tableView.delegate = self
        tableView.dataSource = self
        showActivityIndicator(message: "Loading")
    }
    
    //MARK: - Methods for setup view
    private func setupTableView() {
        title = "The whole world cases"
        tableView = UITableView()
        tableView.separatorInset.right = 15
        tableView.separatorColor = .black
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(worldView.snp.bottom)
            make.bottom.left.right.equalToSuperview()
        }
    }
    
    private func setupWorldView() {
        worldView = WorldCasesView()
        view.addSubview(worldView)
        worldView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view)
            make.height.equalTo(view.bounds.height / 9)
        }
    }
    
    //MARK: - Methods of mainVC protocol
    public func updateInterface(currentSummary: [CountryData], global: GlobalData) {
        DispatchQueue.main.async { [weak self] in
            self?.countries = currentSummary
            self?.tableView.reloadData()
            self?.worldView.newConfirmedLabel.text = global.newConfirmedText
            self?.worldView.totalConfirmedLabel.text = global.totalConfirmedText
            self?.worldView.worldLabel.isHidden = false
        }
    }
    
    public func showActivityIndicator(message: String) {
        spinner.show(with: message, self)
    }
    
    public func hideActivityIndicator() {
        spinner.hide()
    }

}

//MARK: - methos for table view delegate & data source
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell
        cell.countryLabel.text = countries?[indexPath.row].countryName
        cell.dateLabel.text = countries?[indexPath.row].dateText
        cell.newConfirmedLabel.text = countries?[indexPath.row].newConfirmedText
        cell.totalConfirmedLabel.text = countries?[indexPath.row].totalConfirmedText
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        guard let country = countries?[indexPath.row] else { return }
        detailVC.country = country
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
