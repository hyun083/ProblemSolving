//
//  main.swift
//  1935
//
//  Created by Hyun on 2021/10/30.
//

import Foundation

let n = readLine()
var stack = Array<Double>()

if let size = Int(n!){
    let postfix = readLine()!
    var numbers = Array<Double>()
    
    for _ in 0..<size{
        let number = Double(readLine()!)
        numbers.append(number!)
    }
    
    for char in postfix.utf8{
        if(64<char && char<91){
            stack.append((numbers[Int(char)-65]))
        }else{
            switch char{
            case 42:
                let operand2 = stack.removeLast()
                let operand1 = stack.removeLast()
                stack.append(operand1 * operand2)
                break
            case 43:
                let operand2 = stack.removeLast()
                let operand1 = stack.removeLast()
                stack.append(operand1 + operand2)
                break
            case 45:
                let operand2 = stack.removeLast()
                let operand1 = stack.removeLast()
                stack.append(operand1 - operand2)
                break
            case 47:
                let operand2 = stack.removeLast()
                let operand1 = stack.removeLast()
                stack.append(operand1 / operand2)
                break
            default:
                break
            }
        }
    }
    print(String(format: "%.2f", stack.first!))
}

