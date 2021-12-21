//
//  ViewController.swift
//  #2enumeUnderstanding
//
//  Created by 中野翔太 on 2021/12/20.
//

import UIKit

class ViewController: UIViewController {
    
//
//    private enum CalculationResult {
//        case succes(Double)
//        case failure(String)
//    }
//    private enum Calculation : Int{
//        case addtion
//        case subtraction
//        case multiply
//        case division
//
//        func calculate(_ num1: Double, _ num2: Double) -> CalculationResult {
//            switch self {
//            case .addtion:
//                return .succes(num1 + num2)
//            case .subtraction:
//                return .succes(num1 - num2)
//            case .multiply:
//                return .succes(num1 * num2)
//            case .division:
////                guard文はTrueが実行されるから
//                guard !num2.isZero else { return .failure(ErrorMessage.nonZero) }
//                return .succes(num1 / num2)
//            }
//        }
//    }
//    private enum ErrorMessage {
//        static let nosegument: String = "何らかのエラーでセグメントが見つかりませんでした"
//        static let nonNumeric: String = "数値を代入してださい"
//        static let nonZero: String = "数値には0以外を代入してください"
//    }
//
   
//        //        オプショナルだからflatMapを使う。.mapだとアンラップできない
//      guard  let firstNum = firstTextField.text.flatMap({Double($0)}),
//             let secondNum = secondTextField.text.flatMap({Double($0)}) else { return resultLabel.text = ErrorMessage.nonZero }
//        //        rawValueで番号を取得する　gurd letで等しかったら下へ。Calculation: Intが設定されている理由はsegumentIndexPathがInt型だから
//        guard let calcuration = Calculation(rawValue: segmentedControl.selectedSegmentIndex) else {  fatalError(ErrorMessage.nosegument) }
//        //       firstNumとsecondNumの値を渡す
//        switch calcuration.calculate(firstNum, secondNum) {
//        case .succes(let result):
//            resultLabel.text = String(result)
//        case .failure(let messege):
//            resultLabel.text = messege
//        }
    
    
    
    
    
    
    private enum Forking {
        case succes(Int)
        case filure(String)
    }
    private enum Calculation: Int {
        case addtion
        case subtraction
        case multiplication
        case division

        func calculation(_ value1: Int , _ value2: Int) -> Forking {
            switch self {
            case .addtion:
                return .succes(value1 + value2)
            case .subtraction:
                return .succes(value1 - value2)
            case .multiplication:
                return .succes(value1 * value2)
            case .division:
                guard value2 != 0 else { return .filure(ErrorMessage.nonzero)}
                return .succes(value1 / value2)
            }
        }
    }
        private enum ErrorMessage {
            //要件を定義するでけの時はstaticをつけましょう
            static let nonzero = "0以外の数字を代入して下さい"
            static let nonSegument = "セグメントエラーが発生しました"
        }

    @IBOutlet private weak var firstTextField: UITextField!
    @IBOutlet private weak var secondTextField: UITextField!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var resultLabel: UILabel!
    

    
    @IBAction private func resultButon(_ sender: Any) {
         //数値以外はオプショナルなのでnilを返す。なのでguard文でnillチェックしてあげる
       guard let text1 = firstTextField.text.flatMap({Int($0)}),
             //gaurd文はIBIctionに返り値がないのでretrunはいらない。
             let text2 = secondTextField.text.flatMap({Int($0)}) else { return resultLabel.text = "エラー" }
        
        guard let segmentIndex = Calculation(rawValue: segmentedControl.selectedSegmentIndex) else { return }
        switch segmentIndex.calculation(text1, text2) {
        case .succes(let result):
            resultLabel.text = String(result)
        case .filure(let message):
            resultLabel.text = message
        }
        }
    }
