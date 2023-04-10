import Foundation

let hw = readLine()!.split(separator: " ").map{Int(String($0))!}
let h = hw[0]
let w = hw[1]
var map = [[Int]]()
for _ in 0..<h{
    map.append(readLine()!.map{
        if $0=="."{
            return -1
        }else{
            return 0
        }
    })
}
for i in 0..<h{
    var number = 0
    var flag = false
    for k in 0..<w{
        if map[i][k] > -1{
            flag = true
        }
        if flag{
            if map[i][k] != 0{
                map[i][k] += number
            }else{
                number = 1
            }
        }
        number += 1
    }
}
for map in map {
    for m in map{
        print(m,terminator: " ")
    }
    print()
}