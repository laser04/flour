package com.flour.web.service;


import com.flour.web.domain.Commute;
import com.flour.web.domain.CommuteStatus;
import com.flour.web.mapper.CommuteMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@Component
@RequiredArgsConstructor
public class CommuteServiceImpl implements CommuteService{

    private final CommuteMapper commuteMapper;

    public boolean checkWorkOn(String idennum){
        return commuteMapper.checkUserWorkStatus(idennum);
    }
    public boolean checkWorkOff(String idennum){
        return commuteMapper.checkUserWorkOut(idennum, CommuteStatus.WORKOFF);
    }
    @Override
    public List<Commute> commuteCheck(String idennum) {
        return commuteMapper.commuteListAll(idennum);
    }

    @Override
    public boolean workOn(String idennum) {
        boolean checkResult = checkWorkOn(idennum);
        if (!checkResult) {
            inputWorkOn(idennum);
            return true;
        } else {
            return false;
        }
    }
    public void inputWorkOn(String idennum){
        Commute commute = new Commute();
        commute.setUserIdennum(idennum);
        commute.setStatus(CommuteStatus.WORKON);
        commuteMapper.inputUserCheckIn(commute);
    }
    @Override
    public boolean workOff(String idennum) {
        boolean checkResult = commuteMapper.checkUserWorkOut(idennum, CommuteStatus.WORKOFF);
        if(!checkResult){
            inputWorkOff(idennum);
            return true;
        }else{
            return false;
        }
    }
    public void inputWorkOff(String idennum){
        Commute commute = new Commute();
        commute.setUserIdennum(idennum);
        commute.setStatus(CommuteStatus.WORKOFF);
        commuteMapper.inputUserCheckOff(commute);
    }
}
