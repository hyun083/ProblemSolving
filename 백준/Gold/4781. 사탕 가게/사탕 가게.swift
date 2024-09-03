import Foundation

while let NM = readLine(){
    let N = Int(NM.split(separator: " ").map{String($0)}[0])!
    let M = NM.split(separator: " ").map{Int(Double($0)!*100+0.5)}[1]
    if N == 0 && M == 0{ break }
    var arr = [(C:Int, P:Int)]()
    arr.append((0,0))
    for _ in 0..<N{
        let CP = readLine()!.split(separator: " ").map{Double($0)!}
        let C = Int(CP[0])
        let P = Int(CP[1]*100+0.5)
        arr.append((C,P))
    }
    
    var dp = Array(repeating: 0, count: M+1)
    
    for i in 1...N{
        let candy = arr[i]
        for target in 1...M{
            if target < candy.P {continue}
            dp[target] = max(dp[target], dp[target-candy.P]+candy.C)
        }
    }
    print(dp[M])
}