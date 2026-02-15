import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let K = Int(readLine()!)!
    let num = Set(readLine()!.split(separator: " ").map{Int($0)!})
    let N = Int(readLine()!)!
    var bestTime = Int.max
    var bestNumber = 0
    var cnt = 0
    for _ in 0..<N{
        let line = readLine()!.split(separator: " ").map{Int($0)!}
        let number = line[0]
        let hh = line[1]
        let mm = line[2]
        let time = hh*60+mm
        
        if hh<0 && mm<0 {
            continue
        } else {
            if num.contains(number) && time<=6*60 {
                cnt += 1
                if time < bestTime {
                    bestTime = time
                    bestNumber = number
                }
            } else {
                continue
            }
        }
    }
    print(bestNumber, cnt)
}