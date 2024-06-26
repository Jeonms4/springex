package com.green.springex.mapper;

import com.green.springex.domain.TodoVO;
import com.green.springex.dto.PageRequestDTO;
import com.green.springex.mapper.TodoMapper;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.IntStream;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class TodoMapperTests {


    @Autowired(required = false)
    private TodoMapper todoMapper;

    @Test
    public void testGetTime(){
        log.info("현재 시간 : " + todoMapper.getTime());
    };


    @Test
    public void testInsert(){
        TodoVO todoVO=TodoVO.builder().title("스프링테스트1")
                .dueDate(LocalDate.of(2024,04,17)).writer("user00").build();
        todoMapper.insert(todoVO);
    };


    @Test
    public void bulkTestInsert(){
        IntStream.range(1, 1025).forEach((i)->{
            TodoVO todoVO=TodoVO.builder().title("스프링테스트" + i)
                    .dueDate(LocalDate.of(2024,04,17)).writer("user00").build();
            todoMapper.insert(todoVO);
        });


    };


    @Test
    public void testSelectAll() {
        List<TodoVO> voList =todoMapper.selectAll();

        voList.forEach((vo)->{log.info(vo);});
    }


    @Test
    public void testSelectOne() {
        TodoVO todoVO =todoMapper.selectOne(5L);

        log.info(todoVO);
    }



    //페이징을 적용한 글 조회
    @Test
    public void testSelectList(){
        log.info("마지막 페이지 " + (int)(Math.ceil(1024/(double)10)));

        PageRequestDTO pageRequestDTO=PageRequestDTO.builder().page(103).size(10).build();
        List<TodoVO> voList=todoMapper.selectPagingList(pageRequestDTO);
        log.info("페이징 처리 후 결과 : " + voList);

        voList.forEach((vo)->{log.info(vo);});
    }

    //전체 글 갯수 조회
    @Test
    public void testgetCount(){
        PageRequestDTO pageRequestDTO= PageRequestDTO.builder().page(0).size(1024).build();
        int totalCont=todoMapper.getCount(pageRequestDTO);
        log.info("전체 글 갯수" + totalCont);

    }
}
