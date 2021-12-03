//
//  main.swift
//  1000_swift
//
//  Created by Hyun on 2021/12/03.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
print(inputs[0]+inputs[1])
