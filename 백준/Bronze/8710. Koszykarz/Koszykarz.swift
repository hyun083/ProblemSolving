import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let K = info[0]
let W = info[1]
let M = info[2]

if K >= W {
    print(0)
}else{
    print((W-K)%M==0 ? (W-K)/M:(W-K)/M+1)
}