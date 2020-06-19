package com.dd.controller;

import com.dd.domain.Amerce;
import com.dd.domain.Book;
import com.dd.domain.Manager;
import com.dd.service.IAmerceService;
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


    /**
     * 添加记录
     */
    @RequestMapping("/addAmerce.do")
    public String addAmerce(Amerce amerce) {

        if (amerce.getIs_pay() == 0) {
            amerce.setPay_time(null);
        } else {
            //添加赔偿的时间
            Date date = new Date();
            amerce.setPay_time(date);
        }

        System.out.println(amerce);
        try {
            amerceService.addAmerce(amerce);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return "redirect:findAll.do";
        }
    }


    /**
     * 模糊查询
     *
     * @return
     */
    @RequestMapping("/findByS_id.do")
    public ModelAndView findByS_id(@RequestParam(name = "student_id", required = true) String student_id,
                                   @RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                   @RequestParam(name = "size", required = true, defaultValue = "10") Integer size) {
        ModelAndView mv = new ModelAndView();

        List<Amerce> amerces = amerceService.findByS_id(student_id, page, size);

        PageInfo<Amerce> pageInfo = new PageInfo<>(amerces);

        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("/amerce/listById");
        return mv;
    }


    /**
     * 删除记录
     */
    @RequestMapping("/deleteAmerce.do")
    public String deleteAmerce(@RequestParam(name = "id", required = true) String id) {
        System.out.println(id);

        try {
            amerceService.deleteAmerce(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("来了");
        return "redirect:findAll.do";
    }


}
