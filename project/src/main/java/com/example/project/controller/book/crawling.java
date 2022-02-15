package com.example.project.controller.book;

import java.io.IOException;
import java.util.Objects;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.safety.Whitelist;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("crawling/*")
public class crawling {

	private static final Logger log = LoggerFactory.getLogger(crawling.class);
    private static final int FIRST_PAGE_INDEX = 1;
    private static final int LAST_PAGE_INDEX = 32;
    private static final String PLATFORM = "Inflearn";
	
	@RequestMapping("example.do")
	public static void main(String[] args) {
		final String inflearnUrl = "http://www.yes24.com/24/category/bestseller?CategoryNumber=001&sumgb=06&PageNumber=1";
        Connection conn = Jsoup.connect(inflearnUrl);

        try {
            Document document = conn.get();
            Elements tag_name = document.select("td.goodsTxtInfo > p:nth-child(1) > a:nth-child(1)");
            Elements tag_author = document.select("td.goodsTxtInfo > div > a:nth-child(1)");
            Elements tag_publisher = document.select(" td.goodsTxtInfo > div > a:nth-child(2)");
            String[] name = new String[tag_name.size()]; //책 제목
            String[] url = new String[tag_name.size()]; //책 url
            String[] author= new String[tag_name.size()]; //책 저자
            String[] publisher=new String[tag_publisher.size()]; //책 출판사
            String[] genre = new String[tag_name.size()]; //책 장르
            //책 설명
            //책 이미지
            
            int setindex=0;
            for (Element e: tag_name) {
            	url[setindex]=e.attr("href");
            	name[setindex]=e.text();
            	author[setindex]=e.text();
            	setindex++;
            }
            setindex=0;
            for (Element e: tag_author) {
            	author[setindex]=e.text();
            	setindex++;
            }
            setindex=0;
            for (Element e: tag_publisher) {
            	publisher[setindex]=e.text();
            	setindex++;
            }
            for (int i=0;i<tag_name.size();i++) {
            	System.out.print(name[i]);
            	System.out.print(url[i]);
            	System.out.print(author[i]);
            	System.out.print(publisher[i]);
            	System.out.println();
            }
            
            //도서내부링크
            for(int i=0;i<url.length;i++) {
            	Connection innerConn = Jsoup.connect("http://www.yes24.com"+url[i]);
            	Document innerDocument = innerConn.get();
            	
            	Elements tag_genre=innerDocument.select("div.infoSetCont_wrap > dl:nth-child(1) > dd > ul > li> a:nth-child(4)");
            	Elements tag_content=innerDocument.getElementsByClass("txtContentText");

            	genre[i]=tag_genre.text();
            	System.out.print("장르:"+genre[i]);
            	int index=genre[i].indexOf(" ");
            	if(index>0) {
            		System.out.print(index+"\t");
            		genre[i]=genre[i].substring(0,index);
            	}
            	System.out.println("장르 final:"+genre[i]);

            }
        } catch (IOException e) {
            e.printStackTrace();
        }
	}




}
