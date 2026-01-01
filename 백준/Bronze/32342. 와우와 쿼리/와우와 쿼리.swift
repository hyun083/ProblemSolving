import Foundation

let T = Int(readLine()!)!
for _ in 1...T{
    let Q = readLine()!.map{String($0)}
    var res = 0
    if Q.count>=3{
        for i in 0..<Q.count-2{
            let sound = Q[i..<i+3].joined()
            res += sound=="WOW" ? 1:0
        }
    }
    print(res)
}