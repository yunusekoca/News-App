//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Yunus Emre Koca on 22.08.2022.
//

import UIKit

class NewsViewController: UIViewController {
    
    private var viewModel: NewsViewModel
    private var articles = [Article]()
    
    private lazy var newsTable: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
        return tableView
    }()
    
    init() {
        viewModel = NewsViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Haberler"
        
        newsTable.delegate = self
        newsTable.dataSource = self
        
        setupConstraints()
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.newsFetched = { [weak self] articles in
            self?.articles = articles
            DispatchQueue.main.async {
                self?.newsTable.reloadData()
            }
        }
        viewModel.errorOccurred = { [weak self] error in
            self?.showAlert(title: "Hata", message: error)
        }
        
        viewModel.getArticles()
    }
    
    private func setupConstraints() {
        view.addSubview(newsTable)
        NSLayoutConstraint.activate([
            newsTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newsTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newsTable.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            newsTable.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTable.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        let cellViewModel = NewsCellViewModel(model: articles[indexPath.row])
        cell.configureNewsCell(cellViewModel: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
