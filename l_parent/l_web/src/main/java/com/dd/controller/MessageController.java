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

import java.util.Date;
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


    /**
     * 添加留言
     */
    @RequestMapping("/addMessage.do")
    public String addMessage(Message message) {
        System.out.println(message);
        Date date = new Date();
        message.setTime(date);
        try {
            messageService.addMessage(message);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return "redirect:findAll.do";
        }
    }


    /**
     * 根据学号查询
     *
     * @return
     */
    @RequestMapping("/findByS_id.do")
    public ModelAndView findByS_id(@RequestParam(name = "id", required = true) String student_id,
                                   @RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                   @RequestParam(name = "size", required = true, defaultValue = "10") Integer size) {
        ModelAndView mv = new ModelAndView();

        List<Message> messages = messageService.findByS_id(student_id, page, size);

        PageInfo<Message> pageInfo = new PageInfo<>(messages);

        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("/message/listById");
        return mv;
    }


    /**
     * 删除记录
     */
    @RequestMapping("/deleteMessage.do")
    public String deleteMessage(@RequestParam(name = "id", required = true) String id) {
//        System.out.println(id);

        try {
            messageService.deleteMessage(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
//        System.out.println("来了");
        return "redirect:findAll.do";
    }


}
