import Foundation

let C = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: true, count: 1001), count: 1001)
var ans = Array(repeating: 0, count: 1001)

for i in 0...1000{
    for k in 0...1000{
        if i==0 && k==0 { continue }
        
        var x = i+i
        var y = k+k
        
        while x<=1000 && y<=1000{
            dp[x][y] = false
            x += i
            y += k
        }
    }
}

for _ in 0..<C{
    let N = Int(readLine()!)!
    var tmp = 0
    for i in 0...N{
        for k in 0...N{
            tmp += dp[i][k] ? 1:0
        }
    }
    print(tmp-1)
}