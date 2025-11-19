import Foundation

let NAB = readLine()!.split(separator: " ").map{Int($0)!}
let N = NAB[0]
let A = NAB[1]
let B = NAB[2]

var onion1 = 1
var onion2 = 1
var onion1IsPraise = true

for _ in 0..<N{
    if onion1IsPraise{
        onion1 += A
        onion2 += B
        if onion1 == onion2{
            onion2 -= 1
        }else if onion1 < onion2{
            onion1IsPraise = false
        }
    }else{
        onion1 += B
        onion2 += A
        if onion1 == onion2{
            onion1 -= 1
        }else if onion1 > onion2{
            onion1IsPraise = true
        }
    }
}
if onion1IsPraise{
    print(onion1, onion2)
}else{
    print(onion2, onion1)
}