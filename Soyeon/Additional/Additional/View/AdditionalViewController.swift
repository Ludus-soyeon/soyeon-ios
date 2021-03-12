//
//  AdditionalViewController.swift
//  Soyeon
//
//  Created by 이재은 on 2021/03/08.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol AdditionalViewControllerInput: AdditionalPresenterOutput {
 
}

protocol AdditionalViewControllerOutput {
    
    func doAdditionalMatchListOnLoad()
}

final class AdditionalViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var additionalTableView: UITableView!
    
    // MARK: - Property
    
    var output: AdditionalViewControllerOutput!
    var router: AdditionalRouterProtocol!
    
    // MARK: - Initializers
    
    init(configurator: AdditionalConfigurator = AdditionalConfigurator.shared) {
        
        super.init(nibName: nil, bundle: nil)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        configure()
    }
    
    // MARK: - Configurator
    
    private func configure(configurator: AdditionalConfigurator = AdditionalConfigurator.shared) {
        
        configurator.configure(viewController: self)
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        registerXib()
        doAdditionalMatchListOnLoad()
        setupLayout()
    }
    
    // MARK: - Load data
    private func registerXib() {
        let nibName = UINib(nibName: "AdditionalCell", bundle: .main)
        additionalTableView.register(nibName, forCellReuseIdentifier: "AdditionalCell")
    }
    
    private func doAdditionalMatchListOnLoad() {
        output.doAdditionalMatchListOnLoad()
    }
    
    private func setupLayout() {
        setNavigationTitle("추가매칭하기")
    }
}

// MARK: - AdditionalPresenterOutput

extension AdditionalViewController: AdditionalViewControllerInput {
    
    // MARK: - Display logic
    func displayAdditionalTableView(viewModel: AdditionalMatch.AdditionalViewModel) {
        
    }
}

// MARK: - UITableViewDataSource
extension AdditionalViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return AdditionalMatch.AdditionalMatchingType.allCases.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let additionalCell = tableView
                .dequeueReusableCell(withIdentifier: "AdditionalCell",
                                     for: indexPath) as? AdditionalCell else {
            return UITableViewCell()
        }
        
        if let matchList = AdditionalMatch.AdditionalMatchingType(rawValue: indexPath.row) {
            additionalCell.setProperties(matchList.title)
        }
        
        return additionalCell
    }
}

// MARK: - UITableViewDelegate
extension AdditionalViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57
    }
}
