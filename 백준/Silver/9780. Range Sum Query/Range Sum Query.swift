import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let _ = readLine()
    let NQ = readLine()!.split(separator: " ").map{Int($0)!}
    let N = NQ[0]
    let Q = NQ[1]
    
    var arr = [0]+readLine()!.split(separator: " ").map{Int($0)!}
    var prefixSum = [Int]()
    var tmp = 0
    
    for i in 0..<N+1{
        tmp += arr[i]
        prefixSum.append(tmp)
    }
    
    for _ in 0..<Q{
        let IJ = readLine()!.split(separator: " ").map{Int($0)!}
        let I = IJ[0]
        let J = IJ[1]+1
        
        print(prefixSum[J]-prefixSum[I])
    }
    print()
}