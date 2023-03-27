import Foundation

var ans = [String]()
while let player = readLine(){
    if player == "# 0 0"{ break }
    let info = player.split(separator: " ").map{String($0)}
    let name = info[0]
    let age = Int(info[1])!
    let weight = Int(info[2])!
    if 17<age || 80<=weight{
        ans.append("\(name) Senior")
    }else{
        ans.append("\(name) Junior")
    }
}
print(ans.joined(separator: "\n"))