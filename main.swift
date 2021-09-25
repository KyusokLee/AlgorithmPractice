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
