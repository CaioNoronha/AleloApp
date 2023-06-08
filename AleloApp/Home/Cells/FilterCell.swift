import UIKit
import Cartography

public class FilterCell: UICollectionViewCell {

    //MARK: - Attributes
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = Color.lightBlue
        setup()
    }
    
    //MARK: - Methods
    
    private func setup() {
        addSubview(titleLabel)
        
        self.layer.cornerRadius = 15.0
        setupConstrains()
    }
    
    func configure(with viewModel: ViewModel) {
        titleLabel.text = viewModel.title
    }
    
    
    func setupConstrains() {
        constrain(titleLabel, self) { name, cell in
            name.edges == cell.edges.inseted(by: 8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FilterCell {
    
    struct ViewModel {
        public var title: String
    }
}
