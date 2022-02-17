//
//  main.swift
//  1374_swift
//
//  Created by Hyun on 2022/02/16.
//

import Foundation

public struct Lecture{
    let num:Int
    let start_time:Int
    let end_time:Int
    
    init(num:Int, start:Int, end:Int){
        self.num = num
        self.start_time = start
        self.end_time = end
    }
}

let N = Int(readLine()!)!
var lectures = [Lecture]()

for _ in 0..<N{
    let lect = readLine()!.split(separator: " ").map{Int(String($0))!}
    lectures.append(Lecture(num: lect[0], start: lect[1], end: lect[2]))
}

for l in lectures{
    print(l)
}
