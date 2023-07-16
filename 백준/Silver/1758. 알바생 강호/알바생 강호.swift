import Foundation

func readInt() -> Int{
    return Int(readLine()!)!
}

let N = readInt()
var arr = [Int]()
var ans = 0

for _ in 0..<N{
    arr.append(readInt())
}

arr.sort(by: >)
for i in 0..<N{
    if arr[i]-i <= 0{ break }
    ans += arr[i] - i
}
print(ans)