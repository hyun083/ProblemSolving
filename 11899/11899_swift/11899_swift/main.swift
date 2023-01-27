//
//  main.swift
//  11899_swift
//
//  Created by Hyun on 2023/01/26.
//

import Foundation

let line = readLine()!.map{String($0)}
var stk = [String]()

for input in line{
    if !stk.isEmpty{
        if stk.last! == "(" && input == ")"{
            stk.removeLast()
            continue
        }
    }
    stk.append(input)
}
print(stk.count)
