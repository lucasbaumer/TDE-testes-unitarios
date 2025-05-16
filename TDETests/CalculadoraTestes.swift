import XCTest
@testable import TDE

final class CalculadoraTests: XCTestCase {

    var calculadora: Calculadora!

    override func setUp() {
        super.setUp()
        calculadora = Calculadora()
    }

    override func tearDown() {
        calculadora = nil
        super.tearDown()
    }

    // MARK: - Soma

    func testSomarDoisNumerosPositivos() {
        XCTAssertEqual(calculadora.somar(2, 3), 5)
    }

    func testSomarComNil() {
        XCTAssertNil(calculadora.somar(nil, 2))
    }

    // MARK: - Subtração

    func testSubtrairNumeros() {
        XCTAssertEqual(calculadora.subtrair(10, 4), 6)
    }

    func testSubtrairComNil() {
        XCTAssertNil(calculadora.subtrair(5, nil))
    }

    // MARK: - Multiplicação

    func testMultiplicarNumeros() {
        XCTAssertEqual(calculadora.multiplicar(3, 4), 12)
    }

    func testMultiplicarComNil() {
        XCTAssertNil(calculadora.multiplicar(nil, 4))
    }

    // MARK: - Divisão

    func testDividirNumeros() {
        XCTAssertEqual(calculadora.dividir(10, 2), 5)
    }

    func testDividirPorZero() {
        XCTAssertNil(calculadora.dividir(10, 0))
    }

    func testDividirComNil() {
        XCTAssertNil(calculadora.dividir(10, nil))
    }
}
