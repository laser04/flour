package com.flour.web.service;


import com.flour.web.domain.Introduce;

import java.util.List;

public interface IntroduceService {
    Introduce getEdit(String var1) throws Exception;

    Introduce updateIntroduce(Introduce var1) throws Exception;

    List<Introduce> listAll() throws Exception;
}