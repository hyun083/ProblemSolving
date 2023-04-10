import Foundation

let t = Int(readLine()!)!

for _ in 0..<t{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let x1 = info[0]
    let y1 = info[1]
    let x2 = info[2]
    let y2 = info[3]
    
    let x3 = info[4]
    let y3 = info[5]
    let x4 = info[6]
    let y4 = info[7]
    
    let sqr = (x2-x1)*(y2-y1)
    let sqr2 = max((min(x2, x4)-max(x1, x3)),0)*max((min(y2, y4)-max(y1, y3)),0)
    print(sqr - sqr2)
}