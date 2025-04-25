import Foundation

var S = readLine()!.map{String($0)}
var zero = 0
var one = 0

for num in S{
    zero += num == "0" ? 1 : 0
    one += num == "1" ? 1 : 0
}

zero = zero/2
one = one/2

for i in 0..<S.count{
    if one == 0{ break }
    if S[i]=="1"{
        S[i] = ""
        one -= 1
    }
}

for i in stride(from: S.count-1, through: 0, by: -1){
    if zero == 0{ break }
    if S[i]=="0"{
        S[i] = ""
        zero -= 1
    }
}
print(S.joined())