import Foundation

let n = Int(readLine()!)!
var s = Set<String>()
var ans = [String]()
s.insert(" ")
for _ in 0..<n{
    let line = readLine()!
    var strs = line.map{String($0)}
    let words = line.split(separator: " ")
    var idx = 0
    var temp = ""
    var flag = false
    for i in 0..<words.count{
        if i > 0{
            idx += words[i-1].count + 1
        }
        let key = String(words[i].first!)
        if !s.contains(key){
            flag = true
            s.insert(key.uppercased())
            s.insert(key.lowercased())
            break
        }
    }
    if flag{
        let k = strs[idx]
        strs[idx] = "[" + k + "]"
        temp = strs.joined()
    }else{
        for str in strs{
            if !s.contains(str) && !flag{
                s.insert(str.uppercased())
                s.insert(str.lowercased())
                flag = true
                temp.append("[")
                temp.append(str)
                temp.append("]")
            }else{
                temp.append(str)
            }
        }
    }
    ans.append(temp)
}
print(ans.joined(separator: "\n"))