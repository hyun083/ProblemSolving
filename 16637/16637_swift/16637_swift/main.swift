//
//  main.swift
//  16637_swift
//
//  Created by Hyun on 2022/07/06.
//

import Foundation

let n = Int(readLine()!)!
var line = readLine()!.map{String($0)}
var myMax = Int.min
var numbers = [Int]()
var opts = [String]()

func result(of line:[String]) -> Int{
    var result = Int(line[0])!
    for i in stride(from: 1, to: line.count, by: +2){
        if line[i] == "+"{
            result += Int(line[i+1])!
        }else if line[i] == "-"{
            result -= Int(line[i+1])!
        }else{
            result *= Int(line[i+1])!
        }
    }
    return result
}

for i in stride(from: 1, to: n, by: +2){
    var temp = line
    var number = String()
    
    if line[i] == "+"{
        number = String(Int(line[i-1])!+Int(line[i+1])!)
    }else if line[i] == "-"{
        number = String(Int(line[i-1])!-Int(line[i+1])!)
    }else{
        number = String(Int(line[i-1])!*Int(line[i+1])!)
    }
    
    temp.replaceSubrange(i-1...i+1, with: [number])
    myMax = max(myMax, result(of: temp))
    print(myMax, "   " ,temp)
}
print(myMax)
