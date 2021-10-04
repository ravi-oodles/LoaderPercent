
import Foundation
import UIKit


public class LoaderPercentView: UIView {
    let indicator: UIActivityIndicatorView = {
        var indicate = UIActivityIndicatorView()
        
        if #available(iOS 13.0, *) {
            indicate = UIActivityIndicatorView(style: .large)
        } else {
            // Fallback on earlier versions
            indicate = UIActivityIndicatorView(style: .gray)
            
        }
        indicate.color = UIColor.yellow
        indicate.startAnimating()
        return indicate
    }()
    let percentLabel: UILabel = {
        let label = UILabel()
        label.text = "Downloading"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = true
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    let backgroundView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.alpha = 0.6
        return view
    }()
    let cancelDownloadButton : UIButton = {
        let button = UIButton()
        button.setTitle("Cancel Downloading", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .red
        
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customizePercentLoader()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func customizePercentLoader(){
        self.backgroundColor = UIColor.init(red: 0.4, green: 0.5, blue: 0.4, alpha: 1)
        self.layer.cornerRadius = 5.0
        self.setupPercentageLabel()
        self.setupCancelDownloadButton()
        self.setupActivityIndicator()
        
    }
    
    private func setupPercentageLabel() {
        //Percent label constraint
        self.addSubview(percentLabel)
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        percentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        percentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        percentLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        percentLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    private func setupBackground() {
        //Percent label constraint
        self.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        backgroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    }
    
    
    private func setupCancelDownloadButton(){
        //Cancel Download button constraint
        self.addSubview(cancelDownloadButton)
        cancelDownloadButton.translatesAutoresizingMaskIntoConstraints = false
        cancelDownloadButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        cancelDownloadButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        cancelDownloadButton.topAnchor.constraint(equalTo: percentLabel.bottomAnchor, constant: 5).isActive = true
        cancelDownloadButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    private func setupActivityIndicator(){
        //Cancel Download button constraint
        self.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        indicator.topAnchor.constraint(equalTo: cancelDownloadButton.bottomAnchor, constant: 5).isActive = true
        indicator.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
}
