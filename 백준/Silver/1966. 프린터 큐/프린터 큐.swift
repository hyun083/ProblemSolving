import Foundation

let P = Int(readLine()!)!

for _ in 1...P{
    let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
    var priority = readLine()!.split(separator: " ").map{Int(String($0))!} //우선순위가 담긴 큐
    let N = inputs[0] //문서개수
    let M = inputs[1] //목표문서
    var count = 0 //출력횟수
    
    var documents = Array<Int>(0..<N) //문서이름이 담긴 큐
    
    while(true){
        while(priority.first != priority.max()){
            priority.append(priority.removeFirst())
            documents.append(documents.removeFirst())
        }
        priority.removeFirst()
        let temp = documents.removeFirst()
        if temp == M{
            break
        }
        count += 1
        
    }

    print(count+1)
}