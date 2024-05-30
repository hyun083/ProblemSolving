import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
if N == 0{
    print(0)
}else{
    let book = readLine()!.split(separator: " ").map{Int($0)!}
    var curr = M
    var cnt = 1
    
    for book in book{
        if curr - book >= 0{
            curr -= book
        }else{
            curr = M-book
            cnt += 1
        }
    }
    print(cnt)
}