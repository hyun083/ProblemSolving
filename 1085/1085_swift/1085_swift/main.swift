//
//  main.swift
//  1085_swift
//
//  Created by Hyun on 2021/11/06.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let x = inputs[0]
let y = inputs[1]
let w = inputs[2]
let h = inputs[3]

let outputs = [x,y,abs(w.distance(to: inputs[0])),abs(h.distance(to: inputs[1]))]
print(outputs.min()!)
