//
//  main.swift
//  2920_swift
//
//  Created by Hyun on 2022/11/20.
//

import Foundation

let numbers = readLine()!.split(separator: " ").map{Int($0)!}
var asc = true
var des = true
for i in 0..<numbers.count-1{
    if numbers[i] < numbers[i+1]{
        des = false
    }else if numbers[i] > numbers[i+1]{
        asc = false
    }
}
if !asc && !des{
    print("mixed")
}else if asc{
    print("ascending")
}else if des{
    print("descending")
}
