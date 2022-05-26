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
    
    
//    let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.layer.cornerRadius = 15
//        imageView.contentMode = .scaleAspectFill
//        return imageView
//    }()
//
//    let textLabel: UILabel = {
//        let textLabel = UILabel()
//        textLabel.translatesAutoresizingMaskIntoConstraints = false
//        return textLabel
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        addConstraints()
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFill
        setupUI()
        title = "picture"
    }
    
//    private func addConstraints() {
//        view.addSubview(imageView)
//
//        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
//            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
//            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 150)
//        ])
//        view.addSubview(textLabel)
//        NSLayoutConstraint.activate([
//            textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
//            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16)
//        ])
//    }
    
    private func setupUI() {
        textLabel.text = receivedData.text
        
        DispatchQueue.global(qos: .utility).async {
            guard let imageData = NetworkManager.shared.fetchImage(urlString: self.receivedData.url ?? "") else {
                return
            }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: imageData)
            }
        }
    }
}
