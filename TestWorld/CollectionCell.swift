//
//  CollectionCell.swift
//  TestWorld
//
//  Created by sher on 26/4/22.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    let imageView = UIImageView(image: UIImage(named: "sda"))
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        setupImage()
    }
    
    func setupImage() {
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: topAnchor),
                                     imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     imageView.trailingAnchor.constraint(equalTo: trailingAnchor)])
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
