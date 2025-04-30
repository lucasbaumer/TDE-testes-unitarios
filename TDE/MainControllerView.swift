import UIKit

class MainViewController: UIViewController {

    private let number1Field: UITextField = {
        let field = UITextField()
        field.placeholder = "Número 1"
        field.borderStyle = .roundedRect
        field.keyboardType = .numberPad
        field.translatesAutoresizingMaskIntoConstraints = false
        field.adjustsFontForContentSizeCategory = true
        field.font = UIFont.preferredFont(forTextStyle: .body)
        field.accessibilityLabel = "Campo número 1"
        field.accessibilityHint = "Digite o primeiro número para somar"
        return field
    }()

    private let number2Field: UITextField = {
        let field = UITextField()
        field.placeholder = "Número 2"
        field.borderStyle = .roundedRect
        field.keyboardType = .numberPad
        field.translatesAutoresizingMaskIntoConstraints = false
        field.adjustsFontForContentSizeCategory = true
        field.font = UIFont.preferredFont(forTextStyle: .body)
        field.accessibilityLabel = "Campo número 2"
        field.accessibilityHint = "Digite o segundo número para somar"
        return field
    }()

    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Resultado: "
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.accessibilityLabel = "Resultado da soma"
        label.accessibilityValue = "Nenhum resultado ainda"
        return label
    }()

    private let sumButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Somar", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityLabel = "Botão somar"
        button.accessibilityHint = "Pressione para somar os dois números"
        button.accessibilityTraits = .button
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Soma Acessível"
        view.backgroundColor = .systemBackground
        setupLayout()
        sumButton.addTarget(self, action: #selector(calculateSum), for: .touchUpInside)
    }

    private func setupLayout() {
        view.addSubview(number1Field)
        view.addSubview(number2Field)
        view.addSubview(sumButton)
        view.addSubview(resultLabel)

        NSLayoutConstraint.activate([
            number1Field.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            number1Field.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            number1Field.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            number2Field.topAnchor.constraint(equalTo: number1Field.bottomAnchor, constant: 20),
            number2Field.leadingAnchor.constraint(equalTo: number1Field.leadingAnchor),
            number2Field.trailingAnchor.constraint(equalTo: number1Field.trailingAnchor),

            sumButton.topAnchor.constraint(equalTo: number2Field.bottomAnchor, constant: 30),
            sumButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            resultLabel.topAnchor.constraint(equalTo: sumButton.bottomAnchor, constant: 30),
            resultLabel.leadingAnchor.constraint(equalTo: number1Field.leadingAnchor),
            resultLabel.trailingAnchor.constraint(equalTo: number1Field.trailingAnchor)
        ])
    }

    @objc private func calculateSum() {
        let num1 = Int(number1Field.text ?? "") ?? 0
        let num2 = Int(number2Field.text ?? "") ?? 0
        let result = num1 + num2
        resultLabel.text = "Resultado: \(result)"
        resultLabel.accessibilityValue = "\(result)"
    }
}
