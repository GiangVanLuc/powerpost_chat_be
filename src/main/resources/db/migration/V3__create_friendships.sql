CREATE TABLE friendships (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_low_id BIGINT UNSIGNED NOT NULL,
    user_high_id BIGINT UNSIGNED NOT NULL,
    requester_id BIGINT UNSIGNED NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at DATETIME(3) NOT NULL,
    updated_at DATETIME(3) NOT NULL,
    CONSTRAINT pk_friendships PRIMARY KEY (id),
    CONSTRAINT uq_friendships_pair UNIQUE (user_low_id, user_high_id),
    CONSTRAINT fk_friendships_low_user FOREIGN KEY (user_low_id)
        REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_friendships_high_user FOREIGN KEY (user_high_id)
        REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_friendships_requester FOREIGN KEY (requester_id)
        REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
