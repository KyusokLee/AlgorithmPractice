//
//  main.swift
//  Programmers_AlgorithmSwift
//
//  Created by Lee's Pc on 2021/09/21.
//

import Foundation

//Day 5　9月19日の勉強
//프로그래머스 위장 swift
//Programmers High Score Kit - Hash _Disguise (Swift)
func solution(_ clothes:[[String]]) -> Int {
    var dic = [String:[String]]()
    for c in clothes{
        if dic[c[1]] != nil{
            dic[c[1]]!.append(c[0])
        } else {
            dic[c[1]] = [c[0]]
        }
    }
    
    let count = dic.mapValues{$0.count}.values
    return count.reduce(1){$0*($1+1)} - 1
}
//여기서 count라는 위에서 작성한 딕셔너리에서의 값에 있는 요소의 수만을 (즉 ["yellowhat", "green_turban"]이면 2로 출력)를 카운트하여 배열로 출력하는 상수를 만든다. mapValues는 매핑한 것을 딕셔너리의 값으로 출력해줌. 여기서 값만을 원한다면, 그 뒤에 mapValues{$0.count}.values를 붙인다. (여기에서 $0은 요소에 순서대로 접근하는 shortand argument names)
// reduce함수는 컨테이너 내부의 함수를 통합한다. 즉, 예를 들어, [3, 7, 9]가 있고, 이 안의 요소들을 전부 더하고 싶다면, reduce(0){$0 + $1}을 하면 된다. 여기서 reduce(0)에서의 괄호안의 값은, 초기값을 뜻하고, 첫 번째 매개변수인 $0은 초기값으로부터 출발하여 마지막 요소까지 순회하는 내내의 결과값을 나타낸다. 두 번째 매개변수인 $1은 현재 순회하고 있는 요소의 값을 뜻한다. 결국 위에서의 return값은 초기값인 1 * (각각 요소의 값 + 1) 을 반복하여 마지막으로 - 1을 한 값이다.

