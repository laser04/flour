package com.flour.web.mapper;


import com.flour.web.domain.ChatMessage;
import com.flour.web.domain.MessageStatus;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ChatMessageMapper {
    void save(ChatMessage chatMessage);
    long countBySenderIdAndRecipientIdAndStatus(String senderId, String recipientId, MessageStatus statusMessage);
    List<ChatMessage> findByChatId(String chatId);
    ChatMessage findById(String id);
    void updateStatuses(String senderId, String recipientId, MessageStatus statusMessage);
    String findLastMessage(String senderId, String recipientId);
}
