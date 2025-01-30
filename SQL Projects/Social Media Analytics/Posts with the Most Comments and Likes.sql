SELECT
    p.post_id,
    p.content,
    COUNT(DISTINCT c.comment_id) AS comment_count,
    COUNT(DISTINCT l.like_id) AS like_count
FROM posts p
LEFT JOIN comments c ON p.post_id = c.post_id
LEFT JOIN likes l ON p.post_id = l.post_id
GROUP BY p.post_id, p.content
ORDER BY comment_count DESC, like_count DESC;