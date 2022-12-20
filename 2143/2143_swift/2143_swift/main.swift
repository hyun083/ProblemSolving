//
//  main.swift
//  2143_swift
//
//  Created by Hyun on 2022/12/20.
//

import Foundation

let T = Int(readLine()!)!

var n = Int(readLine()!)!
var a = [0]
for number in readLine()!.split(separator: " ").map({Int($0)!}){
    a.append(a.last!+number)
}

var m = Int(readLine()!)!
var b = [0]
for number in readLine()!.split(separator: " ").map({Int($0)!}){
    b.append(b.last!+number)
}

var tempA = [Int]()
var tempB = [Int:Int]()

for i in 0..<n{
    for k in i+1..<n+1{
        tempA.append(a[k]-a[i])
    }
}

for i in 0..<m{
    for k in i+1..<m+1{
        let num = b[k]-b[i]
        if tempB[num] == nil{
            tempB[num] = 1
        }else{
            tempB[num]! += 1
        }
    }
}

let numbers = tempB.sorted(by: { $0.key < $1.key})
var ans = 0

for i in 0..<tempA.count{
    var lead = 0
    var trail = numbers.count-1
    
    while lead <= trail{
        let mid = (lead+trail)/2
        if numbers[mid].key == T-tempA[i]{
            ans += numbers[mid].value
            break
        }else if numbers[mid].key > T-tempA[i]{
            trail = mid-1
        }else{
            lead = mid+1
        }
    }
}
print(ans)
