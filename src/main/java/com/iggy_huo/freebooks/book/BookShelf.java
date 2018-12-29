package com.iggy_huo.freebooks.book;

import lombok.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by huoyijie on 18/12/28.
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BookShelf {
    private List<Box> boxList;
    private List<String> langDepCategoryList;
    private List<String> lanIndepCategoryList;

    public void addBook(Book book) {
        Box box = hasRoom() ?
                boxList.stream()
                .filter(iBox -> !iBox.full())
                .findFirst()
                .get() : new Box(new ArrayList<>()).join(boxList);
        box.getBookList().add(book);

        if ((book.isLangDep() && !langDepCategoryList.contains(book.getCategory()))
                || (!book.isLangDep() && !lanIndepCategoryList.contains(book.getCategory()))) {
            box.getAnchorBookNameList().add(book.getName());
            boolean added = book.isLangDep() ?
                    langDepCategoryList.add(book.getCategory()) :
                    lanIndepCategoryList.add(book.getCategory());
        }
    }

    public boolean hasRoom() {
        assert boxList != null;
        return boxList.size() != 0 && !boxList.stream().allMatch(Box::full);
    }
}