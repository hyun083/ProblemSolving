import Foundation

let N = Int(readLine()!)!
for _ in 0..<N{
    let DFP = readLine()!.split(separator: " ").map{Double($0)!}
    let D = DFP[0]
    let F = DFP[1]
    let P = DFP[2]
    let cost = round((D*F*P)*100)/100
    print("$\(String(format: "%.2f",cost))")
}