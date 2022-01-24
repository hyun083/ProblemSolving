//
//  main.swift
//  16437_swift
//
//  Created by Hyun on 2022/01/24.
//

import Foundation

let N = Int(readLine()!)!
var tree = Array(repeating: [Int:Int](), count: N)
var visited = Array(repeating: false, count: N)

for i in 1..<N{
    let edge = readLine()!.split(separator: " ").map{String($0)}
    let node = Int(edge[2])! - 1
    var weight = 0
    if edge[0] == "W"{
        weight -= Int(edge[1])!
    }else{
        weight += Int(edge[1])!
    }
    tree[node][i] = weight
    tree[i][node] = weight
}

var total = 0
func dfs(node:Int,cost:Int){
    if node == 0{
        total += cost
        return
    }
    visited[node] = true
    
    for t in tree[node]{
        if !visited[t.key]{
            let cost = cost + t.value
            if cost > 0 {
                dfs(node: t.key, cost: cost)
            }else{
                dfs(node: t.key, cost: 0)
            }
        }
    }
}

for i in 1..<N{
    if tree[i].count == 1{
        dfs(node: i, cost: 0)
    }
}
print(total)


//#include<iostream>
//#include<vector>
//using namespace std;
//typedef long long ll;
//
//vector< vector<int> > adj;
//vector<char> kind;
//vector<ll> numOfAni;
//
//ll postSearch(int idx) {
//    ll sum = 0;
//    for (int next : adj[idx]) {
//        sum += postSearch(next);
//    }
//    if (kind[idx] == 'S') return numOfAni[idx] + sum;
//    else
//        return (sum - numOfAni[idx] >= 0) ? sum - numOfAni[idx] : 0;
//}
//int main() {
//    int N;
//    scanf("%d", &N);
//
//    adj.resize(N + 1);
//    kind.resize(N + 1);
//    numOfAni.resize(N + 1);
//    for (int i = 2; i <= N; i++) {
//        int edgeFrom;
//        scanf(" %c%lld%d", &kind[i], &numOfAni[i], &edgeFrom);
//        adj[edgeFrom].push_back(i);
//    }
//    printf("%lld\n", postSearch(1));
//    return 0;
//}
