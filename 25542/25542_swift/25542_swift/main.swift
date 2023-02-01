//
//  main.swift
//  25542_swift
//
//  Created by Hyun on 2023/01/31.
//

import Foundation

let nl = readLine()!.split(separator: " ").map{Int($0)!}
let n = nl[0]
let l = nl[1]

var ans = ""
var words = [[Character]]()
var flag = true

for _ in 0..<n{
    words.append(readLine()!.map{Character(String($0))})
}

for i in 0..<l{
    var alpha = Array(repeating: 0, count: 26)
    var mymax = -1
    var idx = -1
    var cnt = 0
    for k in 0..<n{
        let idx = Int(words[k][i].asciiValue!)-65
        alpha[idx] += 1
    }
    for i in 0..<26{
        if alpha[i] > 0{
            cnt += 1
        }
    }
    
    if cnt < n{
        for i in 0..<26{
            if alpha[i] > mymax{
                mymax = alpha[i]
                idx = i
            }
        }
    }
    
    if idx < 0{
        continue
    }else{
        let tmp = String(UnicodeScalar(idx+65)!)
        ans.append(tmp)
    }
}
if ans.count == l{
    print(ans)
}else{
    print("CALL FRIEND")
}
