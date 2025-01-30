SELECT
    u.user_id,
    u.username
FROM users u
LEFT JOIN posts p ON u.user_id = p.user_id
LEFT JOIN likes l ON u.user_id = l.user_id
WHERE p.post_id IS NULL AND l.like_id IS NULL;