//
//  main.swift
//  9742_swift
//
//  Created by Hyun on 2022/03/27.
//

import Foundation

while let input = readLine()?.split(separator: " ").map{String($0)}{
    let txt = input[0]
    let num = Int(input[1])!
    var fact = 1
    for i in 1...txt.count{
        fact *= i
    }
    if fact < num{
        print("No permutation")
    }else{
        
    }
    
}

