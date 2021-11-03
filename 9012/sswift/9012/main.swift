//
//  main.swift
//  9012
//
//  Created by Hyun on 2021/10/29.
//

import Foundation

let t = readLine()
var result = 0;
var outputs:Array = Array<Int>()

if let T = Int(t!){
    for _ in 0..<T{
        result = 0
        let input = readLine()
        for index in input!.indices{
            if result < 0 {
                break
            }
            if input![index] == "("{
                result += 1
            }else{
                result -= 1
            }
        }
        outputs.append(result)
    }
}
for output in outputs{
    if output == 0{
        print("YES")
    }else{
        print("NO")
    }
}


