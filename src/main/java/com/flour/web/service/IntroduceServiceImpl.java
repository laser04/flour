package com.flour.web.service;

import com.flour.web.domain.Introduce;
import com.flour.web.mapper.IntroduceMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@Component
@RequiredArgsConstructor
public class IntroduceServiceImpl implements IntroduceService {
    @Autowired
    private IntroduceMapper introduceMapper;

    public Introduce getEdit(String id) throws Exception {
        return introduceMapper.editIntroduce(id);

    }

    public Introduce updateIntroduce(Introduce dto) throws Exception {
        return introduceMapper.updateIntroduce(dto);
    }

    public List<Introduce> listAll() throws Exception {
        return introduceMapper.listAll();
    }
}
