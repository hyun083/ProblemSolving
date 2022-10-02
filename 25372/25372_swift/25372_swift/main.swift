//
//  main.swift
//  25372_swift
//
//  Created by Hyun on 2022/10/02.
//

import Foundation

for _ in 0..<Int(readLine()!)!{
    let str = readLine()!.map{String($0)}
    if 6<=str.count && str.count<=9{
        print("yes")
    }else{
        print("no")
    }
}

