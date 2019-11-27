set names utf8;
set foreign_key_checks = 0;
drop database if exists pumpkin;
create database if not exists pumpkin;
use pumpkin;

create table user_info(
id int primary key not null auto_increment,
user_id varchar(16) unique not null,
password varchar(16) not null,
family_name varchar(32) not null,
first_name varchar(32) not null,
family_name_kana varchar(32) not null,
first_name_kana varchar(32) not null,
sex tinyint default 0,
email varchar(32),
status tinyint default 0,
logined tinyint not null default 0,
regist_date datetime not null,
update_date datetime
)

default charset=utf8;

create table product_info(
id int primary key not null auto_increment,
product_id int unique not null,
product_name varchar(100) unique not null,
product_name_kana varchar(100) unique not null,
product_description varchar(255),
category_id int not null,
price int not null,
image_file_path varchar(100) not null,
image_file_name varchar(50) not null,
release_date datetime,
release_company varchar(50),
status tinyint default 1,
regist_date datetime not null,
update_date datetime,
foreign key(category_id) references m_category(category_id)
)

default charset=utf8;

create table cart_info(
id int primary key not null auto_increment,
user_id varchar(16) not null,
product_id int not null,
product_count int not null,
regist_date datetime not null,
update_date datetime,
foreign key(product_id)references product_info(product_id)
)

default charset=utf8;

create table purchase_history_info(
id int primary key not null auto_increment,
user_id varchar(16) not null,
product_id int not null,
product_count int not null,
price int not null,
destination_id int not null,
regist_date datetime not null,
update_date datetime,
foreign key(user_id) references user_info(user_id),
foreign key(product_id) references product_info(product_id)
)

default charset=utf8;

create table destination_info(
id int primary key not null auto_increment,
user_id varchar(16) not null,
family_name varchar(32) not null,
first_name varchar(32) not null,
family_name_kana varchar(32) not null,
first_name_kana varchar(32) not null,
email varchar(32),
tel_number varchar(13),
user_address varchar(50) not null,
regist_date datetime not null,
update_date datetime,
foreign key(user_id) references user_info(user_id)
)

default charset=utf8;

create table m_category(
id int primary key not null auto_increment,
category_id int not null unique,
category_name varchar(20) not null unique,
category_description varchar(100),
regist_date datetime not null,
update_date datetime
)

default charset=utf8;

set foreign_key_checks = 1;

insert into user_info values
(1,"guest","guest","インターノウス","ゲストユーザー","いんたーのうす","げすとゆーざー",0,"guest@gmail.com",1,0,now(),now()),
(2,"guest2","guest2","インターノウス","ゲストユーザー2","いんたーのうす","げすとゆーざー2",0,"guest2@gmail.com",0,0,now(),now()),
(3,"guest3","guest3","インターノウス","ゲストユーザー3","いんたーのうす","げすとゆーざー3",0,"guest3@gmail.com",0,0,now(),now()),
(4,"guest4","guest4","インターノウス","ゲストユーザー4","いんたーのうす","げすとゆーざー4",0,"guest4@gmail.com",0,0,now(),now()),
(5,"guest5","guest5","インターノウス","ゲストユーザー5","いんたーのうす","げすとゆーざー5",0,"guest5@gmail.com",0,0,now(),now()),
(6,"guest6","guest6","インターノウス","ゲストユーザー6","いんたーのうす","げすとゆーざー6",0,"guest6@gmail.com",0,0,now(),now()),
(7,"guest7","guest7","インターノウス","ゲストユーザー7","いんたーのうす","げすとゆーざー7",0,"guest7@gmail.com",0,0,now(),now()),
(8,"guest8","guest8","インターノウス","ゲストユーザー8","いんたーのうす","げすとゆーざー8",0,"guest8@gmail.com",0,0,now(),now()),
(9,"guest9","guest9","インターノウス","ゲストユーザー9","いんたーのうす","げすとゆーざー9",0,"guest9@gmail.com",0,0,now(),now()),
(10,"guest10","guest10","インターノウス","ゲストユーザー10","いんたーのうす","げすとゆーざー10",0,"guest10@gmail.com",0,0,now(),now()),
(11,"guest11","guest11","インターノウス","ゲストユーザー11","いんたーのうす","げすとゆーざー11",0,"guest11@gmail.com",0,0,now(),now()),
(12,"guest12","guest12","インターノウス","ゲストユーザー12","いんたーのうす","げすとゆーざー12",0,"guest12@gmail.com",0,0,now(),now());

