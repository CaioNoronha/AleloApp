import UIKit
import Cartography

public protocol HomeCellDelegate: AnyObject {
    func didTapCharacter()
    func didTapSuggestion()
}

public class HomeCell: UITableViewCell {

    //MARK: - Attributes
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.isUserInteractionEnabled = true
        return label
    }()
    
    public lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        return imageView
    }()
    
    public lazy var suggestionCarousel: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 100)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: "ItemCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    weak var delegate: HomeCellDelegate?
    
    private var itemCells: [ItemCell.ViewModel] = []
    
    //MARK: - Initializer
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = Color.darkBlue
        setup()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    //MARK: - Methods
    
    private func setup() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(suggestionCarousel)
        register()
        setupConstrains()
    }
    
    public func register() {
        suggestionCarousel.dataSource = self
        suggestionCarousel.delegate = self
    }
    
    public func configure(with viewModel: ViewModel) {
        titleLabel.text = viewModel.title
        iconImageView.image = viewModel.image
        itemCells = viewModel.itemCells
    }
    
    
    private func setupConstrains() {
        constrain(iconImageView, contentView) { image, content in
            image.leading == content.leadingMargin
            image.top == content.topMargin
            image.height == 50
            image.width == 50
        }
        
        constrain(titleLabel, iconImageView, contentView) { label, image, content in
            label.leading == image.trailing + 20
            label.top == content.topMargin + 15
        }
        
        constrain(suggestionCarousel, iconImageView, contentView) { collection, image, content in
            collection.leading == content.leading
            collection.trailing == content.trailing
            collection.bottom == content.bottomMargin
            collection.top == image.bottomMargin + 20
        }
    }
}

//MARK: - CollectionView Methods

extension HomeCell: UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Opa!")
    }
    
}

extension HomeCell: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCells.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuggestionCell", for: indexPath) as? ItemCell else { return UICollectionViewCell() }
        
        cell.configure(with: itemCells[indexPath.row])
        
        return cell
    }
}

//MARK: - ViewModel

extension HomeCell {
        
    public struct ViewModel {
        var title: String
        var image: UIImage?
        var itemCells: [ItemCell.ViewModel]
    }
}