print(solution([["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]]))

// 알고리즘 해석
// print(solution([~~~])에서 clothes[0]은["yellowhat", "headgear"]에 해당
// func solution 내부에서의 for문의 c라는 상수는 clothes[0]부터 시작하게 됨. 즉, 여기서의 c[1]은 사실은 clothes[0][1]이 들어간다는 뜻!
// 위의 알고리즘을 그대로 따라가면은, dic을 빈 배열로 초기화해주었기에 아무 요소(키 : 값)가 없는 상황이다.
// for문이 시작될때, clothes[0][1]부터 시작이 되는데 (c라는 상수자체가 clothes[0] 부터 시작하기에), 그렇게 되면 처음에는 dic[c[1]] 은 nil 이기에 else문을 따라가게 된다.
// 그렇게되면, 의상의 종류를 키값으로 해당 의상의 종류(이것이 값이 됨)가 담긴 배열을 만들어준다. 즉, ["yellowhat", "headgear"]에서 headgear를 키로하는 배열을 만든다. 이때, headgear를 키값에 yellowhat이 들어가게 된다.
// 다음으로 for문의 반복에 의해, clothes[1][1]이 대입되어 for문이 실행되는데, eyewear를 키로 하는 딕셔너리가 아직 없는 관계로 else문을 실행 후 eyeswear를 키로 하는 배열을 만든 후, 이 키에 bluesunglasses를 값으로서 대입하게 된다.
// 다음의 for문 반복은 clothes[2][1]이 대입되어 실행된다. 이때, c[1], 즉 clothes[2][1]은 headgear이다. 좀 전에 위에서 headgear를 키로하는 딕셔너리를 만들었기에, dic[c[1]] 은 존재한다는 것을 알 수 있다. 즉, for문의 if문, dic[c[1]] != nil (해당 딕셔너리가 nil이 아니고 이미 존재하기에) 이 실행된다. 이때, 해당 의상의 종류를 키로 하는 딕셔너리에 해당 배열의 이름이 값으로 추가되게 된다. 그렇기에 [String : [String]]으로 만든것이지.. (의상의 종류는 한정되어도, 의상의 이름은 여러가지가 될 수 있으니)
// for문은 clothes배열의 종류만큼 진행하기에 이걸로 for문은 종류가 된다.

let asiaKuni: [String] = ["Korea", "Japan", "China", "Taiwan", "Russia"]
for i in asiaKuni {
    print(i)
}

for j in 0..<asiaKuni.count {
    print(j)
    let eastAsia = asiaKuni[j]
    print(eastAsia)
}

//프로그래머스 베스트앨범 swift 고득점Kit
//Programmers High Score Kit - Hash _BestAlbum (Swift)

func solution(_ genres: [String], _ plays: [Int]) -> [Int] {
    var genrePlay: [String:Int] = [:]
    var indexInGenre: [String:[Int]] = [:]
    
    for i in 0..<genres.count {
        let genre = genres[i]
        let play = plays[i]
        
        if let playsCount = genrePlay[genre] {
            genrePlay[genre] = play + playsCount
        } else {
            genrePlay[genre] = play
        }
        
        if indexInGenre[genre] != nil {
            indexInGenre[genre]!.append(i)
        } else {
            indexInGenre[genre] = [i]
        }
    }
    
    let bestGenre: [String] = Array(genrePlay.keys).sorted {
        return genrePlay[$0]! > genrePlay[$1]!
    }
    // 여기서 genrePlay.keys 인 이유는 >> bestGenre라는 상수를 자료형인 String인 배열로 정의하였으므로, 위에서 만든 genrePlay라는 딕셔너리의 키에 해당하는 값이 String에 해당하기 때문이다. 여기서, genrePlay.values로하면 오류가 발생!
    //또한, 가장 많이 재생된 장르를 먼저 수록 하므로 내림차순(가장 먼저 값이 큰 값이 출력됨( [30, 10, 20]이면, [30, 20, 10] 순으로 출력)을 이용한다. sorted함수를 이용하여 내림차순으로 하려면, return 딕셔너리[$0]! > 딕셔너리[$1]! 을 해주면 된다. 오름차순일 경우, 부호가 반대.
    //여기서 sorted함수를 이용하여 재생 수가 많은 장르를 오름차순으로 정렬한다. 단, 그 장르의 재생 수가 출력되는 것은 아니며, 많이 재생된 장르 순으로 출력되기만 한다.
    //sort함수와 sorted함수의 차이점은, sort함수는 호출된 배열을 변경하여 값들이 정렬된다. 반면, sorted함수는 정렬된 값으로 된 배열의 사본을 리턴한다.
    
    var answer: [Int] = []
    for genre in bestGenre {
        let sortedID = indexInGenre[genre]!.sorted {
            return plays[$0] > plays[$1]
        }
        //print(sortedID)
        // 위에서 sortedID의 출력 : ["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500]을 입력하였다고 가정 시, sortedID를 출력해보면, [4, 1] , [3, 0, 2]의 두 가지 배열을 가지게 된다.
        answer.append(sortedID[0])
        if sortedID.count > 1 {
            answer.append(sortedID[1])
        }
    }
    // 위의 sortedID설명 : 위에서 indexInGenre이라는 딕셔너리의 Value값에 반복문의 index 순서대로 (0 -> 1 -> 2 -> ...)입력된 요소들을 plays(재생 횟수)가 많은 순서대로 내림차순 정렬을 한다. 내림차순으로 정렬 된 배열의 사본 (sorted함수)을 이용하여, 빈 배열 answer에 내림차순으로 정렬 된 각각의 배열사본의 첫 요소를 입력한다. 그 이후, 만약 각 배열의 요소들의 수가 1을 넘겼을 시, 각 배열의 두변째 요소 sortedID[1]을 answer 배열의 끝에 입력하게된다.
    
    //        for i in sortedID {
    //            answer.append(i)
    //        }
    // 위의 표현처럼 실행하게 되면, indexInGenre의 요소 수가 3개 이상이면, 그 요소들을 전부 answer의 배열에 입력하게 된다. 문제에서 가장 많이 재생된 노래를 두 개씩 모아 베스트 앨범을 출시하려고 한다고 지정하였기에, 요소 수가 3개 이상이라도 내림차순으로 정렬된 앞의 두개만 answer이라는 배열에 입력되어야한다. 그렇기에 이 방법은 답에 근접하지만 옳지 않은 답이다.
    return answer
}


print(solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500]))

//Day6
//Programmers High Score Kit - Stack/Queue _機能開発 (Swift)
//프로그래머스 고득점 Kit - 스택/큐 _ 기능개발

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var progress = progresses
    var eachSpeed = speeds
    var answer: [Int] = []
    var releaseIdx = 0

    //while문을 이용하여, 작업의 진도를 나타내는 progress의 배열이 비어있지 않을 동안 반복해준다.
    // 만약, progress 배열의 첫번째 요소가 100을 넘지 않는다면, for in 반복문을 이용하여, 동시에 각 작업 진도에 각 작업속도를 더하는 작업을 한다. 동시에 하는 이유는, 하루라는 시간은 작업의 개수와 작업의 속도와 관계없이 똑같이 흐르기에, 1일이 지날때마다의 각 작업진도의 상황을 각 작업의 속도를 더함으로서 갱신시키기 위해서이다.
    // 첫번째 요소가 100을 넘지 않을 동안, 두번째나 그 뒤의 요소가 100을 넘더라도 계속 진행속도를 더해준다.
    while progress.isEmpty == false {
        if progress.first! < 100 {
            for i in 0..<progress.count {
                progress[i] += eachSpeed[i]
            }

            if releaseIdx > 0 {
                answer.append(releaseIdx)
                releaseIdx = 0
            }
        } else {
            progress.removeFirst()
            eachSpeed.removeFirst()
            releaseIdx += 1
        }
        // 위에서의 else문은, 첫번째 요소가 100 이상이 될 경우, 첫번째 요소의 작업 진도와 작업 속도를 배열에서 지움으로서, 두번째 요소가 첫번째요소로, 세번째 요소가 두번째 요소로 각각 인덱스를 앞으로 당기는 작업을 한다. 그리고 배포하는 기능의 수 = releaseIdx(완료된 작업의 수)를 1씩 더해준다. 이는, 작업이 100이 되어 완료가 될 경우, 배포를 하기 때문이다.
        // 첫번째 요소가 지워지면, 두번째 요소가 progress.first 가 되어, for문을 반복한다. 이때, 두번째 요소도 이미 100을 넘어 완료된 상태라면, 작업이 100이 되어 배포 준비가 된상태이기에, 다시 한번, 배포하는 기능의 수를 1을 더해준다. 만약, 두번째 요소가 아직 100을 넘지 못한 상태라면, for 문을 통해, 두번째 요소가 100이 될때까지 각 작업의 진행속도를 더하는 작업이 반복된다. 그리고 배포하는 기능의 수가 0을 넘었으므로, if releaseIdx > 0의 작업을 진행하여, answer라는 배열에 releaseIdx의 숫자값을 입력하게 된다. 여기서, releaseIdx를 0으로 다시 초기화 시켜주는 이유는, 0으로 초기화 시켜주지 않으면, 배포하는 기능의 수인 releaseIdx에 계속 플러스 1씩 되기 때문이다.
    }
 
    if releaseIdx > 0 {
        answer.append(releaseIdx)
    }
    // 배열안의 작업의 수(요소)가 모두 없어질 경우, 가장 마지막의 작업의 배포가능한 기능의 수를 처리해야 한다. 마지막요소의 작업이 완료되어 배포가능하기 때문에, 배포가능한 기능의 수를 answer이라는 배열에 입력해야 되기에, 위에서의 if문과 같은 알고리즘을 작성해주었다.
   
    return answer
}

print(solution([93, 30, 55], [1, 30, 5]))
print(solution([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1]))

//Day 7
//Programmers High Score Kit - Stack/Queue _プリンター (Swift)
//프로그래머스 고득점 Kit - 스택/큐 _ 프린터

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var priority = priorities
    let requIndex = location
    var waitList: [(index: Int, priority: Int)] = []
    var print: [(Int, Int)] = []
    // 인덱스랑 우선순위가 같이 저장되는 튜플을 생성
    var result = 0
    
    priority.enumerated().forEach { (index, property) in
        waitList.append((index, property))
    }
    //열거형과 foreach를 이용하여 waitList에 대입한다.

    while priority.isEmpty == false {
        if priority.first! == priority.max() {
            priority.removeFirst()
            print.append(waitList.first!)
            waitList.removeFirst()
        } else {
            priority.append(priority.first!)
            priority.removeFirst()
            waitList.append(waitList.first!)
            waitList.removeFirst()
        }
    }
    
    for j in 0..<print.count {
        if print[j].0 == requIndex {
            result = j + 1
        }
    }

    
    return result
}

