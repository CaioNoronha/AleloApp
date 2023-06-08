protocol ViewCode {
    func build()
    func setupConstrains()
}

extension ViewCode {
    
    func setup() {
        build()
        setupConstrains()
    }
}
