import Foundation

let N = Int(readLine()!)!
var target = 99
var ans = 0

func check(num: Int) -> Int {
    var res = 0
    var target = 1
    var offset = 0
    for _ in 0..<String(num).count-1 {
        target *= 10
        target += 1
    }
    offset = target
    while num >= target {
        res += 1
        target += offset
    }
    return res
}

if N >= 9 {
    ans += 10
    while true {
        if N >= target {
            ans += 9
            target *= 10
            target += 9
            if N == target {
                ans += 9
                break
            }
        } else {
            ans += check(num: N)
            break
        }
    }
    print(ans)
} else {
    print(N+1)
}