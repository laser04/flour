<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/css/chat.css">
</head>
<body>
<div class="contacts">
    <div class="contactsList">
        <div class="left">
            <h2 style="text-align: center; margin-top: 10px; font-weight: bolder;">사원 목록</h2>
            <div class="top">
                <label>
                    <input type="radio" name="searchOption" class="nameFilterRadioButton" checked>
                    이름으로 검색
                </label>
                <label>
                    <input type="radio" name="searchOption" class="departmentFilterRadioButton">
                    부서로 검색
                </label>
                <input type="text" class="searchEmployee" placeholder="Search"/>
            </div>
            <ul class="people" style="list-style: none; margin-top: 30px;">
                <c:forEach var="user" items="${allUsers}">
                    <li class="person"
                        data-chat="${user.idennum}">
                        <img src="${user.photo}" alt="멤버 사진" class="receiverPhoto">
                        <div class="member-info">
                            <span class="member-name">${user.name}</span>
                            <span> / </span>
                            <span class="member-department">${user.department}</span>
                            <span class="countMsg" id="count_${user.idennum}" iden="${user.idennum}" style="font-size: 12px"></span>
                            <span class="time" id="time_${user.idennum}"></span>
                            <span class="preview" id="preview_${user.idennum}" iden="${user.idennum}"></span>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="right">
            <div class="top">
                <span><span class="name">대화 할 상대를 선택해 주세요.</span></span>
            </div>
            <div class="chat"></div>
            <div class="write">
                <a href="javascript:;" class="write-link attach"></a>
                <input class="sendText" type="text"/>
                <a href="javascript:emoji();" class="write-link smiley"></a>
                <a href="javascript:sendMessage();" id="sendButton" class="write-link send"></a>
            </div>
        </div>
    </div>
</div>
<script src="
/js/emoji-button-3.0.3.min.js
"></script>
<%@ include file="footer.jsp" %>
<script>
    function emoji() {
        const button = document.querySelector('.smiley');
        const picker = new EmojiButton();
            /*옵션입력*/

        picker.on('emoji', emoji => {
            document.querySelector('.sendText').value += emoji;
        });

        button.addEventListener('click', () => {
            picker.togglePicker(button);
        });
    }

</script>
<script>
    const chatWindow = document.querySelector('.chat')
    let employees = {
            list: document.querySelector('ul.people'),
            all: document.querySelectorAll('.left .person'),
            name: '',
            previewAll: document.querySelectorAll('.left .person .preview'),
            countAll: document.querySelectorAll('.left .person .countMsg')
        },

        chat = {
            container: document.querySelector('.contactsList .right'),
            current: null,
            receiverId: null,
            name: document.querySelector('.contactsList .right .top .name'),
            currentId : null,
            currentName : null
        };
    document.addEventListener('DOMContentLoaded', () => {
        console.log("쵸큼 위험할수도?")
        employees.previewAll.forEach(f => {
            console.log(f.getAttribute('iden') + "유남생?");
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
            console.log(f.getAttribute('iden')+"유남생생생");
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
    });

    employees.all.forEach(f => {
        f.addEventListener('mousedown', () => {
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
    function test(e){
        let space = document.querySelector('.chat');
        space.innerHTML = "<div class='bubble me'>"+
            e + "<h4 class='small pull-left'>방금</h4></div>" + space.innerHTML;
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
        console.log("시발")
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
            console.log(message.recipientId + "안되냐고 자식아");
            //test(msg)
             senderNewMessage(msg); // 채팅창에 메시지를 표시
            const preview = document.getElementById('preview_' + chat.currentId);
            preview.innerHTML = msg;
            msgElement.value = '';
        }
    }
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
        chatWindow.appendChild(messageDiv);
    }
    function receiverNewMessage(message){
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
        chatWindow.appendChild(messageDiv);
    }
    function filterList() {
        var value = $(".searchEmployee").val().toLowerCase();
        var searchByName = $(".nameFilterRadioButton").is(":checked");

        $(".people .person").filter(function () {
            var nameMatch = searchByName && $(this).find(".member-name").text().toLowerCase().indexOf(value) > -1;
            var departmentMatch = !searchByName && $(this).find(".member-department").text().toLowerCase().indexOf(value) > -1;
            $(this).toggle(nameMatch || departmentMatch);
        });
    }

    $(document).ready(function () {
        $(".searchEmployee").on("keyup", filterList);
        $(".nameFilterRadioButton, .departmentFilterRadioButton").on("change", filterList);
    });
</script>
</body>
</html>