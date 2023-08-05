package com.flour.web.mapper;


import com.flour.web.domain.Introduce;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IntroduceMapper {
    Introduce editIntroduce(String var1) throws Exception;

    Introduce updateIntroduce(Introduce var1) throws Exception;

    List<Introduce> listAll() throws Exception;
}
