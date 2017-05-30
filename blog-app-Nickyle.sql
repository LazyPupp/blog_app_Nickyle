CREATE TABLE user_info(
    id serial primary key,
    first_name text, 
    last_name text,
    email text not null,
    sn text not null
);

CREATE TABLE posts(
    id serial primary key,
    author_id references user_info,
    content text,
    time_pub timestamp,
    comments text,
    tags text
);

CREATE TABLE comments(
    id serial primary key,
    author_id references user_info,
    posts_id references posts,
    comment text
);
CREATE TABLE blog_posts(
    comment_id references comments,
    posts_id references posts,
    
)