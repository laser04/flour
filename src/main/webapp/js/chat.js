let employees = {};
let chat = {};

//websocket 접속 선언
const connect = () => {
    const sockJS = new SockJS("http://localhost:8080/ws");
    stompClient = Stomp.over(sockJS);
    stompClient.connect({}, onConnected, onError);

}
//서버로 부터 받아온 json자료 처리 함수
const onMessageReceived = (msg) => {
    const notification = JSON.parse(msg.body);
    const msgSenderId = notification.senderId;
    const newMessageDBURL = "/messages/" + notification.id; // 최근 메시지 json
    fetch(newMessageDBURL)
        .then((response) => {
            if (!response.ok) {
                throw new Error("API 호출에 문제가 발생했습니다.");
            }
            return response.json();
        })
        .then((message) => {
            // 새로운 메시지가 도착했을 때 알림을 표시
            showNotification(notification.senderName, message.content);
            console.log("Received a new message from " + notification.senderName);
            //현재 활성화된 채팅창의 receiveid와 수신받은 메시지의 senderid가 같으면 현재 채팅창에 출력
            if (chat.currentId === notification.senderId) {
                receiverNewMessage(message.content);
            }

            //어떤 대화를 했는지 미리보기
            const preview = document.getElementById('preview_' + msgSenderId);
            preview.innerText = message.content;
            // const time = document.getElementById('time_'+ receivedId);
            // time.innerText = message.timestamp;
        })
        .catch((error) => {
            console.error("메시지를 수신 할 수 없음:", error);
        });
    //읽지 않은 메시지 카운트
    const newCountURL = "/messages/" + currentUserId + "/" + msgSenderId + "/count";
    fetch(newCountURL)
        .then((response) => {
            if (!response.ok) {
                throw new Error("API 호출에 문제가 발생했습니다.");
            }
            return response.json();
        })
        .then((value) =>{
            console.log(value+"아니 이거 안돼?")
            let countSpan = document.getElementById('count_' + msgSenderId);
            countSpan.innerHTML = value;
        })
        .catch(error => {
            console.error(error)
        });
}
//웹소켓에 현재 접속자 id를 등록
const onConnected = () => {
    console.log("connected");
    stompClient.subscribe(
        "/user/" + currentUserId + "/queue/messages",
        onMessageReceived
    );
};
const onError = (err) => {
    console.log(err);
};
connect()

