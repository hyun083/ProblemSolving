import Foundation

let line = readLine()!.split(separator: " ").map{Int($0)!}
let p = line[0]*line[2]
let q = line[1]*line[3]*2
print(p%q==0 ? 1:0)