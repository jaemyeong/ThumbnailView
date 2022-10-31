#if canImport(UIKit)

import UIKit
import OpenColorKit
import ErrorKit

public final class ThumbnailView: UIView {
    
    public private(set) var isLoading: Bool {
        didSet {
            self.imageView.isHidden = self.isLoading
            
            if self.isLoading {
                self.activityIndicatorView.startAnimating()
            } else {
                self.activityIndicatorView.stopAnimating()
            }
        }
    }
    
    public var image: UIImage? {
        didSet {
            if let image = self.image {
                self.imageView.image = image
                self.isLoading = false
            } else {
                self.imageView.image = nil
                self.isLoading = true
            }
        }
    }
    
    private let imageView: UIImageView
    
    private let activityIndicatorView: UIActivityIndicatorView
    
    public override init(frame: CGRect) {
        self.isLoading = true
        self.imageView = UIImageView()
        self.activityIndicatorView = UIActivityIndicatorView(style: .medium)
        
        super.init(frame: frame)
        
        self.configureView()
        self.configureImageView()
        self.configureActivityIndicatorView()
        self.configureViewHierarchy()
        self.configureLayoutConstraints()
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: 64.0, height: 64.0)
    }
}

extension ThumbnailView {
    
    private func configureView() {
        self.backgroundColor = .openColor.gray.gray2.color
        self.clipsToBounds = true
        self.layer.borderWidth = 1.0
        self.layer.borderColor = .openColor.gray.gray4.color?.cgColor
        self.layer.cornerRadius = 8.0
    }
    
    private func configureImageView() {
        let imageView = self.imageView
        imageView.contentMode = .scaleAspectFill
        imageView.isHidden = true
    }
    
    private func configureActivityIndicatorView() {
        let activityIndicatorView = self.activityIndicatorView
        activityIndicatorView.startAnimating()
    }
    
    private func configureViewHierarchy() {
        self.addSubview(self.imageView)
        self.addSubview(self.activityIndicatorView)
    }
    
    private func configureLayoutConstraints() {
        let imageView = self.imageView
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            {
                let layoutConstraint = imageView.widthAnchor.constraint(equalToConstant: self.intrinsicContentSize.width)
                layoutConstraint.priority = .defaultHigh
                return layoutConstraint
            }(),
            {
                let layoutConstraint = imageView.heightAnchor.constraint(equalToConstant: self.intrinsicContentSize.height)
                layoutConstraint.priority = .defaultHigh
                return layoutConstraint
            }(),
        ])
        
        let activityIndicatorView = self.activityIndicatorView
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            activityIndicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}

#endif
