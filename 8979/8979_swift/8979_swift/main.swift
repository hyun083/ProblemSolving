//
//  main.swift
//  8979_swift
//
//  Created by Hyun on 2022/08/03.
//

import Foundation

struct Country:Equatable{
    let gold:Int
    let silver:Int
    let bronze:Int
    var rank:Int
}

func check(c1:Country, c2:Country) -> Bool{
    if c1.gold == c2.gold && c1.silver == c2.silver && c1.bronze == c2.bronze{
        return true
    }else{
        return false
    }
}

var countries = [Country]()

let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nk[0]
let k = nk[1]-1
var rank = 0

for _ in 0..<n{
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    countries.append(Country(gold: line[1], silver: line[2], bronze: line[3], rank: 0))
}

countries.sort(by: {
    if $0.gold == $1.gold{
        if $0.silver == $1.silver{
            return $0.bronze > $1.bronze
        }else{
            return $0.silver > $1.silver
        }
    }else{
        return $0.gold > $1.gold
    }
})

for i in 1..<n{
    if check(c1: countries[i-1], c2: countries[i]){
        countries[i].rank = rank
    }else{
        rank = i-1
        countries[i].rank = i-1
    }
}
print(countries)
