package pl.coderslab.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.Book;
import pl.coderslab.model.BookService;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/books")
public class BookController {
    Logger logger = LoggerFactory.getLogger(BookController.class);
    private BookService bookService;

    public BookController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("")
    public String showPosts(Model model) {
        List<Book> books = bookService.getBooks();
        model.addAttribute("books", books);
        return "books/all";
    }

    @GetMapping("/{id}")
    public String getBook(@PathVariable long id, Model model) {
        Optional<Book> book = bookService.getBookById(id);
        if (book.isPresent()) {
            model.addAttribute("book", book.get());
            return "books/details";
        } else {
            return "redirect:/books";
        }
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("book", new Book());
        return "books/add";
    }

    @PostMapping("")
    public String addBook(@Valid Book book, BindingResult result) {
        if (result.hasErrors()) {
            result.getAllErrors().forEach(r -> logger.info("New book form: " + r.toString()));
            return "books/add";
        }
        bookService.addBook(book);
        logger.info("Created new book: " + book);
        return "redirect:/books";
    }

    @GetMapping("/edit/{id}")
    public String showUpdateBookForm(@PathVariable long id, Model model) {
        Optional<Book> bookToUpdate = bookService.getBookById(id);
        if (bookToUpdate.isPresent()) {
            model.addAttribute("book", bookToUpdate.get());
            return "books/add";
        } else {
            return "redirect:/books";
        }
    }

    @PostMapping("/edit")
    public String updateBook(@Valid Book book, BindingResult result, Model model) {
        if (result.hasErrors()) {
            result.getAllErrors().forEach(r -> logger.info("Update form: " + r.toString()));
            return "books/add";
        }
        bookService.updateBook(book);
        model.addAttribute(book);
        return "books/details";
    }

    @GetMapping("/delete/{id}")
    public String showDeleteConfirmation(@PathVariable long id, Model model) {
        Optional<Book> bookToDelete = bookService.getBookById(id);
        if (bookToDelete.isPresent()) {
            model.addAttribute("id", id);
            return "books/confirm";
        } else {
            return "redirect:/books";
        }
    }

    @PostMapping("/delete/{id}")
    public String deleteBook(@PathVariable long id) {
        Optional<Book> bookToDelete = bookService.getBookById(id);
        if (bookToDelete.isPresent()) {
            bookService.deleteBook(id);
        }
        return "redirect:/books";
    }


}
