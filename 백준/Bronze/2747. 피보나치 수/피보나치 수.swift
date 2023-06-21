let N = Int(readLine()!)!
var ans = Array(repeating: 0, count: 46)
ans[1] = 1

for i in 2..<46{ ans[i] = ans[i-1]+ans[i-2] }
print(ans[N])