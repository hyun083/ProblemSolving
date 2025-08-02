import Foundation

struct Trie{
    var children = Dictionary<String,Trie>()
    
    mutating func insert(_ word: [String], _ index:Int){
        if index == word.count{
            return
        }
        
        var currentWord = ""
        for _ in 0..<index{
            currentWord += " "
        }
        currentWord += word[index]
        
        if children[currentWord] == nil{
            children[currentWord] = Trie()
        }
        children[currentWord]?.insert(word, index+1)
    }
    func dir(){
        for child in children.sorted(by: {$0.key < $1.key}){
            print(child.key)
            child.value.dir()
        }
    }
}
let N = Int(readLine()!)!
var root = Trie()
for _ in 0..<N{
    let input = readLine()!.split(separator: "\\").map{String($0)}
    root.insert(input, 0)
}
root.dir()