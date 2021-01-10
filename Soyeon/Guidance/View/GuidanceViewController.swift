//
//  GuidanceViewController.swift
//  Soyeon
//
//  Created by 이재은 on 2020/12/25.
//  Copyright (c) 2020 ludus. All rights reserved.
//

import UIKit

protocol GuidanceViewControllerInput: GuidancePresenterOutput {

}

protocol GuidanceViewControllerOutput {

    func doGuidanceOnLoad()
}

final class GuidanceViewController: UIViewController {

    @IBOutlet private weak var guidanceImageView: UIImageView!
    @IBOutlet private weak var guidanceTitleLabel: UILabel!
    @IBOutlet private weak var guidanceContentLabel: UILabel!
    @IBOutlet private weak var guidanceButton: UIButton!

    var output: GuidanceViewControllerOutput!
    var router: GuidanceRouterProtocol!

    // MARK: - Initializers

    init(configurator: GuidanceConfigurator = GuidanceConfigurator.shared) {
        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        configure()
    }

    // MARK: - Configurator

    private func configure(configurator: GuidanceConfigurator = GuidanceConfigurator.shared) {
        configurator.configure(viewController: self)
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        doGuidanceOnLoad()
        setUI()
    }

    // MARK: - Load data
    private func doGuidanceOnLoad() {
        output.doGuidanceOnLoad()
    }

    private func setUI() {
        guidanceContentLabel.setLineSpacing(7)
        guidanceContentLabel.textAlignment = .center
        guidanceButton.setRadius(23)
    }
}

// MARK: - GuidancePresenterOutput

extension GuidanceViewController: GuidanceViewControllerInput {

    // MARK: - Display logic
    func displayGuidance(viewModel: Guidance.GuidanceViewModel) {
        guidanceImageView.image = UIImage(named: viewModel.imageName)
        guidanceTitleLabel.text = viewModel.title
        guidanceContentLabel.text = viewModel.content
        guidanceButton.setTitle(viewModel.buttonText, for: .normal)
    }
}
