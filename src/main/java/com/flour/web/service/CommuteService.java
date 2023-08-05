package com.flour.web.service;

import com.flour.web.domain.Commute;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CommuteService {

    boolean workOn(String idennum);
    boolean workOff(String idennum);
    boolean checkWorkOn(String idennum);
    List<Commute> commuteCheck(String idennum);
}
