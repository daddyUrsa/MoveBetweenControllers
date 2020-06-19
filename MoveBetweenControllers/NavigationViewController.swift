//
//  NavigationViewController.swift
//  MoveBetweenControllers
//
//  Created by Alexey Golovin on 19.06.2020.
//  Copyright © 2020 Alexey Pavlov. All rights reserved.
//

import UIKit

class NavigationViewController: UIViewController {

    private let pushButton: UIButton = {
        let pushButton = UIButton()
        pushButton.setTitleColor(.black, for: .normal)
        pushButton.setTitle("Push", for: .normal)
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        pushButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return pushButton
    }()
    
    private let launchTimeTextLabel: UILabel = {
        let launchTimeTextLabel = UILabel()
        launchTimeTextLabel.text = "Launch time:"
        launchTimeTextLabel.font = .systemFont(ofSize: 17)
        launchTimeTextLabel.textColor = .black
        launchTimeTextLabel.translatesAutoresizingMaskIntoConstraints = false
        return launchTimeTextLabel
    }()
    
    private let launchTimeLabel: UILabel = {
        let launchTimeLabel = UILabel()
        launchTimeLabel.font = .systemFont(ofSize: 17)
        launchTimeLabel.textColor = .black
        launchTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        return launchTimeLabel
    }()
    
    private let appearanceTimeTextLabel: UILabel = {
        let appearanceTimeTextLabel = UILabel()
        appearanceTimeTextLabel.text = "Appearance time:"
        appearanceTimeTextLabel.font = .systemFont(ofSize: 17)
        appearanceTimeTextLabel.textColor = .black
        appearanceTimeTextLabel.translatesAutoresizingMaskIntoConstraints = false
        return appearanceTimeTextLabel
    }()
    
    private let appearanceTimeLabel: UILabel = {
        let appearanceTimeLabel = UILabel()
        appearanceTimeLabel.font = .systemFont(ofSize: 17)
        appearanceTimeLabel.textColor = .black
        appearanceTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        return appearanceTimeLabel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Simple app"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Update", style: .done, target: self, action: #selector(updateDate))
        setupViewModel()
        launchTimeLabel.text = getFormattedDate(date: Date(), format: "MMM d, YYYY") + " at " + getFormattedDate(date: Date(), format: "h:mm:ss a")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        appearanceTimeLabel.text = getFormattedDate(date: Date(), format: "MMM d, YYYY") + " at " + getFormattedDate(date: Date(), format: "h:mm:ss a")
    }
}

extension NavigationViewController {
    
    private func setupViewModel() {
        view.addSubview(pushButton)
        view.addSubview(launchTimeTextLabel)
        view.addSubview(launchTimeLabel)
        view.addSubview(appearanceTimeTextLabel)
        view.addSubview(appearanceTimeLabel)
        
        pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pushButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32).isActive = true
        pushButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        pushButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        launchTimeTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        launchTimeTextLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        
        launchTimeLabel.topAnchor.constraint(equalTo: launchTimeTextLabel.bottomAnchor, constant: 16).isActive = true
        launchTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        appearanceTimeTextLabel.topAnchor.constraint(equalTo: launchTimeLabel.bottomAnchor, constant: 32).isActive = true
        appearanceTimeTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        appearanceTimeLabel.topAnchor.constraint(equalTo: appearanceTimeTextLabel.bottomAnchor, constant: 16).isActive = true
        appearanceTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
    }
    
    @objc private func buttonAction() {
        navigationController?.pushViewController(SecondViewController(), animated: true)
        print("Touched")
    }
    
    @objc func getFormattedDate(date: Date, format: String) -> String {
            let dateformat = DateFormatter()
            dateformat.dateFormat = format
            return dateformat.string(from: date)
    }
    
    @objc func updateDate() {
        launchTimeLabel.text = getFormattedDate(date: Date(), format: "MMM d, YYYY") + " at " + getFormattedDate(date: Date(), format: "h:mm:ss a")
        appearanceTimeLabel.text = getFormattedDate(date: Date(), format: "MMM d, YYYY") + " at " + getFormattedDate(date: Date(), format: "h:mm:ss a")
    }
}

