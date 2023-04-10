import Foundation

var trees = [String:Double]()
var total = 0.0
while let name = readLine(){
    total += 1
    if trees[name] == nil{
        trees[name] = 1
    }else{
        trees[name]! += 1
    }
}

for tree in trees.sorted(by: {$0.key < $1.key}){
    let ratio = (tree.value / total * 100)
    print(tree.key, String(format: "%.4f", round(ratio*10000)/10000))
}