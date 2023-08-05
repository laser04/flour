package com.flour.web.domain;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class ChatRoom {
    private String id;
    private String chatId;
    private String senderId;
    private String recipientId;
}
