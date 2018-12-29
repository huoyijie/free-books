package com.iggy_huo.freebooks.book;

import lombok.*;
import org.yaml.snakeyaml.TypeDescription;
import org.yaml.snakeyaml.Yaml;
import org.yaml.snakeyaml.constructor.Constructor;

import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by huoyijie on 18/12/27.
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BookList {
    private List<Book> books;

    public BookShelf toBookShelf() {
        BookShelf bookShelf = new BookShelf(new ArrayList<>(), new ArrayList<>(), new ArrayList<>());
        books.forEach(bookShelf::addBook);
        // books.stream().forEach(bookShelf::addBook);
        return bookShelf;
    }

    public static BookList loadBooks() {
        Constructor cons = new Constructor(BookList.class);
        TypeDescription td = new TypeDescription(BookList.class);
        td.addPropertyParameters("books", Book.class);
        cons.addTypeDescription(td);
        Yaml yaml = new Yaml(cons);
        return yaml.load(BookList.class.getClassLoader().getResourceAsStream("static/book/freebooks.yml"));
    }

    public static void main(String[] args) throws URISyntaxException, IOException {
        BookList bookList = new BookList(new ArrayList<>());

        Path path = Paths.get(BookList.class.getClassLoader().getResource("static/book/booksDs.txt").toURI());
        List<String> lines = Files.readAllLines(path);
        ParseContext context = new ParseContext();
        lines.stream()
                .map(String::trim)
                .filter(line -> !line.isEmpty())
                .forEach(line -> {
                    if (line.startsWith("* [")) {
                        String name = line.substring(line.indexOf("[") + 1, line.indexOf("]"));
                        String url = line.substring(
                                line.indexOf("(", line.indexOf("]")) + 1,
                                line.indexOf(")", line.indexOf("]")));
                        bookList.getBooks().add(new Book(name, context.isLangDep(), context.getCategory(), url));
                    } else if (line.startsWith("###")) {
                        context.setCategory(line.split(" ")[1]);
                    } else if (line.startsWith("##")) {
                        if (line.contains("语言无关")) {
                            context.setLangDep(false);
                        } else if(line.contains("语言相关")) {
                            context.setLangDep(true);
                        }
                    } else {
                        System.out.println(line);
                    }
                });
        Path freebooksPath = Paths.get(BookList.class.getClassLoader().getResource("static/book/freebooks.yml").toURI());
        Yaml yaml = new Yaml();
        Files.write(freebooksPath, yaml.dump(bookList).getBytes());
    }
}

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
class ParseContext {
    private boolean langDep;
    private String category;
}