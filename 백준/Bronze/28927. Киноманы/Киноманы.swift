import Foundation

let info1 = readLine()!.split(separator: " ").map{Int($0)!}
let info2 = readLine()!.split(separator: " ").map{Int($0)!}

let MAX = (info1[0]*3) + (info1[1]*20) + (info1[2]*120)
let MEL = (info2[0]*3) + (info2[1]*20) + (info2[2]*120)
print(MAX == MEL ? "Draw":MAX>MEL ? "Max":"Mel")