insert into m_category values
(1,1,"全てのカテゴリー","入学卒業、祭り,ハロウィン,クリスマス",now(), now()),
(2,2,"入学卒業","入学卒業に関するカテゴリーが対象となります",now(), now()),
(3,3,"祭り","祭りに関するカテゴリーが対象となります",now(), now()),
(4,4,"ハロウィン","ハロウィンに関するカテゴリーが対象となります",now(), now()),
(5,5,"クリスマス","クリスマスに関するカテゴリーが対象となります",now(), now());

insert into product_info values
(1,1,"ランドセル","らんどせる","前代未聞！！体験せよ、この発光力！！",2,15000,"./images","SchoolBag.jpg",now(),"Angel's Wing Corp.",1,now(),now()),
(2,2,"勉強机","べんきょうづくえ","学習に愛は必要不可欠！！",2,80000,"./images","StudyDesk.jpg",now(),"Natural Wood Corp.",1,now(),now()),
(3,3,"色紙","しきし","伝えられなかった想い、今伝えませんか？",2,1200,"./images","ColoredPaper.jpg",now(),"Heart-Warming Message Corp.",1,now(),now()),
(4,4,"学生服","がくせいふく","Designer's TARO",2,20000,"./images","SchoolUniform.jpg",now(),"株式会社未来",1,now(),now()),
(5,5,"花束","はなたば","あなたの気持ちを花言葉に添えて贈りませんか？",2,5500,"./images","Bouquet.jpg",now(),"株式会社お花畑",1,now(),now()),

(6,6,"花火","はなび","ひとときを一生の想い出にしませんか？",3,3000,"./images","FireWorks.jpg",now(),"Firework Corp.",1,now(),now()),
(7,7,"浴衣","ゆかた","目指せ浴衣美人！！意中の彼も釘付け！！",3,5000,"./images","Yukata.jpg",now(),"株式会社日本ドレス",1,now(),now()),
(8,8,"甚平","じんべい","吸水性抜群の着心地",3,4500,"./images","Jinbei.jpg",now(),"日本男児株式会社",1,now(),now()),
(9,9,"扇子","せんす","古来の風と匂い感じて",3,2500,"./images","FoldingFan.jpg",now(),"有限会社古来",1,now(),now()),
(10,10,"下駄","げた","履いてる？新感覚？買っちゃう？",3,4000,"./images","Geta.jpg",now(),"株式会社GTWorks",1,now(),now()),

(11,11,"オバケカボチャ","おばけかぼちゃ","ハロウィンの聖地からの贈り物",4,7000,"./images","Jack-O-Lantern.jpg",now(),"American Pumpkin Corp.",1,now(),now()),
(12,12,"コスプレ衣装","こすぷれいしょう","FreeSize(身長120～130cmのお客様を想定しています。)",4,8500,"./images","HalloweenCostume.jpg",now(),"Witch Fashion Corp.",1,now(),now()),
(13,13,"キャンディー","きゃんでぃー","おかし買わなきゃいたずらしちゃうぞ？",4,500,"./images","Candys.jpg",now(),"トリックオアトリート株式会社",1,now(),now()),
(14,14,"お面","おめん","お面と言えばこれでしょ！！",4,3000,"./images","Mask.jpg",now(),"株式会社オーメン",1,now(),now()),
(15,15,"血糊","ちのり","友達を怖がらせてみませんか？",4,1000,"./images","BloodGlue.jpg",now(),"BloodType Corp.",1,now(),now()),

(16,16,"クリスマスツリー","くりすますつりー","一家に一本どうですか？",5,5000,"./images","ChristmasTree.jpg",now(),"株式会社いっぽん",1,now(),now()),
(17,17,"オーナメント","おーなめんと","クリスマスツリーにアクセント！！",5,1500,"./images","Ornament.jpg",now(),"株式会社KTAW",1,now(),now()),
(18,18,"リース","りーす","玄関をクリスマスいっぱいに！！",5,3000,"./images","Wreath.jpg",now(),"株式会社リーリーリース",1,now(),now()),
(19,19,"サンタコス","さんたこす","子供に夢を与えよう！！",5,9000,"./images","SantaCosplay.jpg",now(),"株式会社サンタクロス",1,now(),now()),
(20,20,"ケーキ","けーき","Merry Christmas！！！",5,6500,"./images","ChristmasCake.jpg",now(),"株式会社ケーキウィズキリスト",1,now(),now());

insert into destination_info values
(1,"guest","インターノウス","テストユーザー","いんたーのうす","てすとゆーざー","guest@internous.co.jp","080-1234-5678","東京都千代田区三番町１ー１　ＫＹ三番町ビル１Ｆ",now(),now());