//
//  ProfileCardCell.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/10/17.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class ProfileCardCell: UICollectionViewCell {
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        return blurEffectView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var badgeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .white
        contentView.layer.cornerRadius = 10.0
        contentView.layer.masksToBounds = true
        layer.masksToBounds = false
        setShadowWithColor(color: .black,
                           opacity: 0.1,
                           offset: CGSize(width: 5, height: 5),
                           radius: 8.0,
                           viewCornerRadius: 10.0)
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(dayLabel)
        contentView.addSubview(badgeLabel)
        let constraints = [
            dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            dayLabel.widthAnchor.constraint(equalToConstant: 28),

            profileImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: profileImageView.frame.width * 1.02),

            blurEffectView.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor),
            blurEffectView.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            blurEffectView.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor),

            badgeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            badgeLabel.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            badgeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            badgeLabel.heightAnchor.constraint(equalToConstant: 20),

            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 11),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    func configure(with viewModel: ProfileViewModel) {
        profileImageView.image = viewModel.image
        nameLabel.text = viewModel.nickName
        dayLabel.text = "D-7"
        badgeLabel.text = viewModel.heart.description
    }
}
