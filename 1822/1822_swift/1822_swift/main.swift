//
//  main.swift
//  1822_swift
//
//  Created by Hyun on 2022/10/08.
//

import Foundation

//let numbers = readLine()!.split(separator: " ").map{Int($0)!}
//let na = numbers[0]
//let nb = numbers[1]
//var group = [Int:Bool]()
//var ans = [Int]()
//let aa = readLine()!.split(separator: " ").map{ Int($0)! }
//let bb = readLine()!.split(separator: " ").map{ Int($0)! }
//
//
//for member in bb{
//    group[member] = true
//}
//for member in aa{
//    if group[member] == nil{
//        ans.append(member)
//    }
//}
//
//print(ans.count)
//if ans.count > 0{
//    for ans in ans.sorted(by: <){
//        print(ans,terminator: " ")
//    }
//}

//binary search

let numbers = readLine()!.split(separator: " ").map{Int($0)!}
let na = numbers[0]
let nb = numbers[1]

var ans = [Int]()
let a = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)
let b = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)

func bin(num:Int) -> Bool{
    var start = 0
    var end = nb-1
    while start <= end{
        let mid = (start+end)/2
        if b[mid] < num{
            start = mid+1
            continue
        }else if b[mid] == num{
            return true
        }else{
            end = mid-1
            continue
        }
    }
    return false
}

for member in a{
    if !bin(num: member){
        ans.append(member)
    }
}
print(ans.count)
if ans.count > 0{
    for ans in ans{
        print(ans,terminator: " ")
    }
}