print(solution([2, 1, 3, 2], 2))
print(solution([1, 1, 9, 1, 1, 1], 0))

//print(solution([2, 1, 3, 2], 2)) >>>> A value of this return is 1
// [1, 3, 2, 2] >> [3, 2, 2, 1] >> [2, 2, 1]
//waitList = [3, 2, 2, 1]

// if print(solution([1, 2, 3, 2], 2))
// priority배열 : [1, 2, 3, 2] >> [2, 3, 2, 1] >> [3, 2, 1, 2] >> [2, 1, 2] >> [1, 2] >> [2, 1]
// waitList배열 : [(0, 1), (1, 2), (2, 3), (3, 2)] >> [          ] >> [3         ] >> [3, 2   ] >> [3, 2] >> [3, 2, 2] >> [3(2번째 요소꺼), 2(1번째 요소꺼), 2(3번째 요소꺼), 1(0번째 요소꺼)]
//
//func solution(_ priorities:[Int], _ location:Int) -> Int {
//    var queue: [(Int, Int)] = []
//    var priorityQueue = priorities.sorted(by : >)
//    var result = 0
//
//    priorities.enumerated().forEach { (index, property) in
//        queue.append((index, property))
//    }
//
//    while !queue.isEmpty {
//        if queue.first!.1 == priorityQueue.first! {
//            if queue.first!.0  == location {
//                return result + 1
//            }
//            result += 1
//            queue.removeFirst()
//            priorityQueue.removeFirst()
//        } else {
//            queue.append(queue.removeFirst())
//        }
//    }
//
//    return result
//}
//
//print(solution([2, 1, 3, 2], 2))

