package com.flour.web.controller;

import com.flour.web.domain.ChatMessage;
import com.flour.web.domain.ChatNotification;
import com.flour.web.service.ChatMessageServiceImpl;
import com.flour.web.service.ChatRoomService;
import com.flour.web.service.ChatRoomServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ChatController {

    @Autowired
    private SimpMessagingTemplate messagingTemplate;
    @Autowired
    private ChatMessageServiceImpl chatMessageService;
    @Autowired
    private ChatRoomService chatRoomService;

    //채팅 메시지 보내기(MessageMapping)
    @MessageMapping("/chat")
    public void processMessage(@Payload ChatMessage chatMessage) {
        //채팅방 식별자를 가져온다.
        var chatId = chatRoomService
                .getChatId(chatMessage.getSenderId(), chatMessage.getRecipientId(), true);
        //채팅방 식별자를 채팅 메시지에 설정한다.
        chatMessage.setChatId(chatId.get());

        //DB에 메시지를 저장하고, 상대방에게 메시지를 전송한다.
        ChatMessage saved = chatMessageService.newMessage(chatMessage);
        //상대방에게 메시지를 전송한다.
        messagingTemplate.convertAndSendToUser(
                chatMessage.getRecipientId(), "/queue/messages",
                new ChatNotification(
                        saved.getId(),
                        saved.getSenderId(),
                        saved.getRecipientName()));
    }

    //채팅방 생성
    @GetMapping("/messages/{senderId}/{recipientId}/count")
    public ResponseEntity<Long> countNewMessages(
            @PathVariable String senderId,
            @PathVariable String recipientId) {
        return ResponseEntity
                .ok(chatMessageService.countNewMessages(senderId, recipientId));
    }

    //채팅방 목록
    @GetMapping("/messages/{senderId}/{recipientId}")
    public ResponseEntity<?> findChatMessages(@PathVariable String senderId,
                                              @PathVariable String recipientId) {
        return ResponseEntity
                .ok(chatMessageService.findChatMessages(senderId, recipientId));
    }

    //채팅방 내용
    @GetMapping("/messages/{id}")
    public ResponseEntity<?> findMessage(@PathVariable String id) {
        System.out.println(chatMessageService.findById(id));
        return ResponseEntity
                .ok(chatMessageService.findById(id));
    }
}
