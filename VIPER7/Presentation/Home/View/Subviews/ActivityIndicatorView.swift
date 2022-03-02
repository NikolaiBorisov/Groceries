//
//  ActivityIndicatorView.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 14.02.2022.
//

import UIKit

final class ActivityIndicatorView: UIActivityIndicatorView {
    
    // MARK: - Initializers
    
    init(
        color: UIColor = .white,
        style: UIActivityIndicatorView.Style = .large
    ) {
        super.init(frame: .zero)
        
        self.configureSelfWith(color: color, style: style)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    public func setupActivityIndicatorOn(view: UIView) {
        self.center = view.center
    }
    
    // MARK: - Private Methods
    
    private func configureSelfWith(color: UIColor = .cyan, style: UIActivityIndicatorView.Style = .large) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.style = style
        self.color = color
        self.hidesWhenStopped = true
    }
    
}
