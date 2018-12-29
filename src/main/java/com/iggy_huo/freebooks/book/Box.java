package com.iggy_huo.freebooks.book;

import lombok.*;

import java.util.*;

/**
 * Created by huoyijie on 18/12/28.
 */
@Getter
@Setter
@RequiredArgsConstructor
@ToString
public class Box {
    private static final int[] MAX_EACH_BOX = {4, 4, 5, 5, 5, 5, 5, 6, 6, 6};
    private int rand = Math.abs(new Random().nextInt());
    private int maxEachBox = MAX_EACH_BOX[rand % MAX_EACH_BOX.length];
    private static final String[] BOOK_BG_COLOR = {"orangered", "deepskyblue", "purple", "darkcyan"};
    private String bookBgColor = BOOK_BG_COLOR[rand % BOOK_BG_COLOR.length];
    private static final String[] BOOK_SKEW = {"normal", "skew", "skew"};
    private String bookSkew = BOOK_SKEW[rand % BOOK_SKEW.length];
    private List<String> anchorBookNameList = new ArrayList<>();

    @NonNull
    private List<Book> bookList;

    public boolean full() {
        assert bookList != null;
        return bookList.size() >= maxEachBox;
    }

    public Box join(List<Box> boxList) {
        boxList.add(this);
        return this;
    }
}
