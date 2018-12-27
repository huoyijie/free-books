package com.iggy_huo.freebooks.book;

import lombok.*;
/**
 * Created by huoyijie on 18/12/27.
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Book {
    private String name;
    private boolean langDep;
    private String category;
    private String url;
}
