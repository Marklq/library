package com.dd.controller;


import com.dd.domain.Book;
import com.dd.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private IBookService bookService;


    @RequestMapping("/findAll.do")
    public ModelAndView findAll() {

        ModelAndView mv = new ModelAndView();

        List<Book> bookList = bookService.findAll();

        mv.addObject("bookList", bookList);

        mv.setViewName("../list");
        return mv;
    }

}
