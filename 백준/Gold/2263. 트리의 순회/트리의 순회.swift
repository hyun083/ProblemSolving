import Foundation

let N = Int(readLine()!)!
var inOrderTree = readLine()!.split(separator: " ").map{Int(String($0))!}
var postOrderTree = readLine()!.split(separator: " ").map{Int(String($0))!}
var preOrderTree = [Int]()

func preOrder(inBegin:Int, inEnd:Int, postBegin:Int, postEnd:Int){
    if inBegin>inEnd || postBegin>postEnd{
        return
    }
    
    let root = postOrderTree[postEnd]
    let nextIdx = inOrderTree.firstIndex(of: root)!
    preOrderTree.append(root)
    
    preOrder(inBegin: inBegin, inEnd: nextIdx-1, postBegin: postBegin, postEnd: postBegin+(nextIdx-inBegin)-1)
    preOrder(inBegin: nextIdx+1, inEnd: inEnd, postBegin: postBegin+(nextIdx-inBegin), postEnd: postEnd-1)
}
preOrder(inBegin: 0, inEnd: N-1, postBegin: 0, postEnd: N-1)
for p in preOrderTree{
    print(p,terminator: " ")
}