INSERT INTO DRAMA (NAME, EPISODES, ACTOR, GENRE) VALUES ('The Walking Dead', 16,  'Andrew Lincoln', 'Horror' );
INSERT INTO MOVIE (NAME, ACTOR, GENRE, RATING) VALUES ('Minions', 'Sandra Bullock', 'Animation', 6.5);
INSERT INTO COFFEE (NAME, LOCAL, PRICE, TESTING) VALUES ('first', 'U.S', 200, 'yes');
INSERT INTO Notebook (BRAND, NAME, CPU, PRICE) VALUES ('ASUS', 'ZenBook-UX305FA', 'Intel Core M 5Y10 處理器', 40000);

INSERT INTO GAME (NAME, EVALUATION, DOWNLOAD, URL) VALUES ('部落衝突', 5, 3000000, 'www.coc.com.tw')
INSERT INTO GAME (NAME, EVALUATION, DOWNLOAD, URL) VALUES ('皇室戰爭', 4, 1000000, 'www.cor.com.tw')
INSERT INTO GAME (NAME, EVALUATION, DOWNLOAD, URL) VALUES ('神魔之塔', 5, 4000000, 'www.tos.com.tw')
INSERT INTO GAME (NAME, EVALUATION, DOWNLOAD, URL) VALUES ('爐石戰記', 4, 6000000, 'www.heartstone.com.tw')
INSERT INTO GAME (NAME, EVALUATION, DOWNLOAD, URL) VALUES ('列王的紛爭', 3, 2000000, 'www.cok.com.tw')

INSERT INTO BRAND (BRANDNAME, BRANDCNAME, BRANDIMG, WEBSITE, BCFUNC, BRANDSHOW) VALUES ('Biore', '蜜妮', 'src\main\webapp\WEB-INF\img\brand\Biore.png', 'http://www.kao.com/tw/biore/' , 'biore',1)
INSERT INTO BRAND (BRANDNAME, BRANDCNAME, BRANDIMG, WEBSITE, BCFUNC, BRANDSHOW) VALUES ('Clinique', '倩碧', 'src\main\webapp\WEB-INF\img\brand\Clinique.png', 'http://www.clinique.com.tw/' , 'elca',1)
INSERT INTO BRAND (BRANDNAME, BRANDCNAME, BRANDIMG, WEBSITE, BCFUNC, BRANDSHOW) VALUES ('M.A.C', '', 'src\main\webapp\WEB-INF\img\brand\M.A.C.png', 'https://www.maccosmetics.com.tw/' , 'elca',1)
INSERT INTO BRAND (BRANDNAME, BRANDCNAME, BRANDIMG, WEBSITE, BCFUNC, BRANDSHOW) VALUES ('Lancome', '蘭蔻', 'src\main\webapp\WEB-INF\img\brand\Lancome.png', 'http://www.lancome.com.tw/lancome/_zh/_tw/index.aspx' , 'loreal',1)
INSERT INTO BRAND (BRANDNAME, BRANDCNAME, BRANDIMG, WEBSITE, BCFUNC, BRANDSHOW) VALUES ('L''Oreal', '巴黎萊雅', 'src\main\webapp\WEB-INF\img\brand\L''Oreal.png', 'http://www.loreal.com.tw/' , 'loreal',1)

INSERT INTO Category (CATEGORYNAME, CATEGORYIMG) VALUES ('lotion','src/...')
INSERT INTO Category (CATEGORYNAME, CATEGORYIMG) VALUES ('cream','src/...')
INSERT INTO Category (CATEGORYNAME, CATEGORYIMG) VALUES ('facial mask','src/...')
INSERT INTO Category (CATEGORYNAME, CATEGORYIMG) VALUES ('foundation','src/...')
INSERT INTO Category (CATEGORYNAME, CATEGORYIMG) VALUES ('sun protection','src/...')

