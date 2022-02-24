//
//  main.swift
//  10610_swift
//
//  Created by Hyun on 2022/02/24.
//

import Foundation

let number = readLine()!.sorted(by: >).map{String($0)}
let sum = number.map{Int(String($0))!}.reduce(0, +)
//3의 배수 특징: 각 자릿수의 합이 3의 배수다.
if number.last! == "0" && sum%3 == 0{
    print(number.joined())
}else{
    print("-1")
}
