//
//  DetailViewController.swift
//  TestForWork
//
//  Created by Alik Nigay on 26.05.2022.
//

import UIKit

class PictureViewController: UIViewController {
    
    var receivedData: InternalData!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = .large
        return activityIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        
        setupUI()
    }
    
    private func initialSetup() {
        title = "picture"
        
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFit
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        imageView.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: view.bounds.height / 2
            ),
            activityIndicator.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: view.bounds.width / 2 - 10
            )
        ])
    }
    
    private func setupUI() {
        textLabel.text = receivedData.text
        
        DispatchQueue.global(qos: .utility).async {
            guard let imageData = NetworkManager.shared.fetchImage(urlString: self.receivedData.url ?? "") else {
                return
            }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: imageData)
                self.activityIndicator.stopAnimating()
            }
        }
    }
}