INSERT INTO REVIEW (MEMBERID, PRODID, REVIEWTITLE, REVIEW, REVIEWRATING, REVIEWIMG, REVIEWTIME, REWCOLLECT, REVIEWSHOW) VALUES (1000, 10, '心得標題1', '內文1', '5', 'src/...', '2016-06-19', '99', 'flagshow')
INSERT INTO REVIEW (MEMBERID, PRODID, REVIEWTITLE, REVIEW, REVIEWRATING, REVIEWIMG, REVIEWTIME, REWCOLLECT, REVIEWSHOW) VALUES (2000, 20, '心得標題2', '內文2', '5', 'src/...', '2016-06-19', '99', 'flagshow')

INSERT INTO REVIEWCM (REVIEWID, REVIEWCMMSG, MEMBERID, REVIEWCMSHOW, REVIEWCMREPORT) VALUES (100, '內容1', 10, 'T', 99)
INSERT INTO REVIEWCM (REVIEWID, REVIEWCMMSG, MEMBERID, REVIEWCMSHOW, REVIEWCMREPORT) VALUES (200, '內容2', 20, 'F', 88)

INSERT INTO Ingredient (INGREDName, INGREDCName, INGREDChar, INGREDIrritant, INGREDAcne, INGREDSafety) values ('Titanium Dioxide', '二氧化鈦', '防曬', 0, 0, 2)

INSERT INTO PRODUCT (PRODNAME, BRANDID, CATEGORYID, WEIGHT, SCORE, PRICE, CAPACITY, LAUNCHDATE, PRODDESC, MAINIGDT, CONCENTRATION, PRODIMG) VALUES ('產品1', 1, 1, 1.0, 1.5, 150, 100, '2016-06-12', '產品說明1', 1, 0.3, 'src/')
INSERT INTO PRODUCT (PRODNAME, BRANDID, CATEGORYID, WEIGHT, SCORE, PRICE, CAPACITY, LAUNCHDATE, PRODDESC, MAINIGDT, CONCENTRATION, PRODIMG) VALUES ('產品2', 2, 2, 2.0, 2.5, 250, 200, '2016-06-12', '產品說明2', 2, 0.2, 'src/')
INSERT INTO PRODUCT (PRODNAME, BRANDID, CATEGORYID, WEIGHT, SCORE, PRICE, CAPACITY, LAUNCHDATE, PRODDESC, MAINIGDT, CONCENTRATION, PRODIMG) VALUES ('產品3', 3, 3, 3.0, 3.5, 350, 300, '2016-06-12', '產品說明3', 3, 0.6, 'src/')
INSERT INTO PRODUCT (PRODNAME, BRANDID, CATEGORYID, WEIGHT, SCORE, PRICE, CAPACITY, LAUNCHDATE, PRODDESC, MAINIGDT, CONCENTRATION, PRODIMG) VALUES ('產品4', 1, 1, 4.0, 4.5, 450, 400, '2016-06-12', '產品說明4', 1, 0.9, 'src/')
INSERT INTO PRODUCT (PRODNAME, BRANDID, CATEGORYID, WEIGHT, SCORE, PRICE, CAPACITY, LAUNCHDATE, PRODDESC, MAINIGDT, CONCENTRATION, PRODIMG) VALUES ('產品5', 3, 3, 3.0, 3.5, 350, 300, '2016-06-12', '產品說明5', 2, 0.5, 'src/')
INSERT INTO PRODUCT (PRODNAME, BRANDID, CATEGORYID, WEIGHT, SCORE, PRICE, CAPACITY, LAUNCHDATE, PRODDESC, MAINIGDT, CONCENTRATION, PRODIMG) VALUES ('產品6', 2, 2, 2.0, 2.5, 250, 200, '2016-06-12', '產品說明6', 3, 0.7, 'src/')
INSERT INTO PRODUCT (PRODNAME, BRANDID, CATEGORYID, WEIGHT, SCORE, PRICE, CAPACITY, LAUNCHDATE, PRODDESC, MAINIGDT, CONCENTRATION, PRODIMG) VALUES ('產品7', 1, 1, 1.0, 1.5, 150, 100, '2016-06-12', '產品說明7', 1, 1.0, 'src/')
INSERT INTO PRODUCT (PRODNAME, BRANDID, CATEGORYID, WEIGHT, SCORE, PRICE, CAPACITY, LAUNCHDATE, PRODDESC, MAINIGDT, CONCENTRATION, PRODIMG) VALUES ('產品8', 1, 1, 1.0, 1.5, 150, 100, '2016-06-12', '產品說明8', 2, 0.5, 'src/')
INSERT INTO PRODUCT (PRODNAME, BRANDID, CATEGORYID, WEIGHT, SCORE, PRICE, CAPACITY, LAUNCHDATE, PRODDESC, MAINIGDT, CONCENTRATION, PRODIMG) VALUES ('產品9', 2, 2, 2.0, 2.5, 250, 200, '2016-06-12', '產品說明9', 3, 0.2, 'src/')
INSERT INTO PRODUCT (PRODNAME, BRANDID, CATEGORYID, WEIGHT, SCORE, PRICE, CAPACITY, LAUNCHDATE, PRODDESC, MAINIGDT, CONCENTRATION, PRODIMG) VALUES ('產品10', 3, 3, 3.0, 3.5, 350, 300, '2016-06-12', '產品說明10', 1, 0.4, 'src/')
INSERT INTO PRODUCT (PRODNAME, BRANDID, CATEGORYID, WEIGHT, SCORE, PRICE, CAPACITY, LAUNCHDATE, PRODDESC, MAINIGDT, CONCENTRATION, PRODIMG) VALUES ('產品11', 1, 1, 4.0, 4.5, 450, 400, '2016-06-12', '產品說明11', 2, 1.0, 'src/')
INSERT INTO PRODUCT (PRODNAME, BRANDID, CATEGORYID, WEIGHT, SCORE, PRICE, CAPACITY, LAUNCHDATE, PRODDESC, MAINIGDT, CONCENTRATION, PRODIMG) VALUES ('產品12', 3, 3, 3.0, 3.5, 350, 300, '2016-06-12', '產品說明12', 3, 0.3, 'src/')
INSERT INTO PRODUCT (PRODNAME, BRANDID, CATEGORYID, WEIGHT, SCORE, PRICE, CAPACITY, LAUNCHDATE, PRODDESC, MAINIGDT, CONCENTRATION, PRODIMG) VALUES ('產品13', 2, 2, 2.0, 2.5, 250, 200, '2016-06-12', '產品說明13', 2, 0.2, 'src/')
INSERT INTO PRODUCT (PRODNAME, BRANDID, CATEGORYID, WEIGHT, SCORE, PRICE, CAPACITY, LAUNCHDATE, PRODDESC, MAINIGDT, CONCENTRATION, PRODIMG) VALUES ('產品14', 1, 1, 1.0, 1.5, 150, 100, '2016-06-12', '產品說明14', 1, 0.1, 'src/')

