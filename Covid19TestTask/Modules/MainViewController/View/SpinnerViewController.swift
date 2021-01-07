//
//  SpinnerViewController.swift
//  Covid19TestTask
//
//  Created by Иван Юшков on 07.01.2021.
//

import UIKit

class SpinnerViewController: UIViewController {
  
  private let spinner = UIActivityIndicatorView(style: .whiteLarge)
  private let label = UILabel(frame: .zero)
  
  override func loadView() {
    view = UIView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false

    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    view.addSubview(stackView)

    NSLayoutConstraint.activate([
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor)
    ])
  
    spinner.translatesAutoresizingMaskIntoConstraints = false
    spinner.startAnimating()
    view.addSubview(spinner)

    label.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(label)
   
    stackView.addArrangedSubview(spinner)
    stackView.addArrangedSubview(label)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor(white: 0, alpha: 0.7)
    
    label.textColor = UIColor(white: 1.0, alpha: 0.7)
    label.numberOfLines = 0
    label.textAlignment = .center
    label.sizeToFit()

  }
  
  func show(with message: String, _ parent: UIViewController) {
    label.text = message
    parent.view.addSubview(view)
    NSLayoutConstraint.activate([
      view.widthAnchor.constraint(equalTo: parent.view.widthAnchor),
      view.heightAnchor.constraint(equalTo: parent.view.heightAnchor)
    ])
    spinner.startAnimating()
    didMove(toParent: parent)
  }

  func hide() {
    willMove(toParent: nil)
    spinner.stopAnimating()
    view.removeFromSuperview()
    removeFromParent()
  }
}
