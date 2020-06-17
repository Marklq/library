package com.dd.controller;


import com.dd.domain.Master;
import com.dd.service.IMasterService;
import com.dd.service.impl.IMasterServiceImpl;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * UI
 */
@Controller
@RequestMapping("/master")
public class MasterController {


    @Autowired
    private IMasterService masterService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                @RequestParam(name = "size", required = true, defaultValue = "10") Integer size) {
        ModelAndView mv = new ModelAndView();

        List<Master> masters = masterService.findAll(page, size);
/*        for (Master m : masters
        ) {
            System.out.println(m);

        }*/
        PageInfo<Master> pageInfo = new PageInfo<>(masters);


        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("master/list");
        return mv;
    }


}
