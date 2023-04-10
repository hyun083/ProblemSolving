import Foundation

while true {
    let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
    if inputs[0] == 0{
        break
    }
    let K = inputs[0]
    var S = inputs
    S.removeFirst()
    S.sort(by: <)
    var arr = [String]()
    var ans = [String]()
    var visited = Array(repeating: false, count: K)
    
    func btk(numb:Int, cnt:Int){
        if cnt == 6{
            if arr.count == 6{
                ans.append(arr.joined(separator: " "))
            }
            return
        }
        
        for i in numb..<K{
            if visited[i]==false {
                visited[i] = true
                arr.append(String(S[i]))
                btk(numb: i, cnt: cnt+1)
                arr.removeLast()
                visited[i] = false
            }
        }
    }
    btk(numb: 0, cnt: 0)
    print(ans.joined(separator: "\n"))
    print()
}