//Day 8
//Programmers High Score Kit - Stack/Queue _橋を走るトラック (Swift)
//프로그래머스 고득점 Kit - 스택/큐 _ 다리를 지나는 트럭 (Swift)

//トラックは１秒で１を移動する
//트럭은 1초에 1만큼 움직인다.
//트럭 여러 대가 강을 가로지르는 일차선 다리를 정해진 순으로 건너려 합니다. 모든 트럭이 다리를 건너려면 최소 몇 초가 걸리는지 알아내야 합니다. 다리에는 트럭이 최대 bridge_length대 올라갈 수 있으며, 다리는 weight 이하까지의 무게를 견딜 수 있습니다. 단, 다리에 완전히 오르지 않은 트럭의 무게는 무시합니다.
//예를 들어, 트럭 2대가 올라갈 수 있고 무게를 10kg까지 견디는 다리가 있습니다. 무게가 [7, 4, 5, 6]kg인 트럭이 순서대로 최단 시간 안에 다리를 건너려면 다음과 같이 건너야 합니다.

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var bridge = Array(repeating: 0, count: bridge_length)
    var truck = truck_weights
    var sec = 0
    var addedWei = 0

    //알고리즘 해석 : bridge 라는 요소가 전부 0이며 그 요소의 수가 다리의 길이만큼 반복되는 배열을 만들어준다. 이것은, 트럭이 bridge 라는 배열의 뒤에서부터 다리에 들어오기 시작함을 나타내주기 위해서이다. 만약, 예를 들어 다리의 길이가 3이고 첫번째로 들어올 트럭의 무게가 7이면, [0, 0, 0] 이었던것이 [0, 0, 7] 이 됨. 이유는, 아래의 nowBridgeWei 부분에서 설명!
    //변수이름.isEmpty앞에 !를 붙이는 것은 그값이 false이면을 나타내는 것!
    // 즉 아래의 !bridge.isEmpty 의 뜻은, bridge.isEmpty == false 의 의미와 같다!
    while !bridge.isEmpty {
        sec += 1
        addedWei -= bridge.removeFirst()
        //위의 문법을 작성함으로서, 시간은 while문을 반복할 동안 1초씩 지나가게 되고, bridge 의 첫번째 요소를 지워주며, 현재 다리의 무게를 나타내는 addedWei 에 다리의 첫번째 요소의 값을 반복하여 빼준 값이 대입된다. 예를들어, 다리의 길이가 3이라면, 현재의 bridge 배열은 [0, 0, 0]로 된다. addedWei -= bridge.removeFirst() 을 해줌으로서, bridge 배열의 첫번째 요소 0을 지우고, 뒤에 트럭이 들어올 공간을 마련하게 된다. 또한, bridge 의 첫번째 요소를 지워줌과 동시에, 현재의 다리위에 달리고 있는 트럭의 무게 addedWei에 지워준 요소의 값을 계속해서 빼준 값이 대입되게 된다. 즉, 현재의 상태에서는 0이 대입되게 된다.
        if let firstTruck = truck.first {
            if firstTruck + addedWei <= weight {
                addedWei += truck.removeFirst()
                bridge.append(firstTruck)
            } else {
                bridge.append(0)
            }
        }
    }
    
    return sec
}

