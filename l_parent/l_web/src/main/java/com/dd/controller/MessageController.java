package com.dd.controller;

import com.dd.domain.Amerce;
import com.dd.domain.Message;
import com.dd.service.IMessageService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/message")
public class MessageController {

    @Autowired
    private IMessageService messageService;


    /**
     * 查询所有
     *
     * @return
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                @RequestParam(name = "size", required = true, defaultValue = "8") Integer size) {

        ModelAndView mv = new ModelAndView();

        List<Message> messages = messageService.findAll(page, size);

        PageInfo<Message> pageInfo = new PageInfo<>(messages);

        mv.addObject("pageInfo", pageInfo);

        mv.setViewName("message/list");
        return mv;
    }

}
