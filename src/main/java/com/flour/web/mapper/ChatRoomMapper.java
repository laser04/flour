package com.flour.web.mapper;

import com.flour.web.domain.ChatRoom;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Mapper
@Repository
public interface ChatRoomMapper {
    Optional<ChatRoom> findBySenderIdAndRecipientId(String senderId, String recipientId);
    void save(ChatRoom chatRoom);
}
