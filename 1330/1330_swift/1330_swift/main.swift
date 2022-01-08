//
//  main.swift
//  1330_swift
//
//  Created by Hyun on 2022/01/08.
//

import Foundation

let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}

if numbers[0] < numbers[1]{
    print("<")
}else if numbers[0] > numbers[1]{
    print(">")
}else{
    print("==")
}

