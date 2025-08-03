import Foundation

var numberOf = Dictionary<String,Int>()

struct Trie{
    var children:[Trie?] = Array(repeating: nil, count: 26)
    
    mutating func insert(_ word:[Character], _ index:Int, _ nickname:String,_ completeNickname:Bool){
        var nickname = nickname
        var completeNickname = completeNickname
        
        if index == word.count{
            if completeNickname{
                print(nickname)
            }else{
                let num = numberOf[nickname]!
                print(num==1 ? String(word) : String(word)+"\(num)")
            }
            return
        }
        
        if !completeNickname{
            nickname.append(word[index])
        }
        let idx = Int(word[index].asciiValue!) - 97
        if children[idx] == nil{
            children[idx] = Trie()
            completeNickname = true
        }
        children[idx]?.insert(word, index+1, nickname, completeNickname)
    }
}

let N = Int(readLine()!)!
var root = Trie()
for _ in 0..<N{
    let userId = readLine()!
    if numberOf[userId] == nil{
        numberOf[userId] = 1
    }else{
        numberOf[userId]! += 1
    }
    root.insert(Array(userId), 0, "", false)
}