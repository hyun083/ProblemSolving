import Foundation

let N = Int(readLine()!)!
let inputs = readLine()!
var cnt = 1.0
for input in inputs{
    if input == "S"{
        cnt += 1
    }else{
        cnt += 0.5
    }
}
print(min(N, Int(cnt)))