print(solution(2, 10, [7, 4, 5, 6]))
//위의 경우, 처음에 [0, 0]이라는 bridge배열이 만들어지고, sec = 1이 되고, addedWei = 0 - 0 = 0이 됨과 동시에, bridge의 배열에서의 첫번째 요소를 지워주는 작업을 함으로서 if let문이 시작된다. 즉, 이 단계에서는 bridge의 배열은 [0]하나만 갖게 된다. if let 문의 특성상, 다리는 건너려고 하는 트럭들의 배열, truck에 요소가 존재할때만, if let 문이 시작되게 된다. 먼저, truck.first의 값이 7로서 존재하므로, if let문의 이하의 문법이 시작됨. if let문안의 if는 지나가려고 하는 트럭의 무게와 다리위에 추가된 무게addedWei의 덧셈값이 다리가 버틸 수 있는 무게를 나타내는 weight보다 작을 시에만 실행되게 된다. 현재의 경우, 7 + 0 <= 10이므로 addedWei에 다리를 지나가려고 하는 첫번째 트럭의 무게를 더해주는 작업을 한다. 그리고, bridge라는 배열의 마지막에 다리를 지나가려고 하는 첫번째 트럭의 무게를 더해준다. 여기서 이 작업의 뜻은, 현재 다리 위에 무게7의 트럭이 존재한다는 것을 의미한다. 여기까지의 단계를 체크해보면, bridge 라는 배열에는 [0, 7]이 존재하고, addedWei는 7, truck의 배열에는 7이 없어진 [4, 5, 6]이 존재하게 된다.if let문이 끝나게 되고, 다시 while문의 첫 번째 문장으로 올라간다. 아래부터는, 단계별로의 상황을 나타내고자 한다.
// 반복(1)번째
//  while문: sec: 0 + 1 = 1   bridge: [0, 0]  >> [0]    addedWei: 0 - 0 = 0
//     if let문:    bridge: [0] >> [0, 7]     addedWei = 0 + 7 = 7    truck:[7,4,5,6] >> [4,5,6]
// 반복(2)번째
//  while문: sec: 1 + 1 = 2   bridge: [0, 7]  >> [7]    addedWei: 7 - 0 = 7
//     if let문:    7 + 4 <= 10이 거짓이므로 else문이 진행 >> bridge: [7] >> [7, 0]
// 반복(3)번째
//  while문: sec: 2 + 1 = 3   bridge: [7, 0]  >> [0]    addedWei: 7 - 7 = 0
//     if let문:    4 + 0 <= 10이 참이므로 if문이 진행
//                 addedWei: 0 + 4 = 4   truck:[4,5,6] >> [5, 6]  bridge: [0, 4]
// 반복(4)번째
//  while문: sec: 3 + 1 = 4   bridge: [0, 4]  >> [4]    addedWei: 4 - 0 = 4
//     if let문:    4 + 5 <= 10이 참이므로 if문이 진행
//                 addedWei: 4 + 5 = 9   truck:[5,6] >> [6]       bridge: [4, 5]
// 반복(5)번째
//  while문: sec: 4 + 1 = 5   bridge: [4, 5]  >> [5]    addedWei: 9 - 4 = 5
//     if let문:    6 + 5 <= 10이 거짓이므로 else문이 진행 >> bridge: [5] >> [5, 0]
// 반복(6)번째
//  while문: sec: 5 + 1 = 6   bridge: [5, 0]  >> [0]    addedWei: 5 - 5 = 0
//     if let문:    0 + 6 <= 10이 참이므로 if문이 진행
//                 addedWei: 0 + 6 = 6   truck:[6] >> []          bridge: [0, 6]
// 반복(7)번째
//  while문: sec: 6 + 1 = 7   bridge: [0, 6]  >> [6]    addedWei: 6 - 0 = 6
//     더 이상 truck안의 요소가 없으므로 if let문 진행 불가
// 반복(8)번째
//  while문: sec: 7 + 1 = 8   bridge: [6] >> []         addedWei: 6 - 6 = 0
//     더 이상 truck안의 요소가 없으므로 if let문 진행 불가
// 반복(9)번째
//  bridge안의 요소가 없음(빈 배열)이 되었으모로 while문 진행 불가! >> 그대로 함수가 sec: 8을 리턴하고 종료됨

// 이하는, 알고리즘의 이해를 돕기위해 진행한 알고리즘 연습(개인공부용)
var a = [1, 3, 5, 7]
var b: [Int] = []
var i = 0
i = a.remove(at: 1)
//여기서의 i는 a라는 배열에서 지운 위치의 값이 대입되게 된다.
//즉, 예를 들어, a라는 배열에서 3을 지웠으면, i = 3이 되게되며, 또한 a라는 배열에서 7을 지웠으면 i = 7이 된다.
print(a)
print(i)
b.append(0)
print(b)

