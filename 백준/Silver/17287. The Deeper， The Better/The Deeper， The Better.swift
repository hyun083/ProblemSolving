import Foundation

var S = readLine()!.map{String($0)}
var stk = [String]()
var score = 0
var ans = 0

while !S.isEmpty {
    let curr = S.removeLast()
    if curr == "]" {
        score += 3
    } else if curr == "}" {
        score += 2
    } else if curr == ")" {
        score += 1
    } else if curr == "[" {
        score -= 3
    } else if curr == "{" {
        score -= 2
    } else if curr == "(" {
        score -= 1
    } else {
        ans = max(ans,score)
    }
}
print(ans)