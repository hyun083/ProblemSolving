import Foundation

var nicknameArr = Dictionary<String,Int>()
var userIdArr = Dictionary<String,Int>()

struct Trie{
    var children: [Trie?]
    
    init(){
        self.children = Array(repeating: nil, count: 26)
    }
    
    mutating func insert(_ word:[Character], _ index:Int, _ nickname:String,_ makeNickname:Bool){
        var nickname = nickname
        var makeNickname = makeNickname
        if index == word.count{
            if makeNickname{
                let num = userIdArr[nickname]!
                if num == 1{
                    print(String(word))
                }else{
                    print(String(word)+"\(num)")
                }
            }else{
                print(nickname)
            }
            return
        }
        
        if makeNickname{
            nickname.append(word[index])
        }
        let idx = Int(word[index].asciiValue!) - 97
        if children[idx] == nil{
            children[idx] = Trie()
            makeNickname = false
        }
        children[idx]?.insert(word, index+1, nickname, makeNickname)
    }
}

let N = Int(readLine()!)!
var root = Trie()
for _ in 0..<N{
    let userId = readLine()!
    if userIdArr[userId] == nil{
        userIdArr[userId] = 1
    }else{
        userIdArr[userId]! += 1
    }
    root.insert(Array(userId), 0, "", true)
}