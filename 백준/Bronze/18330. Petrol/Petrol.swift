import Foundation

let N = Int(readLine()!)!
let K = Int(readLine()!)!+60
let BASECHAERGE = 1500
let EXTRACHARGE = 3000

if N <= K{
    print(N*BASECHAERGE)
}else{
    print((K*BASECHAERGE)+((N-K)*EXTRACHARGE))
}