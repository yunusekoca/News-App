//
//  NewsDetailsVC.swift
//  NewsApp
//
//  Created by Yunus Emre Koca on 25.08.2022.
//

import UIKit
import Kingfisher
import SafariServices

final class NewsDetailsViewController: UIViewController {
    
    private let viewModel: NewsDetailsViewModel
    
    init(viewModel: NewsDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.textAlignment = .center
        label.text = viewModel.title
        return label
    }()
    
    private lazy var publishDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .gray
        label.textAlignment = .right
        label.text = viewModel.publishedAt
        return label
    }()
    
    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.kf.setImage(with: viewModel.imageURL)
        return imageView
    }()
    
    private lazy var newsDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = viewModel.description
        return label
    }()
    
    private lazy var readMoreButton: UIButton = {
        let button = UIButton(configuration: UIButton.Configuration.filled())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(readMoreButtonTapped), for: .touchUpInside)
        button.setTitle("Devamını oku", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Detay"
        navigationItem.largeTitleDisplayMode = .never
        
        setupConstraints()
    }
    
    @objc private func readMoreButtonTapped() {
        if let url = viewModel.readMoreLink {
            let safari = SFSafariViewController(url: url)
            present(safari, animated: true)
        }
    }
    
    private func setupConstraints() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(publishDateLabel)
        contentView.addSubview(newsImageView)
        contentView.addSubview(newsDescriptionLabel)
        contentView.addSubview(readMoreButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -15),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9)
        ])
        
        NSLayoutConstraint.activate([
            publishDateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            publishDateLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: publishDateLabel.bottomAnchor, constant: 5),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            newsImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6),
            newsImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6),
            newsImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            newsDescriptionLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 15),
            newsDescriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            newsDescriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            readMoreButton.topAnchor.constraint(equalTo: newsDescriptionLabel.bottomAnchor, constant: 15),
            readMoreButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            readMoreButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            readMoreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            readMoreButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
