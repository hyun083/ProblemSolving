import Foundation

let n = Int(readLine()!)!
var words = [String]()
var ans = [String]()

for _ in 0..<n{
    words.append(readLine()!)
}

func isSame(a:String, with b:String) -> Bool {
    let target = a.map{String($0)}
    let temp = b.map{String($0)}
    
    if a.count == b.count{
        let end = b.count
        
        for i in 0..<end{
            var idx = i
            var newWord = [String]()
            for _ in 0..<end{
                newWord.append(temp[idx])
                idx += 1
                idx %= end
            }
            if target == newWord{
                return true
            }
        }
    }
    
    return false
}

ans.append(words[0])

for i in 1..<n{
    let word = words[i]
    var flag = true
    for k in 0..<ans.count{
        if (isSame(a: word, with: ans[k])){
            flag = false
        }
    }
    if flag{
        ans.append(word)
    }
}
print(ans.count)