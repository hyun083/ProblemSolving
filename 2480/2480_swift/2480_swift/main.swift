//
//  main.swift
//  2480_swift
//
//  Created by Hyun on 2022/05/21.
//

import Foundation

let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
var result = [Int:Int]()
for number in numbers {
    if result[number] == nil{
        result[number] = 1
    }else{
        result[number]! += 1
    }
}
let temp = result.sorted(by: {
    if $0.value == $1.value{
        return $0.key > $1.key
    }else{
        return $0.value > $1.value
    }
})

if temp.first!.value == 3{
    print(temp.first!.key*1000+10000)
}else if temp.first!.value == 2{
    print(temp.first!.key*100+1000)
}else{
    print(temp.first!.key*100)
}
