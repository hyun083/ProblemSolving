import Foundation

let ABC = readLine()!.split(separator: " ").map{Int($0)!}
let A = ABC[0]
let B = ABC[1]
let C = ABC[2]

print(A+B==C ? "correct!" : "wrong!")