//Day 9
//Programmers High Score Kit - Heap _ディスクコントローラー (Swift)
//프로그래머스 고득점 Kit - 힙 _ 디스크 컨트롤러 (Swift)

func solution(_ jobs:[[Int]]) -> Int {
    var time = 0    // 현재 시각을 나타내는 변수
    var sum = 0     // 요청으로부터 종료시간의 평균 시간
    var sortedJobs = jobs.sorted(by: {$0[1] == $1[1] ? $0[0] < $1[0] : $0[1] < $1[1]})
    // 입력해준 배열을 [[시작시간(작업을 요청한 시간), 그것의 수행시간]]로 설정한다. while문을 반복하기에 앞서, 미리 배열을 정렬해두면 더욱 효율적이고 짧게 코드를 작성할 수 있기에, 위처럼 미리 입력해준 배열을 정렬해준다.
    // 가장 짧게 평균을 형성하려면 기본적으로 소요시간이 작은 것들이 먼저 오도록 정렬해주어야 한다. 하지만 이 문제에서 작업이 수행되고 있지 않을 때는 먼저 요청이 들어온 작업부터 실행해야 한다. 고로 작업이 수행되지 않을 때는 요청시간이 가장 적은 것을 작업이 수행되고 있을 때는 소요시간이 작은 것을 실행해주어야 한다. 위와 같이 정렬해주려면 먼저 소요시간을 기준으로 먼저 정렬해주고 그 정렬해준 것을 기반으로 요청시간으로 다시 정렬해주어야 한다.
    // sortedJobs설명 : 입력해준 각 작업의 수행시간이 같다면, 시작시간이 빠른 것을 미리 앞으로 정렬(오름차순)해 준다. 그 이유는, 예를 들어, [0, 3], [4, 6], [5, 6]가 있다면, 가장먼저 시작시간이 빠른 [0, 3]이 실행되는데, 이 작업이 끝나는 시간은 3초가 된다. 이 때, [4, 6] 와 [5, 6] 둘다 시작가능한 상태가 아니기 때문에 시간은 1초 흐르게 알고리즘을 작성한다.(아래의 if문에서 작성완료) 1초가 흐른 후의 현재시간이 4초일 때에, 비로소 [4, 6]이 실행가능한 상태가 된다.
    // 이 때, [5, 6]이 먼저 실행되려면 [0, 3]이 끝나고 2초가 지난 뒤의 현재 시간이 5초가 지난 후부터 실행가능하므로, [4, 6]과 [5, 6]이 둘 다 수행시간이 같다고 해도 먼저 시작시간이 빠른 것부터 실행하는 것이 평균시간을 단축시킬 수 있다. 아래의 코멘트에서 예를 들어보도록 한다.
    // [0, 3]이 끝난 후 [5, 6]부터 시작하게 되는 경우:  [0, 3]이 지나고 2초가 지난 5초부터 [5, 6]이 실행가능하게 되며 [5, 6]의 종료시간은 11초가 되지만, 5초부터 대기하였으므로 요청에서 종료까지 6초가 걸린다. 그 이후 [4, 6]이 실행되면, [4, 6]의 종료시간은 17초가 되지만, 4초부터 대기하였으므로, 요청부터 종료까지 걸린 시간은 13초가 된다. 이 경우에 요청부터 종료까지 걸린 시간의 평균은 (3 + 6 + 13) / 3(작업의 수) = 22/3이 됨.
    // 반대로, [0, 3]이 끝나고 [4, 6]부터 시작하게 되는 경우:  [0, 3]이 지나고 1초가 지난 4초부터 [4, 6]이 실행가능하게 되므로, [4, 6]의 종료시간은 10초가 되고, [4, 6]은 4초에서부터 대기하였으므로 요청에서부터 종료까지 걸린시간은 6초가 된다. 그 이후로 [5, 6]를 실행해주면, 종료시간은 16초로 앞에서 실행한 것보다 시간이 단축됨을 알 수 있다. 또한, [5, 6]이 요청에서부터 종료까지 걸린 시간은 11초가 된다. 이 경우, 요청부터 종료까지 걸린 시간의 평균은 (3 + 6 + 11) / 3 = 20/3으로 평균시간이 훨씬 단축됨을 알 수 있다.
    
    while !sortedJobs.isEmpty {
        for i in 0..<sortedJobs.count {
            let startTime = sortedJobs[i][0]     // 작업을 요청한 시간
            let processTime = sortedJobs[i][1]   // 수행시간
            
            if startTime <= time {   // 작업을 요청한 시간이 현재시간보다 작을 경우에만 실행(위의 코멘트에서 설명함)
                time += processTime   //현재시간에 수행시간을 더함(해당작업을 실행하는 동안 다른 작업 동시에 작업X)
                sum += (time - startTime) //요청시간은 현재시간 - 요청시간을 반복적으로 더해 준 값
                sortedJobs.remove(at: i)
                // 여기서 removeFirst가 아닌 remove(at:)을 사용한 이유는 시간복잡도가 적기 때문이다.
                //while문에서 sortedJobs가 빈 배열이 아닐 경우에만 반복해준다고 하였으므로 배열에서 요소를 계속적으로 지워줘야만 while문이 종료될 수 있다.
                break //break로 for문을 탈출 >> for문의 인덱스가 0인 상태로 반복믄 시작 (removeFirst에서 지워줬으므로)
            }
            
            if i == sortedJobs.count - 1 {
                time += 1
            }
        }
    }



    return sum / jobs.count
}

