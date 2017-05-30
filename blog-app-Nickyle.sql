CREATE TABLE user_info(
    id serial primary key,
    first_name text, 
    last_name text,
    email text not null,
    sn text not null
);

CREATE TABLE posts(
    id serial primary key,
    author_id references user_info on DELETE CASCADE,
    title text not null,
    content text not null,
    time_pub timestamp default current_timestamp,
    comments text,
);

CREATE TABLE comments(
    id serial primary key,
    author_id references user_info on DELETE CASCADE,
    posts_id references posts on DELETE CASCADE,
    comment text
);

CREATE TABLE tags(
    id serial primary key,
    tag text
);

CREATE TABLE tag_posts(
    tag_id references tags,
    post_id references posts on DELETE CASCADE
);

INSERT INTO user_info(
    email, sn) values ('lol@gmail.com', 'LoL'), ('dudebro@aol.com', '1337hax0r'), ('chrisKlanc@hotmail.com', 'proInstruct0r');

insert into posts(author_id, title, content) values (1, 'this is why i am named lolz', 'i am named lol because of the lolz'), (2, 'dooooodBROOOOO', 'dude, bros ftw'), (3, 'server side class 101', 'please look at the slides');

insert into comments (author_id, post_id, comment) values (2, 1, 'dude your post sucks'), (1, 2, 'BRO ITS ME SUP MANG'), (1, 3, 'nah man, lol.'), (3, 2, 'dude, study.');

insert into tag_posts(tag_id, post_id) VALUES (1,2);

insert into tags (tag) value('stuff');
