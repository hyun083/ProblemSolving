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
    var ans = "no"
    
    var map = [[Int]]()
    for _ in 0..<6{
        let line = readLine()!.split(separator: " ").map{Int($0)!}
        map.append(line)
    }
    
    //141
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
    if top && bottom && side{ ans = "yes" }
    
    top = false; bottom = false; side = false;
    for k in 0..<6{
        var number = 0
        for i in 0..<6{ number += map[i][k] }
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
    if top && bottom && side{ ans = "yes" }
    
    //132
    top = false; bottom = false; side = false;
    for i in 0..<6{
        let number = map[i].reduce(0){$0+$1}
        if number == 3{
            side = true
        }else if number == 1{
            top = true
        }else if number == 2{
            bottom = true
        }
    }
    if top && bottom && side{ ans = "yes" }

    top = false; bottom = false; side = false;
    for k in 0..<6{
        var number = 0
        for i in 0..<6{ number += map[i][k] }
        if number == 3{
            side = true
        }else if number == 1{
            top = true
        }else if number == 2{
            bottom = true
        }
    }
    if top && bottom && side{ ans = "yes" }
    
    //222
    top = false; bottom = false; side = false;
    for i in 0..<6{
        let number = map[i].reduce(0){$0+$1}
        if number == 2{
            if !bottom{
                bottom = true
            }else if !top{
                top = true
            }else if !side{
                side = true
            }
        }
    }
    if top && bottom && side{ ans = "yes" }

    top = false; bottom = false; side = false;
    for k in 0..<6{
        var number = 0
        for i in 0..<6{ number += map[i][k] }
        if number == 2{
            if !bottom{
                bottom = true
            }else if !top{
                top = true
            }else if !side{
                side = true
            }
        }
    }
    if top && bottom && side{ ans = "yes" }
    
    //33
    top = false; bottom = false; side = false;
    for i in 0..<6{
        let number = map[i].reduce(0){$0+$1}
        if number == 3{
            if !bottom{
                bottom = true
            }else if !top{
                top = true
            }
        }
    }
    if top && bottom{ ans = "yes" }

    top = false; bottom = false; side = false;
    for k in 0..<6{
        var number = 0
        for i in 0..<6{ number += map[i][k] }
        if number == 3{
            if !bottom{
                bottom = true
            }else if !top{
                top = true
            }
        }
    }
    if top && bottom{ ans = "yes" }
    print(ans)
}


