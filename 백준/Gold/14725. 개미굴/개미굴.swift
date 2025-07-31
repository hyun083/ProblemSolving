import Foundation

let N = Int(readLine()!)!
struct Trie{
    var children = Dictionary<String,Trie>()
    
    mutating func insert(_ words: [String]){
        insert(words,0)
    }
    
    private mutating func insert(_ words: [String], _ index: Int){
        if index == words.count{
            return
        }
        
        var food = ""
        for _ in 0..<index{
            food += "--"
        }
        food += words[index]
        
        if children[food] == nil{
            children[food] = Trie()
        }
        children[food]?.insert(words,index+1)
    }
    
    func printTrie(){
        for child in children.sorted(by: {$0.key < $1.key}){
            print(child.key)
            child.value.printTrie()
        }
    }
}
var root = Trie()
for _ in 0..<N{
    var input = readLine()!.split(separator: " ").map{String($0)}
    
    input.removeFirst()
    root.insert(input)
}
root.printTrie()