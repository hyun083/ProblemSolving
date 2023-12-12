import Foundation

let (N,M,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]

if M<K{
    print(M+N-K)
}else if M==K {
    print(N)
}else{
    print(K+N-M)
}