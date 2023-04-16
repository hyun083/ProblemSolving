import Foundation

let line = readLine()!.split(separator: " ").map{Int($0)!}
let T = line[0]
let A = line[1]

print((A==1 || (T<12 || 16<T)) ? 280 : 320)
