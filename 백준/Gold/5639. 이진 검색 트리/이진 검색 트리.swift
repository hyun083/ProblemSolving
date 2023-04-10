import Foundation

var preOrder = [Int]()

while let input = readLine(){
    preOrder.append(Int(input)!)
}

var ans = [Int]()
func postOrder(from start: Int, to end: Int){
    if start >= end{
        return
    }
    if start == end-1{
        ans.append(preOrder[start])
        return
    }
    var next = start+1
    while next < end{
        if preOrder[start] < preOrder[next]{
            break
        }
        next += 1
    }
    
    postOrder(from: start+1, to: next)
    postOrder(from: next, to: end)
    ans.append(preOrder[start])
}

postOrder(from: 0, to: preOrder.count)
for a in ans{
    print(a)
}