import Foundation

var t = Int(readLine()!)!
let A = 300
let B = 60
let C = 10
var cnt = Array(repeating: 0, count: 3)

while t >= C{
    if t >= A{
        cnt[0] += t/A
        t %= A
    }
    if t >= B{
        cnt[1] += t/B
        t %= B
    }
    if t >= C{
        cnt[2] += t/C
        t %= C
    }
}

if t != 0 {
    print("-1")
}else{
    for c in cnt{
        print(c,terminator: " ")
    }
}