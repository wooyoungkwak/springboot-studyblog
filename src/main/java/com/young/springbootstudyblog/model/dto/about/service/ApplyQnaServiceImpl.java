package com.young.springbootstudyblog.model.dto.about.service;

import com.google.common.collect.Maps;
import com.young.springbootstudyblog.model.dto.about.domain.ApplyQna;
import com.young.springbootstudyblog.model.dto.about.enums.CategoryType;
import com.young.springbootstudyblog.model.dto.home.enums.Sort;
import org.apache.commons.compress.utils.Lists;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Date : 2022-06-08
 * Author : zilet
 * Project : springboot-studyblog
 * Description :
 */
@Service
public class ApplyQnaServiceImpl implements ApplyQnaService{

    @Override
    public HashMap<String, Object> gets(CategoryType categoryType, Sort sort, String content, int pageNumber) {

        HashMap<String, Object> map = Maps.newHashMap();
        List<ApplyQna> applyQnas = Lists.newArrayList();

        int total = 100;                                // 전체 검색 수
        int bufferSize = 20;                            // 한개의 page 에서 볼 수 있는 테이블 항목 개수
        int offset = (pageNumber - 1) * bufferSize;     // 현재 page 항목의 첫번째 순번
        int maxSize = total - offset;                   // 현재 page 에서 볼 수 있는 테이블 항목 의 마지막 항목 순번

        if (maxSize > bufferSize) {
            maxSize = bufferSize + offset;
        } else {
            maxSize = total;
        }

        int totalPage = total / bufferSize;             // page 전체 개수

        int rest = total % bufferSize;
        if ( rest > 0 ) {
            totalPage += 1;
        }

        for( int i=offset; i < maxSize; i++) {
            applyQnas.add(
                new ApplyQna(i, "subject" + i, "content" +i, (i + 10), LocalDateTime.now())
            );
        }

        applyQnas = getApplyQnaForFilterAndSort(applyQnas, categoryType, sort, content);

        map.put("applyQnas", applyQnas);
        map.put("totalPage", totalPage);
        return map;
    }

    public List<ApplyQna> getApplyQnaForFilterAndSort(List<ApplyQna> applyQnas, CategoryType categoryType, Sort sort, String content) {
        List<ApplyQna> newApplyQnas = null;
        Comparator<ApplyQna> comparator = null;

        switch (categoryType){
            case SUBJECT:
                comparator = Comparator.comparing(ApplyQna::getSubject);
                if (Sort.DESC == sort) {
                    comparator = comparator.reversed();
                }
                newApplyQnas = applyQnas.stream()
                        .filter(applyQna -> applyQna.getSubject().indexOf(content) > -1 )
                        .sorted(comparator)
                        .collect(Collectors.toList());
                break;
            case REGDT:
                // content 가 날짜 이어야 가능
//                break;
            case NONE:
            default:
                comparator = Comparator.comparing(ApplyQna::getApplyQnaSeq);
                if (Sort.DESC == sort) {
                    comparator = comparator.reversed();
                }
                newApplyQnas = applyQnas.stream()
                        .sorted(comparator)
                        .collect(Collectors.toList());
                break;
        }

        return newApplyQnas;
    }

}
