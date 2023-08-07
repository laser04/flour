package com.flour.web.service;

import com.flour.web.domain.ChatMessage;
import com.flour.web.domain.MessageStatus;
import com.flour.web.exception.ResourceNotFoundException;
import com.flour.web.mapper.ChatMessageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class ChatMessageServiceImpl {
    @Autowired private ChatMessageMapper chatMessageMapper;
    @Autowired private ChatRoomService chatRoomService;

    public ChatMessage newMessage(ChatMessage chatMessage) {
        chatMessage.setId(generateRandomMessageId());
        chatMessage.setStatusMessage(MessageStatus.RECEIVED);
        chatMessageMapper.save(chatMessage);
        return chatMessage;
    }
    public String generateRandomMessageId(){
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");
        String dateString = now.format(formatter);

        String randomString = UUID.randomUUID().toString().substring(0, 5);

        return dateString + "-" + randomString;
    }
    public long countNewMessages(String senderId, String recipientId) {
        return chatMessageMapper.countBySenderIdAndRecipientIdAndStatus(
                senderId, recipientId, MessageStatus.RECEIVED);
    }
    public List<ChatMessage> findChatMessages(String senderId, String recipientId) {
        var chatId = chatRoomService.getChatId(senderId, recipientId, false);
        var messages =
                chatId.map(cId -> chatMessageMapper.findByChatId(cId)).orElse(new ArrayList<>());
        System.out.println(messages);

        if(!messages.isEmpty()) {
            updateStatuses(senderId, recipientId, MessageStatus.DELIVERED);
        }

        return messages;
    }

    public ChatMessage findById(String id) {
        ChatMessage chatMessage = chatMessageMapper.findById(id);
        System.out.println(chatMessage);
        if (chatMessage != null) {
            chatMessage.setStatusMessage(MessageStatus.DELIVERED);
            chatMessageMapper.updateStatuses(chatMessage.getSenderId(), chatMessage.getRecipientId(), MessageStatus.DELIVERED);
            return chatMessage;
        } else {
            throw new ResourceNotFoundException("can't find message (" + id + ")");
        }
    }

    public void updateStatuses(String senderId, String recipientId, MessageStatus status) {
        chatMessageMapper.updateStatuses(senderId, recipientId, status);
    }
}
