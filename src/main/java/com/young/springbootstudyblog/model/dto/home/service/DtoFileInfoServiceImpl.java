package com.young.springbootstudyblog.model.dto.home.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.young.springbootstudyblog.model.dto.home.domain.DtoFileInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * Date : 2022-05-09
 * Author : zilet
 * Project : sarangbang
 * Description :
 */
@RequiredArgsConstructor
@Service
public class DtoFileInfoServiceImpl implements DtoFileInfoService{

    private final ObjectMapper objectMapper;

    @Override
    public DtoFileInfo get() {
        DtoFileInfo dtoFileInfo = new DtoFileInfo();

        dtoFileInfo.setFileInfoSeq(1);
        dtoFileInfo.setDescription("샘플파일 1");
        dtoFileInfo.setFileName("sample1.xlsx");
        dtoFileInfo.setRegDt(LocalDateTime.now());
        dtoFileInfo.setDelDt(null);
        dtoFileInfo.setDelYN(Boolean.FALSE);

        return dtoFileInfo;
    }

    @Override
    public List<DtoFileInfo> gets() {
        return null;
    }

    @Override
    public DtoFileInfo add(DtoFileInfo dtoFileInfo) throws Exception {
        return null;
    }

    @Override
    public List<DtoFileInfo> adds(List<DtoFileInfo> dtoFileInfos) throws Exception {
        return null;
    }

    @Override
    public boolean modify(Integer fileInfoSeq, boolean delYN) {
        return false;
    }

}
