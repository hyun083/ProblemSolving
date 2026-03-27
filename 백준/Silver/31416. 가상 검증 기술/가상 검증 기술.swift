import Foundation

let Q = Int(readLine()!)!
for _ in 0..<Q {
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let TA = info[0]
    let TB = info[1]
    let VA = info[2]
    let VB = info[3]
    
    var res = Int.max
    for cnt in 1...VA {
        let tmp = max((TA*cnt),(TA*(VA-cnt))+(TB*(VB)))
        res = min(res,tmp)
    }
    print(res)
}