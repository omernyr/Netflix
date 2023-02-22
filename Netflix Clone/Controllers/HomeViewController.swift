//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by macbook pro on 19.02.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    let sectionTitle: [String] = ["Trending Movies", "Trending TV", "Popular", "Upcoming Movies", "Top Rated"]
    
    // MARK: - TableView oluşturduk. ‼️‼️ BU YAPIYI UNUTMA ‼️‼️
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        
        // MARK: TableView ımızın cellini burda belirledik.
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        /// TableView ımızı sayfaya ekledik.
        view.addSubview(homeFeedTable)
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        configureNavbar()
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
        
        fetchData()
    }
    
    private func fetchData() {
        // MARK: get Trending Movies
        //        API_Caller.shared.fetchTrendingMovies { results in
        //
        //            switch results {
        //            case .success(let movies):
        //                print(movies)
        //            case .failure(let error):
        //                print(error)
        //            }
        //        }
        
        // MARK: get Trending TVs
        //        API_Caller.shared.fetchTrendingTV { results in
        //            switch results {
        //            case .success(let TVs):
        //                print(TVs)
        //            case .failure(let error):
        //                print(error)
        //            }
        //
        //        }
        
        // MARK: get Upcoming Movies
        //        API_Caller.shared.fetchUpcomingMovies { results in
        //            switch results {
        //            case .success(let movies):
        //                print(movies)
        //            case .failure(let error):
        //                print(error)
        //            }
        //
        //        }
        
        // MARK: get Popular Movies
        //        API_Caller.shared.fetchPopularMovies { results in
        //            switch results {
        //            case .success(let movies):
        //                print(movies)
        //            case .failure(let error):
        //                print(error)
        //            }
        //        }
        
        // MARK: get Top Rated Movies
        API_Caller.shared.fetchTopRatedMovies { results in
            switch results {
            case .success(let movies):
                print(movies)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func configureNavbar() {
        var image = UIImage(named: "netflixLogo")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.textColor = .white
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 200, height: header.bounds.height)
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    // MARK: - Bir cell imizin heigtini ayarladık.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffSet = view.safeAreaInsets.top
        let offSet = scrollView.contentOffset.y + defaultOffSet
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offSet))
    }
    
}









