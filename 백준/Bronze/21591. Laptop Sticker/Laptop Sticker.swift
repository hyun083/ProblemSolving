import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let LW = input[0]
let LH = input[1]
let SW = input[2]
let SH = input[3]

let ans = LW >= SW+2 && LH >= SH+2 ? 1:0
print(ans)