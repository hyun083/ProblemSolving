import Foundation


let C = Int(readLine()!)!

for _ in 0..<C{
    let info = readLine()!.split(separator: " ").map{Double($0)!}
    let cnt = info[0]
    var total = info[1..<info.count].reduce(0, +)
    var avg = total/cnt
    var res = 0.00
    
    for score in info[1..<info.count]{
        res += score>avg ? 1:0
    }
    var ans = res/cnt*100
    ans = round(ans*1000)/1000
    print(String(format: "%.3f", ans),terminator: "%\n")
}