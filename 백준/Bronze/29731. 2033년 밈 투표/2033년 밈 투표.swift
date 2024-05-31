import Foundation

var dic = Set<String>()
dic.insert("Never gonna give you up")
dic.insert("Never gonna let you down")
dic.insert("Never gonna run around and desert you")
dic.insert("Never gonna make you cry")
dic.insert("Never gonna say goodbye")
dic.insert("Never gonna tell a lie and hurt you")
dic.insert("Never gonna stop")

let N = Int(readLine()!)!
var ans = true


for i in 0..<N{
    let line = readLine()!
    if !dic.contains(line){
        ans = false
        break
    }
}
print(ans ? "No":"Yes")