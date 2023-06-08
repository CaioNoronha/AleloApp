import Cartography
import Foundation
import UIKit

public class ItemCell: UICollectionViewCell {
    
    //MARK: - Attributes
    
    public lazy var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = Color.lightPurple
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    public lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.text = "Título"
        label.backgroundColor = .white
        return label
    }()
    
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    //MARK: - Methods
    
    private func setup() {
        addSubview(itemImageView)
        addSubview(titleLabel)
        
        setupConstrains()
    }
    
    public func configure(with viewModel: ViewModel) {
        itemImageView.image = viewModel.image
        titleLabel.text = viewModel.title
    }

    private func setupConstrains() {
        constrain(itemImageView, self) { image, cell in
            image.edges == cell.edges
        }
        
        constrain(titleLabel, self) { title, cell in
            title.bottom == cell.bottom - 10
            title.centerX == cell.centerX
        }
    }
}

//MARK: - ViewModel

extension ItemCell {
    
    public struct ViewModel {
        let title: String
        let image: UIImage?
    }
}
