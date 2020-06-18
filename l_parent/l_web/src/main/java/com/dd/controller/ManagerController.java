package com.dd.controller;

import com.dd.domain.Book;
import com.dd.domain.Manager;
import com.dd.service.IManagerService;
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
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    private IManagerService managerService;

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

        List<Manager> managers = managerService.findAll(page, size);
/*        for (Manager m : managers) {
            System.out.println(m);
        }*/
        PageInfo<Manager> pageInfo = new PageInfo<>(managers);

        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("master/managersList");
        return mv;
    }

    /**
     * 模糊查询用户
     *
     * @return
     */
    @RequestMapping("/findByName.do")
    public ModelAndView findByName(@RequestParam(name = "username", required = true) String username,
                                   @RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                   @RequestParam(name = "size", required = true, defaultValue = "10") Integer size) {
//        System.out.println(bookName);
        ModelAndView mv = new ModelAndView();

        List<Manager> managers = managerService.findByName(username, page, size);

        PageInfo<Manager> pageInfo = new PageInfo<>(managers);

        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("master/managersList");
        return mv;
    }


    /**
     * 添加管理
     */
    @RequestMapping("/addManager.do")
    public String addManager(Manager manager) {
        //添加UUID书籍编号
        String id = UUID.randomUUID().toString();
        manager.setId(id);
        //添加书籍注册时间
        Date date = new Date();
        manager.setReg_time(date);
        System.out.println(manager);
        try {
            managerService.addManager(manager);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return "redirect:findAll.do";
        }
    }

    /**
     * 跳转到修改页
     *
     * @param id
     * @return
     */
    @RequestMapping("/modifyPage")
    public ModelAndView modifyPage(@RequestParam(name = "id", required = true) String id) {
        ModelAndView mv = new ModelAndView();

        Manager manager = managerService.findById(id);

//        PageInfo<Manager> pageInfo = new PageInfo<>(managers);

        mv.addObject("manager", manager);
        mv.setViewName("master/modifyManager");

        return mv;
    }

    /**
     * 修改用户信息
     *
     * @param manager
     * @return
     */
    @RequestMapping("/modifyManager.do")
    public String modifyManager(Manager manager) {
        System.out.println(manager);
        try {
            managerService.modifyManager(manager);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:findAll.do";
    }


    /**
     * 删除管理员
     */
    @RequestMapping("/deleteManager.do")
    public String deleteManager(@RequestParam(name = "id", required = true) String id) {
        System.out.println(id);

        try {
            managerService.deleteManager(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:findAll.do";
    }

}