INSERT INTO EXPDATE(MEMBERID,BRANDID,PROID,BATCHCODE,MFD,EXP) values (1,1,1,333,'2008-01-16','2011-01-16')
INSERT INTO EXPDATE(memberId,brandId,proId,batchCode,mfd,exp) values (1,2,2,555,'2008-01-16','2011-01-16')
INSERT INTO EXPDATE(memberId,brandId,proId,batchCode,mfd,exp) values (2,9,9,999,'2008-01-16','2011-01-16')

INSERT INTO MEMBER(EMAIL, PASSWORD, NICKNAME, LASTNAME, FIRSTNAME, GENDER, BIRTHDAY, SKINTYPE, MEMBERIMG, PHONE, ADDR, MEMBERSUSPEND, MEMBERSUSPENDEXP) VALUES ('jenny@gmail.com', 'abc1234', 'little J', 'Wang', 'Jenny', 'F', '1988-01-01', 'sensitive', 'aaaaaaaaaaa', '0910123456', 'Taipei Taiwan', 0, '2016-08-13')
INSERT INTO MEMBER(EMAIL, PASSWORD, NICKNAME, LASTNAME, FIRSTNAME, GENDER, BIRTHDAY, SKINTYPE, MEMBERIMG, PHONE, ADDR, MEMBERSUSPEND, MEMBERSUSPENDEXP) VALUES ('serena@gmail.com', 'abc1234', 'Serena', 'Lee', 'Serena', 'F', '1988-01-01', 'sensitive', 'aaaaaaaaaaa', '0910123456', 'Taipei Taiwan', 0, '2016-08-13')