//모든 유저를 서버에서 불러옴과 동시에 함수 선언 및 호출
fetch("/allUsers")
    .then((response) => {
        if (!response.ok) {
            throw new Error("API 호출에 문제가 발생했습니다.");
        }
        return response.json();
    })
    .then((users) => {
        const peopleList = document.querySelector(".people");

        // JavaScript forEach를 사용하여 데이터를 동적으로 생성
        users.forEach((user) => {
            const listItem = document.createElement('li');
            listItem.className = 'person';
            listItem.dataset.chat = user.userIdennum;

            const img = document.createElement('img');
            img.src = user.userPhoto;
            img.alt = '사원 사진';
            img.className = 'receiverPhoto';

            const memberInfo = document.createElement('div');
            memberInfo.className = 'member-info';

            const memberName = document.createElement('span');
            memberName.className = 'member-name';
            memberName.textContent = user.userName;

            const separator = document.createElement('span');
            separator.textContent = ' / ';

            const memberDepartment = document.createElement('span');
            memberDepartment.className = 'member-department';
            memberDepartment.textContent = user.departmentName;

            const countMsg = document.createElement('span');
            countMsg.className = 'countMsg';
            countMsg.id = "count_" + user.userIdennum;
            countMsg.setAttribute('iden', user.userIdennum);
            countMsg.style.fontSize = '12px';

            const time = document.createElement('span');
            time.className = 'time';
            time.id = "time_" + user.userIdennum;

            const preview = document.createElement('span');
            preview.className = 'preview';
            preview.id = "preview_" + user.userIdennum;
            preview.setAttribute('iden', user.userIdennum);

            memberInfo.appendChild(memberName);
            memberInfo.appendChild(separator);
            memberInfo.appendChild(memberDepartment);
            memberInfo.appendChild(countMsg);
            memberInfo.appendChild(time);
            memberInfo.appendChild(preview);

            listItem.appendChild(img);
            listItem.appendChild(memberInfo);

            peopleList.appendChild(listItem);
        });
        const chatWindow = document.querySelector('.chat');

        employees = {
                list: document.querySelector('ul.people'),
                all: document.querySelectorAll('.left .person'),
                name: '',
                previewAll: document.querySelectorAll('.left .person .preview'),
                countAll: document.querySelectorAll('.left .person .countMsg')
            }

            chat = {
                container: document.querySelector('.contactsList .right'),
                current: null,
                receiverId: null,
                name: document.querySelector('.contactsList .right .top .name'),
                currentId: null,
                currentName: null
            };
        employees.previewAll.forEach(f => {
            fetch("/messages/" + currentUserId + "/" + f.getAttribute("iden").toString())
                .then((response) => {
                    if (!response.ok) {
                        throw new Error("API 호출에 문제가 발생했습니다.");
                    }
                    return response.json();
                })
                .then((messages) => {
                    messages.forEach((message) => {
                        f.innerHTML = message.content
                    });
                });
        });
        employees.countAll.forEach(f => {
            fetch("/messages/" + f.getAttribute("iden") + "/" + currentUserId + "/count")
                .then((response) => {
                    if (!response.ok) {
                        throw new Error("API 호출에 문제가 발생했습니다.");
                    }
                    return response.json();
                })
                .then((value) => {
                    let countSpan = document.getElementById('count_' + f.getAttribute("iden").toString());
                    countSpan.innerHTML = value;
                })
        })

        employees.all.forEach(f => {
            f.addEventListener('mousedown', () => {
                console.log("됨?")
                setActiveChat(f);
            });
        });
        function setActiveChat(f) {
            if (employees.list.querySelector('.active')) {
                employees.list.querySelector('.active').classList.remove('active');
            }
            f.classList.add('active');
            employees.name = f.querySelector('.member-name').innerText;
            chat.name.innerHTML = employees.name;
            chat.receiverId = f.getAttribute('data-chat')
            chat.container.querySelector('.chat').classList.add('active-chat')
            chat.container.querySelector('.chat').setAttribute("recipientId", chat.receiverId);
            chat.container.querySelector('.chat').setAttribute("recipientName", employees.name);
            chat.currentId = chat.container.querySelector('.active-chat').getAttribute("recipientId");
            chat.currentName = chat.container.querySelector('.active-chat').getAttribute("recipientName");
            const apiURL = "/messages/" + currentUserId + "/" + chat.receiverId;

            updateChat(apiURL);
        }
        function updateChat(apiURL) {
            chatWindow.innerHTML = '';
            fetch(apiURL)
                .then((response) => {
                    if (!response.ok) {
                        throw new Error("API 호출에 문제가 발생했습니다.");
                    }
                    return response.json();
                })
                .then((messages) => {
                    messages.forEach((message) => {
                        const isSender = message.senderId.toString() === currentUserId.toString();
                        const messageClass = isSender ? "me" : "you";
                        const formattedTimestamp = new Date(message.timestamp).toLocaleString(
                            "ko-KR",
                            {dateStyle: "short", timeStyle: "short"}
                        );

                        const messageDiv = document.createElement("div");
                        const timestampDiv = document.createElement("div");

                        messageDiv.classList.add("bubble");
                        messageDiv.classList.add(messageClass);
                        messageDiv.innerHTML = message.content;
                        timestampDiv.classList.add("timestamp");

                        timestampDiv.innerHTML = formattedTimestamp;
                        chatWindow.appendChild(messageDiv);
                    });

                })
                .catch((error) => {
                    console.error(error);
                });

        }
        document.querySelector(".sendText").addEventListener("keyup", (event) => {
            if (event.key === "Enter") {
                sendMessage();
            }
        });

        function sendMessage() {
            const msgElement = document.querySelector('.sendText');
            const msg = msgElement.value;
            if (msg.trim() !== "") {
                const message = {
                    senderId: currentUserId,
                    recipientId: chat.currentId,
                    senderName: currentUserName,
                    recipientName: chat.currentName,
                    content: msg,
                    timestamp: new Date()
                };
                stompClient.send("/app/chat", {}, JSON.stringify(message));
                //test(msg)
                senderNewMessage(msg); // 채팅창에 메시지를 표시
                const preview = document.getElementById('preview_' + chat.currentId);
                preview.innerHTML = msg;
                msgElement.value = '';
            }
        }
    })

function senderNewMessage(message) {
    const formattedTimestamp = new Date(message.timestamp).toLocaleString(
        "ko-KR",
        {dateStyle: "short", timeStyle: "short"}
    );
    const messageDiv = document.createElement("div");
    const timestampDiv = document.createElement("div");


    messageDiv.classList.add("bubble");
    messageDiv.classList.add("me");
    messageDiv.innerHTML = message;
    timestampDiv.classList.add("timestamp");

    timestampDiv.innerHTML = formattedTimestamp;
    document.querySelector('.chat').appendChild(messageDiv);
}

function receiverNewMessage(message) {
    const formattedTimestamp = new Date(message.timestamp).toLocaleString(
        "ko-KR",
        {dateStyle: "short", timeStyle: "short"}
    );
    const messageDiv = document.createElement("div");
    const timestampDiv = document.createElement("div");

    messageDiv.classList.add("bubble");
    messageDiv.classList.add("you");
    messageDiv.innerHTML = message;
    timestampDiv.classList.add("timestamp");

    timestampDiv.innerHTML = formattedTimestamp;
    document.querySelector('.chat').appendChild(messageDiv);
}

function showNotification(senderName, content) {
    // 알림 생성
    if ("Notification" in window) {
        if (Notification.permission === "granted") {
            // 알림 생성
            const options = {
                body: content,
                icon: "/img/common/onlylogo.png", // 알림에 표시할 아이콘 이미지 경로
            };
            new Notification(senderName, options);
        } else if (Notification.permission !== "denied") {
            // 사용자에게 알림 권한을 요청
            Notification.requestPermission().then((permission) => {
                if (permission === "granted") {
                    // 알림 생성
                    const options = {
                        body: content,
                        icon: "/img/common/onlylogo.png", // 알림에 표시할 아이콘 이미지 경로
                    };
                    new Notification(senderName, options);
                }
            });
        }
    }
}