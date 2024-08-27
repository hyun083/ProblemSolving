let AB = readLine()!.split(separator: " ").map{Int($0)!}
let A = AB[0]
let B = AB[1]
var ans = B+1<=A ? (2*B+1):(A+A-1)
print(ans)