print(solution([[0, 3], [1, 9], [2, 6]]))

//이하는 sorted함수의 이해를 위한 알고리즘 공부
let arrayKyu: [[Int]] = [[0, 1], [2, 5], [5, 7], [3, 5], [2, 4]]
print(arrayKyu.count)
var sortedArray = arrayKyu.sorted(by: {$0[0] < $1[0]})
print(sortedArray) //[[0, 1], [2, 5], [2, 4], [3, 2], [5, 7]]출력됨

var sortedArray2 = arrayKyu.sorted(by: {$0[1] < $1[1]})
print(sortedArray2) //[[0, 1], [3, 2], [2, 4], [2, 5], [5, 7]]출력됨

var sortedArray3 = arrayKyu.sorted(by: {$0[1] == $1[1] ? $0[0] < $1[0] : $0[1] < $1[1]})
print(sortedArray3) //[[0, 1], [2, 4], [2, 5], [3, 2], [5, 7]] 출력됨
//위의 sortedArray3 설명: $0 과 $1을 비교함으로서 요소마다 돌면서 정렬을 해주게 되는데, $0은 비교하려고 하는 요소, $1은 비교대상의 요소를 뜻함. 여기서 $0[0]을 써준 이유는 애초에, 위에서 arrayKyu라는 배열이 2중배열이기 때문에, $0[0]은 요소의 2중배열안의 첫번째 것을 뜻함. 예를 들면, [[0, 1], [3, 7]]이면 $0[0]은 0, $1[0]은 3, $0[1]은 1, $1[1]은 7이 된다. 여기서의 물음표는 if문과 같은 의미를 갖는다.
// 추가적으로 설명하자면, (A) == (B) ? C : D 가 있다고 치면, A가 B와 같다면 왼쪽의 C를 실행, 아니라면 오른쪽의 D를 실행한다. 여기서는 sorted함수를 적었으므로, 배열의 각 요소들을 돌면서 정렬해주는 이른바 반복문과 같은 알고리즘인 셈이다.
// 추가적으로, <는 오름차순 정렬(ex):  0 >>> 3 >>>>> 7 >>> 10) >는 내림차순 정렬 (ex: 10 >>> 7 >>> 3 >> 0)

//Day 10
//Programmers High Score Kit - Heap _二重優先順位キュー (Swift)
//프로그래머스 고득점 Kit - 힙 _ 이중우선순위큐 (Swift)

//코딩에 앞서, 간단한 문법 정리 split과 components

let s = "Hello I'm Kyusok, Nice to meet you!"
var result1 = s.split(separator: " ")
print(result1)

result1 = s.split { $0 == " "}  // 후행클로저 형식의 split
print(result1)

result1 = s.split { $0 == "s"}  //" "사이에 s를 집어넣으면 s를 기준으로 쪼개게 된다.
print(result1)

result1 = s.split { $0 == "S"} //S가 없으므로 쪼개는 작업을 하지 않음. 위에서 써놓은 문장 그대로가 나옴
print(result1)

let v = "Hello I'm Kyusok, Nice to meet you!"
var result2 = s.components(separatedBy: " ")

print(result2)

