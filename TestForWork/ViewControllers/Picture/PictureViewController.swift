//
//  DetailViewController.swift
//  TestForWork
//
//  Created by Alik Nigay on 26.05.2022.
//

import UIKit

class PictureViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = .large
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    var viewModel: PictureViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        setupUI()
    }
    
    private func initialSetup() {
        
        textLabel.text = "Some text"
        
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFit
        
        imageView.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: view.bounds.height / 2
            ),
            activityIndicator.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: view.bounds.width / 2 - 20
            )
        ])
    }
    
    private func setupUI() {
        textLabel.text = viewModel.name
        
        viewModel.getImageData { imageData in
            self.imageView.image = UIImage(data: imageData)
            self.activityIndicator.stopAnimating()
        }
    }
}
