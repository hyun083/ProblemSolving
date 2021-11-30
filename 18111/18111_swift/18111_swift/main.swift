//
//  main.swift
//  18111_swift
//
//  Created by Hyun on 2021/11/29.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let N = inputs[0]
let M = inputs[1]
let B = inputs[2]

var base = [Int:Int]()
var numbers = Set<Int>()

for _ in 0..<N{
    let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
    for input in inputs{
        if base[input] == nil {
            base[input] = 1
        }else{
            base[input]! += 1
        }
        numbers.insert(input)
    }
}

var ans = [0,0]

for ground in numbers.min()!...numbers.max()!{
    var cnt = 0
    var inven = B
    for m in base{
        if m.key == ground{ continue }
        if m.key < ground{
            let dis = ground - m.key
            inven -= dis*m.value
            cnt += dis*m.value
        }else if m.key > ground{
            let dis = m.key - ground
            inven += dis*m.value
            cnt += 2*(dis*m.value)
        }
    }
    if inven >= 0{
        if ans[0] == 0{
            ans[0] = cnt
            ans[1] = ground
        }
        if ans[0] > cnt{
            ans[0] = cnt
            ans[1] = ground
        }
        if ans[0] == cnt && ans[1] < ground{
            ans[0] = cnt
            ans[1] = ground
        }
    }
}

print(ans[0],ans[1])
