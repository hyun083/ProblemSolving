//
//  main.swift
//  4386_swift
//
//  Created by Hyun on 2022/08/18.
//

import Foundation

func distance(from a:[Double], to b:[Double]) -> Double{
    let result = sqrt(pow(a[0]-b[0], 2)+pow(a[1]-b[1], 2))
    return result
}
struct Line{
    let distance:Double
    let point1:Int
    let point2:Int
}

let n = Int(readLine()!)!
var arr = Array(repeating: -1, count: n)
var stars = Array(repeating: [Double](), count: n)
var ans = 0.0

for i in 0..<n{
    let star = readLine()!.split(separator: " ").map{Double(String($0))!}
    stars[i] = star
}

var lines = [Line]()
for i in 0..<n{
    for k in i+1..<n{
        let line = Line(distance: distance(from: stars[i], to: stars[k]), point1: i, point2: k)
        lines.append(line)
    }
}
lines.sort(by: {
    $0.distance<$1.distance
})

func root(of n:Int)->Int{
    if arr[n] == -1{
        return n
    }
    arr[n] = root(of: arr[n])
    return arr[n]
}

for line in lines {
    let rootOfA = root(of: line.point1)
    let rootOfB = root(of: line.point2)
    if rootOfA != rootOfB{
        arr[rootOfB] = rootOfA
        ans += line.distance
    }
}
print(ans)
