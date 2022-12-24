//
//  main.swift
//  1917_swift
//
//  Created by Hyun on 2022/12/24.
//

import Foundation

for _ in 0..<3{
    var top = false
    var bottom = false
    var side = false
    
    var map = [[Int]]()
    for _ in 0..<6{
        let line = readLine()!.split(separator: " ").map{Int($0)!}
        map.append(line)
    }
    for i in 0..<6{
        let number = map[i].reduce(0){$0+$1}
        if number == 4{
            side = true
        }else if number == 1{
            if !top{
                top = true
            }else{
                bottom = true
            }
        }
    }
    if top && bottom && side{
        print("yes")
    }else{
        top = false
        bottom = false
        side = false
        for k in 0..<6{
            var number = 0
            for i in 0..<6{
                number += map[i][k]
            }
            if number == 4{
                side = true
            }else if number == 1{
                if !top{
                    top = true
                }else{
                    bottom = true
                }
            }
        }
        if top && bottom && side{
            print("yes")
        }else{
            print("no")
        }
    }
}


