import Foundation

let num = [3, 2, 1, 2, 3, 3, 2, 3, 3, 2, 2, 1, 2, 2, 1, 2, 2, 2, 1, 2, 1, 1, 1, 2, 2, 1]
var A = readLine()!.map{ num[Int(exactly: Character(String($0)).asciiValue!)! - 65] }
var B = readLine()!.map{ num[Int(exactly: Character(String($0)).asciiValue!)! - 65] }
var ans = [Int]()

for i in 0..<A.count{
    ans.append(A[i])
    ans.append(B[i])
}

while ans.count > 2{
    var tmp = [Int]()
    for i in 0..<ans.count-1{
        tmp.append((ans[i]+ans[i+1])%10)
    }
    ans = tmp
}
print("\(ans[0])\(ans[1])")