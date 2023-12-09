import Foundation

var ans = Array(repeating: Array(repeating: 0, count: 31), count: 31)
ans[1][0] = 1
ans[1][1] = 1
for i in 2..<31{
    ans[i][0] = 1
    for k in 1...i{
        ans[i][k] = ans[i][k-1] + ans[i-1][k]
    }
}

while let line = readLine(){
    let N = Int(line)!
    if N == 0{ break }
    print(ans[N][N])
}