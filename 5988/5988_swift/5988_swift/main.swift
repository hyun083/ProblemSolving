//
//  main.swift
//  5988_swift
//
//  Created by Hyun on 2022/06/26.
//

import Foundation

for _ in 0..<Int(readLine()!)!{
    let k = readLine()!.last!
    if Int(String(k))!%2==0{
        print("even")
    }else{
        print("odd")
    }
}

