package com.flour.web.mapper;

import com.flour.web.domain.ChatMessage;
import com.flour.web.domain.ChatRoom;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Mapper
@Repository
public interface ChatRoomMapper {
    Optional<ChatRoom> findBySenderIdAndRecipientId(@Param("senderId") String senderId, @Param("recipientId") String recipientId);
    void save(ChatRoom chatRoom);
    void previewUpdate(ChatMessage chatMessage);
}
