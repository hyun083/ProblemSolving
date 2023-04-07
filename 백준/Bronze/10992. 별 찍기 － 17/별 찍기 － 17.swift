import Foundation

let N = Int(readLine()!)!
var blank = String(repeating: " ", count: N-1)
var star = "*"
var mid = " "

print(blank+star)
for i in 0..<N{
    if i==N-1{
        if i == 0{ break }
        print(blank+star)
    }else if i>0{
        print(blank+"*"+mid+"*")
        mid += "  "
    }
    if !blank.isEmpty{ blank.removeLast() }
    star += "**"
}