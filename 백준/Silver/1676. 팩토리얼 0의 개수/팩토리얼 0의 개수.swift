import Foundation

let N = Int(readLine()!)!
var cnt = 0
if N != 0{
    for i in 1...N{
        if i%5 == 0{
            cnt += 1
        }
        if i%25 == 0{
            cnt += 1
        }
        if i%125 == 0{
            cnt += 1
        }
    }
}
print(cnt)