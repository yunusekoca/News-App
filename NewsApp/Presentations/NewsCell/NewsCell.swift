//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Yunus Emre Koca on 22.08.2022.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {
    
    private lazy var newsImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var newsTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var newsDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 7
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupConstraints() {
        addSubview(newsImage)
        addSubview(newsTitle)
        addSubview(newsDescription)
        
        NSLayoutConstraint.activate([
            newsImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            newsImage.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 15),
            newsImage.widthAnchor.constraint(equalToConstant: 120),
            newsImage.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            newsTitle.centerYAnchor.constraint(equalTo: newsImage.centerYAnchor),
            newsTitle.leftAnchor.constraint(equalTo: newsImage.rightAnchor, constant: 15),
            newsTitle.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            newsDescription.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 15),
            newsDescription.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -15),
            newsDescription.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 15),
            newsDescription.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -15)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureNewsCell(cellViewModel: NewsCellViewModel) {
        newsTitle.text = cellViewModel.title
        newsDescription.text = cellViewModel.description
        newsImage.kf.setImage(with: cellViewModel.url)
    }
}
