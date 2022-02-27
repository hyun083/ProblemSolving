//
//  main.swift
//  1543_swift
//
//  Created by Hyun on 2022/02/27.
//

import Foundation
var document = readLine()!
let word = readLine()!
var cnt = 0
while document.contains(word){
    document.replaceSubrange(document.range(of: word)!, with: "!")
    cnt += 1
}
print(cnt)
