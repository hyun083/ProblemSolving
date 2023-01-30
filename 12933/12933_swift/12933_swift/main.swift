//
//  main.swift
//  12933_swift
//
//  Created by Hyun on 2023/01/28.
//

import Foundation

let sounds = readLine()!.map{String($0)}
var ducks = [Int]()
var ans = 0
var check = true
let idx = ["q":0, "u":1, "a":2, "c":3, "k":4]

func quack(s:Int) -> Bool{
    var result = false
    
    if s == 0{
        ducks.append(0)
        return true
    }
    
    for i in 0..<ducks.count{
        if ducks[i] == s-1{
            result = true
            ducks[i] += 1
            if ducks[i] == 4{
                ducks.remove(at: i)
            }
            ans = max(ans, ducks.count)
            break
        }
    }

    return result
}

for sound in sounds{
    if !quack(s: idx[sound]!){
        check = false
        break
    }
}

if ducks.isEmpty && check{
    print(ans)
}else{
    print(-1)
}
