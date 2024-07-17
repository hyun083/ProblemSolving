import Foundation

let C = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: true, count: 1001), count: 1001)
var ans = Array(repeating: 0, count: 1001)

for i in 0...1000{
    for k in 0...1000{
        if (i==0 && k==0) || (dp[i][k]==false){ continue }
        var x = i+i
        var y = k+k
        ans[max(i, k)] += 1
        while x<=1000 && y<=1000{
            dp[x][y] = false
            x += i
            y += k
        }
    }
}

for _ in 0..<C{
    let N = Int(readLine()!)!
    print(ans[0...N].reduce(0, +))
}