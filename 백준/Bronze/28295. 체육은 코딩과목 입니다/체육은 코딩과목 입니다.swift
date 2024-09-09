import Foundation

var curr = 0
let ans = ["N","E","S","W"]

for _ in 0..<10{
    let cmd = Int(readLine()!)!
    if cmd == 1{
        curr += 1
        curr %= 4
    }else if cmd == 2{
        curr += 2
        curr %= 4
    }else{
        curr -= 1
        curr = curr<0 ? 3:curr
    }
}
print(ans[curr])