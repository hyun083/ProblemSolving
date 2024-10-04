import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let NM = readLine()!.split(separator: " ").map{Int($0)!}
    let N = NM[0]
    let M = NM[1]
    
    var tmp = 1
    var day = 1
    
    while tmp < 1000000000000{
        tmp *= 2
        if tmp > N{
            break
        }
        day += 1
    }
    print(day+M)
}