SELECT DISTINCT i.post_id Post, u.screenname Username, p.media_id "Photo or Video",  p.description "Caption", COUNT(i.like_datetime) Likes, COUNT(i.comment_datetime) Comments
FROM POST p JOIN INTERACTION i ON (p.post_id=i.post_id)
JOIN USER_ u ON (p.user_id=u.user_id)
WHERE i.post_id = '&post'
GROUP BY i.post_id, p.user_id, u.screenname, p.media_id, p.description;

/* show convo between two people, display screenname*/
SELECT DateTime_Sent as "Date/Time Sent", Text "Conversation", Screenname "Username"
FROM MESSAGE JOIN USER_ ON (sender=user_id)
WHERE SENDER IN ('&Sender', '&Recipient')
ORDER BY DateTime_Sent;

/* display comments from specified posts*/
SELECT post_id "Post", user_id "User", Post_Comment as Comments
FROM INTERACTION
WHERE post_id = '&Post' AND Post_Comment IS NOT NULL
ORDER BY Comment_DateTime;

/*Friends list*/
SELECT u.screenname as "Friends List"
FROM Friend f JOIN User_ u ON (u.user_id=f.user_id_two)
WHERE f.user_id = '&profile';