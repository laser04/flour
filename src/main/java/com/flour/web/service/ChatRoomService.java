package com.flour.web.service;

import com.flour.web.domain.ChatRoom;
import com.flour.web.mapper.ChatRoomMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.UUID;

@Service
public class ChatRoomService {

    @Autowired
    private ChatRoomMapper chatRoomRepository;

    public Optional<String> getChatId(String senderId, String recipientId, boolean createIfNotExist) {
        Optional<ChatRoom> chatRoomOptional = chatRoomRepository.findBySenderIdAndRecipientId(senderId, recipientId);

        if (chatRoomOptional.isPresent()) {
            return Optional.of(chatRoomOptional.get().getChatId());
        } else {
            if (!createIfNotExist) {
                return Optional.empty();
            }

            String chatId = String.format("%s_%s", senderId, recipientId);
            String id = UUID.randomUUID().toString();
            String id2 = UUID.randomUUID().toString();
            ChatRoom senderRecipient = ChatRoom.builder()
                    .id(id)
                    .chatId(chatId)
                    .senderId(senderId)
                    .recipientId(recipientId)
                    .build();

            ChatRoom recipientSender = ChatRoom.builder()
                    .id(id2)
                    .chatId(chatId)
                    .senderId(recipientId)
                    .recipientId(senderId)
                    .build();

            chatRoomRepository.save(senderRecipient);
            chatRoomRepository.save(recipientSender);

            return Optional.of(chatId);
        }
    }
}
