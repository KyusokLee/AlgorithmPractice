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
