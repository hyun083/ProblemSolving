import Foundation

let s = readLine()!.map{String($0)}

var rev = s
rev.removeLast()

var str = s+rev.reversed()
var ans = s==s.reversed() ? s.count:str.count

while !rev.isEmpty{
    rev.removeLast()
    str = s+rev.reversed()
    if str == str.reversed(){
        ans = str.count
    }
}

print(ans)