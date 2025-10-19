import Foundation

let WH = readLine()!.split(separator: " ").map{Double($0)!}
let W = WH[0]
let H = WH[1]
let diag = sqrt(W*W + H*H)
print(W+H - diag)