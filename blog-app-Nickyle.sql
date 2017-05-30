CREATE TABLE user_info(
    id serial primary key,
    first_name text, 
    last_name text,
    email text not null,
    sn text not null
);

CREATE TABLE posts(
    id serial primary key,
    author_id integer references user_info on DELETE CASCADE,
    title text not null,
    content text not null,
    time_pub timestamp default current_timestamp,
    comments text
);

CREATE TABLE comments(
    id serial primary key,
    author_id integer references user_info on DELETE CASCADE,
    posts_id integer references posts on DELETE CASCADE,
    comment text
);

CREATE TABLE tags(
    id serial primary key,
    tag text
);

CREATE TABLE tag_posts(
    tag_id integer references tags,
    post_id integer references posts on DELETE CASCADE
);

INSERT INTO user_info(
    email, sn) values ('lol@gmail.com', 'LoL'), ('dudebro@aol.com', '1337hax0r'), ('chrisKlanc@hotmail.com', 'proInstruct0r');

insert into posts(author_id, title, content) values (1, 'this is why i am named lolz', 'i am named lol because of the lolz'), (2, 'dooooodBROOOOO', 'dude, bros ftw'), (3, 'server side class 101', 'please look at the slides');

insert into comments (author_id, posts_id, comment) values (2, 1, 'dude your post sucks'), (1, 2, 'BRO ITS ME SUP MANG'), (1, 3, 'nah man, lol.'), (3, 2, 'dude, study.');

insert into tags (tag) values ('stuff');

insert into tag_posts(tag_id, post_id) VALUES (1,2);

-- SELECT * FROM user_info;
-- SELECT * FROM posts;
-- SELECT * FROM comments;
-- SELECT * FROM tags;
-- SELECT * FROM tag_posts;

-- SELECT email, sn , posts.title, posts.content 
-- FROM user_info INNER JOIN posts ON posts.author_id = user_info.id
-- WHERE user_info.id = 1; 

select sn AS "comment author", posts.title, posts.content, comments.comment
FROM user_info INNER JOIN comments ON comments.author_id = user_info.id
INNER JOIN posts ON comments.posts_id = posts.id
WHERE sn = 'LoL'
;

select postAuthor.sn AS "post author", posts.title, posts.content,commentAuthor.sn AS "comment author", comments.comment
FROM user_info cA,user_info postAuthor INNER JOIN comments ON comments.author_id = cA.id
INNER JOIN posts ON comments.posts_id = posts.id
INNER JOIN posts ON postAuthor.id = posts.id
WHERE sn = 'LoL';