let star = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = star[0] - 1
let t = star[1]
let c = star[2]
let p = star[3]
print((n/t)*c*p)