package com.dd.controller;

import com.dd.domain.Manager;
import com.dd.domain.Reader;
import com.dd.service.IReaderService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/reader")
public class ReaderController {

    @Autowired
    private IReaderService readerService;

    /**
     * 查询所有
     *
     * @param page
     * @param size
     * @return
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                @RequestParam(name = "size", required = true, defaultValue = "10") Integer size) {
        ModelAndView mv = new ModelAndView();

        List<Reader> readers = readerService.findAll(page, size);
/*        for (Reader m : readers) {
            System.out.println(m);
        }*/
        PageInfo<Reader> pageInfo = new PageInfo<>(readers);

        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("reader/readerList");
        return mv;
    }


    /**
     * 添加读者
     */
    @RequestMapping("/addReader.do")
    public String addReader(Reader reader) {
        //添加UUID书籍编号
        String id = UUID.randomUUID().toString();
        reader.setId(id);
        //添加书籍注册时间
        Date date = new Date();
        reader.setReg_time(date);
        System.out.println(reader);
        try {
            readerService.addReader(reader);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return "redirect:findAll.do";
        }
    }


    /**
     * 删除读者
     */
    @RequestMapping("/deleteReader.do")
    public String deleteReader(@RequestParam(name = "id", required = true) String id) {
        System.out.println(id);
        try {
            readerService.deleteReader(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:findAll.do";
    }









}
