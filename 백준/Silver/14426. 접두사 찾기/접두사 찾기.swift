import Foundation

struct Trie{
    var children: [Trie?]
    
    init(){
        self.children = Array(repeating: nil, count: 26)
    }
    
    mutating func insert(_ word: String){
        insert(Array(word), 0)
    }
    
    private mutating func insert(_ word: [Character], _ index: Int){
        if index == word.count{
            return
        }
        
        let char = word[index]
        let idx = Int(char.asciiValue! - Character("a").asciiValue!)
        
        if children[idx] == nil{
            children[idx] = Trie()
        }
        children[idx]?.insert(word, index + 1)
    }
    
    func isPrefix(_ word: [Character], _ index:Int) -> Bool{
        var res = true
        if index == word.count{
            return true
        }
        let char = word[index]
        let idx = Int(char.asciiValue! - Character("a").asciiValue!)
        
        if children[idx] == nil{
            return false
        }else{
            res = res && children[idx]?.isPrefix(word, index + 1) ?? false
        }
        
        return res
    }
}

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var ans = 0
var root = Trie()

for _ in 0..<N{
    let word = readLine()!
    root.insert(word)
}

for _ in 0..<M{
    let word = readLine()!
    ans += root.isPrefix(Array(word), 0) ? 1 : 0
}
print(ans)