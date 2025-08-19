import Foundation

let A = readLine()!.map{$0=="8" || $0=="9"}[0]
let B = readLine()!
let C = readLine()!
let D = readLine()!.map{$0=="8" || $0=="9"}[0]
let ans = A && D && (B==C)

print(ans ? "ignore":"answer")