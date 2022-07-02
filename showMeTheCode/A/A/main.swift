//
//  main.swift
//  A
//
//  Created by Hyun on 2022/07/02.
//

import Foundation

struct Town:Comparable{
    static func < (lhs: Town, rhs: Town) -> Bool {
        return lhs.monster <= rhs.monster
    }
    let monster:Int
    let people:Int
}
let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
let a = readLine()!.split(separator: " ").map{Int(String($0))!}
let p = readLine()!.split(separator: " ").map{Int(String($0))!}
var damage = 0
var ans = 0

let n = nk[0]
var k = nk[1]
var towns = [Town]()
for i in 0..<n{
    towns.append(Town(monster: a[i], people: p[i]))
}
towns.sort(by: <)
for town in towns {
    damage += town.monster
    if damage <= k{
        ans += town.people
    }else{
        break
    }
    k -= damage
}
print(ans)
