package com.dd.controller;

import com.dd.domain.Amerce;
import com.dd.domain.Book;
import com.dd.service.IAmerceService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/amerce")
public class AmerceController {

    @Autowired
    private IAmerceService amerceService;

    /**
     * 查询所有
     *
     * @return
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                @RequestParam(name = "size", required = true, defaultValue = "8") Integer size) {

        ModelAndView mv = new ModelAndView();

        List<Amerce> amerces = amerceService.findAll(page, size);

        PageInfo<Amerce> pageInfo = new PageInfo<>(amerces);

        mv.addObject("pageInfo", pageInfo);

        mv.setViewName("amerce/list");
        return mv;
    }



}
