package com.flour.web.mapper;

import com.flour.web.domain.Commute;
import com.flour.web.domain.CommuteStatus;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommuteMapper {

    boolean checkUserWorkStatus(String userIdennum);

    boolean checkUserWorkOut(String userIdennum, CommuteStatus status);
    void inputUserCheckIn(Commute commute);
    void inputUserCheckOff(Commute commute);

    List<Commute> commuteListAll(String userIdennum);
}
