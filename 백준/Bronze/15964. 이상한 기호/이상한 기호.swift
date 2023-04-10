let AB = readLine()!.split(separator: " ").map{Int(String($0))!}
let A = AB[0]
let B = AB[1]
print((A+B)*(A-B))