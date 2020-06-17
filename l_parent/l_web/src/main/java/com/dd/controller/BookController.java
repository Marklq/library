package com.dd.controller;


import com.dd.domain.Book;
import com.dd.service.IBookService;
import com.dd.utils.TimeUtils;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private IBookService bookService;

    /**
     * 查询所有
     *
     * @return
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                @RequestParam(name = "size", required = true, defaultValue = "10") Integer size) {

        ModelAndView mv = new ModelAndView();

        List<Book> bookList = bookService.findAll(page, size);

        PageInfo<Book> pageInfo = new PageInfo<>(bookList);

//        mv.addObject("bookList", bookList);
        mv.addObject("pageInfo", pageInfo);

        mv.setViewName("book/list");
        return mv;
    }

    /**
     * 模糊查询
     *
     * @return
     */
    @RequestMapping("/findByName.do")
    public ModelAndView findByName(@RequestParam(name = "bookName", required = true) String bookName,
                                   @RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                   @RequestParam(name = "size", required = true, defaultValue = "10") Integer size) {
        System.out.println(bookName);
        ModelAndView mv = new ModelAndView();

        List<Book> bookList = bookService.findByName(bookName, page, size);

        PageInfo<Book> pageInfo = new PageInfo<>(bookList);
        for (Book book : bookList
        ) {
            System.out.println(book);

        }
//        mv.addObject("bookList", bookList);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("book/list");
        return mv;
    }

    /**
     * 添加书籍
     */
    @RequestMapping("/addBook.do")
    public String addBook(Book book) {
        Date date = new Date();
        book.setRegister_time(date);
        System.out.println(book);
        try {
            bookService.addBook(book);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return "redirect:findAll.do";
        }
    }


    /**
     * 跳转到书籍修改页面
     */
    @RequestMapping("/modifyBook.do")
    public ModelAndView modifyBook(@RequestParam(name = "bookId", required = true) String bookId) {

        ModelAndView mv = new ModelAndView();
        Book book = bookService.findBookById(bookId);
//        System.out.println(book.getBook_id());

        mv.addObject("book", book);

        mv.setViewName("book/modify");
        return mv;
    }


    /**
     * 根据书籍注册时间修改书籍数据
     */
    @RequestMapping("/modify.do")
    public String modify(Book book) {
        System.out.println(book);

        bookService.modify(book);
        System.out.println(book);

        return "redirect:findAll.do";
    }


    /**
     * 根据书籍注册时间修改书籍数据
     */
    @RequestMapping("/deleteBook.do")
    public String deleteBook(@RequestParam(name = "bookId", required = true) String bookId) {
        System.out.println(bookId);

        bookService.deleteBook(bookId);


        return "redirect:findAll.do";
    }



}
