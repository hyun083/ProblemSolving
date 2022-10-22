//
//  main.swift
//  1477_swift
//
//  Created by Hyun on 2022/10/22.
//

import Foundation

let nml = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nml[0]
let m = nml[1]
var l = nml[2]

var roads = [Int]()
let stations = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: >)
for station in stations {
    roads.append(l-station)
    l = station
}
roads.append(l)
for _ in 0..<m{
    roads.sort(by: <)
    let road = roads.removeLast()-1
    roads.append(road/2)
    roads.append(road-roads.last!)
}
print(roads)
print(roads.max()!)
