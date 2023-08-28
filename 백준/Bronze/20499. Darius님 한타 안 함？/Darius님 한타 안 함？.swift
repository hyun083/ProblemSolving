let (K,D,A) = [readLine()!.split(separator: "/").map{Int($0)!}].map{($0[0],$0[1],$0[2])}[0]
print(K+A<D || D==0 ? "hasu":"gosu")