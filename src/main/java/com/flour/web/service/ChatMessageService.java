package com.flour.web.service;

import com.flour.web.domain.ChatMessage;

import java.util.List;

public interface ChatMessageService {
    ChatMessage newMessage(ChatMessage chatMessage);

    long countNewMessages(String senderId, String recipientId);
    String lastMessages(String senderId, String recipientId);
    List<ChatMessage> findChatMessages(String senderId, String recipientId);
}
