package com.flour.web.service;

import com.flour.web.domain.ChatMessage;

import java.util.List;

public interface ChatMessageService {
    public ChatMessage newMessage(ChatMessage chatMessage);

    public long countNewMessages(String senderId, String recipientId);
    public String lastMessages(String senderId, String recipientId);
    public List<ChatMessage> findChatMessages(String senderId, String recipientId);
}
