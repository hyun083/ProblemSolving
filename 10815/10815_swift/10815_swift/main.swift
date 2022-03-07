//
//  main.swift
//  10815_swift
//
//  Created by Hyun on 2022/03/07.
//

import Foundation

let N = Int(readLine()!)!
let cards = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)

let M = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}

func binSearch(left:Int, right:Int, number:Int) -> String{
    let mid = (left+right)/2
    if cards[mid] == number{
        return "1"
    }else{
        if left+1 == right{
            return "0"
        }else if cards[mid] > number{
            return binSearch(left: left, right: mid, number: number)
        }else{
            return binSearch(left: mid, right: right, number: number)
        }
    }
}

for number in numbers {
    print(binSearch(left: 0, right: N, number: number),terminator: " ")
}
