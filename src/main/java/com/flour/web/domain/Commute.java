package com.flour.web.domain;

import lombok.*;

import java.time.LocalDateTime;
import java.util.Date;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Commute {
    private String userIdennum;
    private String userName;
    private Date checkDate;
    private LocalDateTime checkInTime;
    private LocalDateTime checkOutTime;
    private CommuteStatus status;
}
