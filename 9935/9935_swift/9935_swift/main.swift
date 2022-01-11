//
//  main.swift
//  9935_swift
//
//  Created by Hyun on 2022/01/11.
//

import Foundation

var text = readLine()!
var bomb = readLine()!
while text.contains(bomb){
    text = text.replacingOccurrences(of: bomb, with: "")
}
if text == ""{
    print("FRULA")
}else{
    print(text)
}
