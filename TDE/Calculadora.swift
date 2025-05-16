import Foundation

class Calculadora {

    func somar(_ a: Int?, _ b: Int?) -> Int? {
        guard let a = a, let b = b else { return nil }
        return a + b
    }

    func subtrair(_ a: Int?, _ b: Int?) -> Int? {
        guard let a = a, let b = b else { return nil }
        return a - b
    }

    func multiplicar(_ a: Int?, _ b: Int?) -> Int? {
        guard let a = a, let b = b else { return nil }
        return a * b
    }

    func dividir(_ a: Int?, _ b: Int?) -> Int? {
        guard let a = a, let b = b, b != 0 else { return nil }
        return a / b
    }
}

