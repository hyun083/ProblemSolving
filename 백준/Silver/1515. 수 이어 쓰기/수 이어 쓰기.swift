import Foundation

let str = readLine()!.map{Int(String($0))!}
var num = 1
var idx = 0
while true{
    var tmp = false
    for n in String(num){
        if String(str[idx]) == String(n){
            idx += 1
            if idx == str.count{
                tmp = true
                break }
        }
    }
    if tmp { break }
    num += 1
}
print(num)