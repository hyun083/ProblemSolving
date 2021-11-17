//
//  main.swift
//  1018_swift
//
//  Created by Hyun on 2021/11/17.
//

import Foundation

var white = ["WBWBWBWB",
             "BWBWBWBW",
             "WBWBWBWB",
             "BWBWBWBW",
             "WBWBWBWB",
             "BWBWBWBW",
             "WBWBWBWB",
             "BWBWBWBW"]

var black = ["BWBWBWBW",
             "WBWBWBWB",
             "BWBWBWBW",
             "WBWBWBWB",
             "BWBWBWBW",
             "WBWBWBWB",
             "BWBWBWBW",
             "WBWBWBWB"]

//func compW(x: Int, y: Int) -> Int{
//    var x = x
//    var y = y
//    var cnt = 0
//    for text in white{
//        for char in text{
//            if(char != arr.index(after: x).description.index(after: y)){
//                cnt += 1
//            }
//            y += 1
//        }
//        x += 1
//    }
//    return cnt
//}

//let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
//var arr = Array<String>()
//
//for _ in 1...inputs[0]{
//    arr.append(readLine()!)
//}

for text in white{
    for i in text{
        print(i,terminator: " " )
    }
    print("\n")
}
