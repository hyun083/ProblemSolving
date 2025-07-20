import Foundation

let N = Int(readLine()!)!
var ans = [(num:Int, spd:Double)]()
for i in 1...N{
    let XYV = readLine()!.split(separator: " ").map{Double($0)!}
    let X = XYV[0]
    let Y = XYV[1]
    let V = XYV[2]
    
    let res = sqrt(Double((X*X) + (Y*Y))) / V
    ans.append((i,res))
}
ans.sort {$0.spd == $1.spd ? $0.num < $1.num : $0.spd < $1.spd}
for ans in ans{
    print(ans.num)
}