// 아래는, 프로그래머스 고득점 Kit - 힙 _ 이중우선순위큐(Swift)의 풀이
// 以下は、Programmers 高得点 Kit _ ヒープ _ 二重優先順位キューのswiftの解き方である。
func solution(_ operations:[String]) -> [Int] {
    var queue: [Int] = []
    let operatingQueue = operations.map {$0.components(separatedBy:" ")}
    
    for operating in operatingQueue {
        let operWord = operating[0]
        let operNum = Int(operating[1])! //여기 조금 잘 이해가 안됨. 다시 구글링 해보면서 익혀야 댈듯함.
        
        switch operWord {
        
        case "I":
            queue.append(operNum)
        case "D":
            if !queue.isEmpty {
                if operNum == 1 {
                    queue.sort {$0 > $1}
                } else {
                    queue.sort {$0 < $1}
                }
                queue.removeFirst()
            }
        default:
            break
        }
    }
    
    return queue == [] ? [0, 0] : [queue.max()! , queue.min()!]
}

print(solution(["I 16", "D 1"]))  //[0, 0]이 출력되어야 정상
print(solution(["I 7", "I 5", "I -5", "D -1"]))  //[7, 5]가 출력되어야 정상

let str: String = "Lee Kyusok in Tokyo"
let arr: [String] = str.components(separatedBy: " ")
 
print(arr)    // ["Lee", "Kyusok", "in", "Tokyo"]
print(arr[0]) // Lee
print(arr[1]) // Kyusok
print(arr[2]) // in
print(arr[3]) // Tokyo
//위의 문법 설명: 배열로 된것이 아닌 그냥 문자열의 타입String 을 상수로서 입력해주었을 떄, arr은 그 string 타입의 입력해준 문자열을 스페이스를 단위로 끊어주고 입력해준 순서대로 배열의 요소로서 가지게 된다. 즉, arr[0]은 Lee, arr[1]은 Kyusok.....

var arr2 = arr.map {$0.components}
print(arr2)
//위의 문법 설명: 반면, mapping을 해줄때, 그냥 components로 맵핑을 해주게 되면, 배열안에 (function), (function)...이 요소수 만큼 대입되게 됨. 즉, 원하는대로의 알고리즘 설계가 안되었음.

var arrayExample = ["Lee", "Kyusok", "in", "Japan", "LineDeveloper", "目指せ"]

var arrayMapping = arrayExample.map {$0}
print(arrayMapping)  //map은 그것을 배열로 나타내주는데, 이 때 괄호안에 $0만 붙이면, 배열 값 그대로의 것이 출력된다.
//["Lee", "Kyusok", "in", "Japan", "LineDeveloper", "目指せ"]가 출력됨.

//var arrayMapping2 = arrayExample.components(separatedBy:" ")
//print(arrayMapping2)
// 위의 문법이 Error 가 발생하는 이유: [String]에는 components라는 멤버가 없다. 즉 이 문법은 에러가 발생하게 됨.

var arrayMapping3 = arrayExample.map {$0.components(separatedBy:" ")}
print(arrayMapping3)
// 이렇게되면, 배열안의 배열을 갖는 이중배열이 형성되게 된다.
// [["Lee"], ["Kyusok"], ["in"], ["Japan"], ["LineDeveloper"], ["目指せ"]]가 출력됨

let arrayExample2 = ["I 7", "I 5", "I -5", "D -1"]
var arrayMapping4 = arrayExample2.map {$0.components(separatedBy:" ")}
print(arrayMapping4)

//Day 11
//Programmers High Score Kit - sort _k番目の数 (Swift)
//프로그래머스 고득점 Kit - 정령 _ k번째수 (Swift)

// 問題説明：
//  配列arrayのi番目の数字からj番目の数字まで切って整列したとき、k番目にある数を求めたいと思います。 例えば、arrayが[1、5、2、6、3、7、4]、i = 2、j = 5、k = 3 なら、 arrayの 2番目から 5番目まで切れば[5、2、6、3]です。 1から出た配列を並べ替えると、[2、3、5、6]です。 2から出た配列の3番目の数字は5です。
// 配列array,[i、j、k]を元素とする2次元配列commandsが媒介変数として与えられるとき、commandsのすべての元素に対して先に説明した演算を適用したときに出た結果を配列に入れてreturnするようsolution関数を作成してください。

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer: [Int] = []
    
    for command in commands {
        let i = command[0] - 1
        let j = command[1] - 1
        let k = command[2] - 1
        
        let number = Array(array[i...j]).sorted()[k]
        answer.append(number)
    }
    
    return answer
}

print(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]))

