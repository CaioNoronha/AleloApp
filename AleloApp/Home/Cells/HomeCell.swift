import UIKit
import Cartography

public class HomeCell: UICollectionViewCell {

    //MARK: - Attributes
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.isUserInteractionEnabled = true
        return label
    }()
    
    public lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        return imageView
    }()
    
    //MARK: - Initializer
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Color.darkBlue
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    //MARK: - Methods
    
    private func setup() {
        contentView.addSubview(productImageView)
        contentView.addSubview(titleLabel)
        setupConstrains()
    }
    
    public func configure(with viewModel: ViewModel) {
        titleLabel.text = viewModel.product.name
        Task {
            await configureImage(url: viewModel.product.image)
        }
    }
    
    public func configureImage(url: String) async {
        guard let url = URL(string: url) else { return }
        
        do {
            let request = URLRequest(url: url)
            let (data, _) = try await URLSession.shared.data(for: request)
            
            DispatchQueue.main.async {
                self.productImageView.image = UIImage(data: data)
            }
        } catch { return }
    }
    
    private func setupConstrains() {
        constrain(productImageView, contentView) { image, content in
            image.leading == content.leadingMargin
            image.top == content.topMargin
            image.height == 50
            image.width == 50
        }
        
        constrain(titleLabel, productImageView, contentView) { label, image, content in
            label.leading == image.trailing + 20
            label.top == content.topMargin + 15
        }
    }
}

//MARK: - ViewModel

extension HomeCell {
        
    public struct ViewModel {
        var product: Product
    }
}
