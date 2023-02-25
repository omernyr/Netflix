//
//  TitlePreviewViewController.swift
//  Netflix Clone
//
//  Created by macbook pro on 25.02.2023.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    private let titleLabel: UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "John Wick"
        return label
    }()
    
    private let overViewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Baba savaşıyorke çatıke..."
        label.numberOfLines = 0
        return label
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        //        button.setImage(UIImage(systemName: "arrow.down.to.line"), for: UIControl.State.normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        view.addSubview(titleLabel)
        view.addSubview(overViewLabel)
        view.addSubview(downloadButton)
        configureConstraints()
    }
    
    func configureConstraints() {
        let webViewConstraints = [
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 250)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: webView.leadingAnchor, constant: 20)
        ]
        
        let overViewLabelConstraints = [
            overViewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            overViewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ]
        let downloadButtonConstraints = [
            downloadButton.topAnchor.constraint(equalTo: overViewLabel.bottomAnchor, constant: 15),
            downloadButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ]
        
        NSLayoutConstraint.activate(webViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(overViewLabelConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
    }
}
