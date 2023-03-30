import Foundation
var document = readLine()!
let word = readLine()!
var cnt = 0
while document.contains(word){
    document.replaceSubrange(document.range(of: word)!, with: "!")
    cnt += 1
}
print(cnt)