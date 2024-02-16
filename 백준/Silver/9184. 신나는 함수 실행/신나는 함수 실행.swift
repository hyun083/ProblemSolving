import Foundation

let INF = 1048577
var dp = Array(repeating: Array(repeating: Array(repeating: INF, count: 21), count: 21), count: 21)

while let line = readLine(){
    let input = line.split(separator: " ").map{Int($0)!}
    if input == [-1,-1,-1]{ break }
    
    func w(a:Int, b:Int, c:Int) -> Int{
        if a<=0 || b<=0 || c<=0 {
            return 1
        }else if a>20 || b>20 || c>20{
            return w(a: 20, b: 20, c: 20)
        }
        
        if dp[a][b][c] == INF{
            if a<b && b<c{
                dp[a][b][c] = w(a: a, b: b, c: c-1) + w(a: a, b: b-1, c: c-1) - w(a: a, b: b-1, c: c)
            }else{
                dp[a][b][c] = w(a: a-1, b: b, c: c) + w(a: a-1, b: b-1, c: c) + w(a: a-1, b: b, c: c-1) - w(a: a-1, b: b-1, c: c-1)
            }
        }
        
        return dp[a][b][c]
    }
    
    let (a,b,c) = (input[0], input[1], input[2])
    print("w(\(a), \(b), \(c)) =",w(a: a, b: b, c: c))
}