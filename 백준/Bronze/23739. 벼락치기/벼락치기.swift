import Foundation

let N = Int(readLine()!)!
var time = 0.0
var ans = 0
for _ in 0..<N{
    let T = Double(readLine()!)!
    if time + T < 30.0{
        time += T
        ans += 1
    }else if (30-time) >= T/2{
        ans += 1
        time = 0
    }else{
        time = 0
    }
}
print(ans)