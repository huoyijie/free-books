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

    public void addBook(Book book) {
        if (hasRoom()) {
            boxList.stream()
                    .filter(box -> !box.full())
                    .findFirst()
                    .get()
                    .getBookList()
                    .add(book);
        } else {
            Box box = new Box(new ArrayList<>());
            box.getBookList().add(book);
            boxList.add(box);
        }
    }

    public boolean hasRoom() {
        assert boxList != null;
        return boxList.size() != 0 && !boxList.stream().allMatch(Box::full);
    }
}