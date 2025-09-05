import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let num = Int(readLine()!)!
    var bit = 1
    var ans = false
    for _ in 0..<32{
        if num == bit {
            ans = true
            break
        }
        bit = bit << 1
    }
    print(ans ? 1:0)
}