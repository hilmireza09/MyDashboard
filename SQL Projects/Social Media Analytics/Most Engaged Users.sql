WITH user_engagement AS (
    SELECT
        u.user_id,
        u.username,
        COUNT(DISTINCT p.post_id) AS post_count,
        COUNT(DISTINCT c.comment_id) AS comment_count,
        COUNT(DISTINCT l.like_id) AS like_count
    FROM users u
    LEFT JOIN posts p ON u.user_id = p.user_id
    LEFT JOIN comments c ON u.user_id = c.user_id
    LEFT JOIN likes l ON u.user_id = l.user_id
    GROUP BY u.user_id, u.username
)
SELECT
    user_id,
    username,
    post_count,
    comment_count,
    like_count,
    (post_count + comment_count + like_count) AS total_engagement
FROM user_engagement
ORDER BY total_engagement DESC;