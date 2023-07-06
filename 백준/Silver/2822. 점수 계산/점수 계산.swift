import Foundation

var scores = Dictionary<Int,Int>()
for num in 1...8{
    scores[num] = Int(readLine()!)!
}
let ans = scores.sorted(by: {$0.value > $1.value})[0..<5]
var sum = 0
for ans in ans{
    sum += ans.value
}
print(sum)
for ans in ans.sorted(by: {$0.key < $1.key}){
    print(ans.key, terminator: " ")
}