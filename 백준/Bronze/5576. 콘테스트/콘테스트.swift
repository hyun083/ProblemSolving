import Foundation

var W = [Int]()
var K = [Int]()
for i in 0..<20{
    if i < 10{
        W.append(Int(readLine()!)!)
    }else{
        K.append(Int(readLine()!)!)
    }
}
W.sort(by: <)
K.sort(by: <)
let w = W[9] + W[8] + W[7]
let k = K[9] + K[8] + K[7]
print(w, k)