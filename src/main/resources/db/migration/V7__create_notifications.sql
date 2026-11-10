CREATE TABLE notifications (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    recipient_id BIGINT UNSIGNED NOT NULL,
    actor_id BIGINT UNSIGNED NULL,
    notification_type VARCHAR(30) NOT NULL,
    text VARCHAR(255) NOT NULL,
    friendship_id BIGINT UNSIGNED NULL,
    conversation_id BIGINT UNSIGNED NULL,
    call_session_id BIGINT UNSIGNED NULL,
    created_at DATETIME(3) NOT NULL,
    read_at DATETIME(3) NULL,
    CONSTRAINT pk_notifications PRIMARY KEY (id),
    CONSTRAINT fk_notifications_recipient FOREIGN KEY (recipient_id)
        REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_notifications_actor FOREIGN KEY (actor_id)
        REFERENCES users(id) ON DELETE SET NULL,
    CONSTRAINT fk_notifications_friendship FOREIGN KEY (friendship_id)
        REFERENCES friendships(id) ON DELETE SET NULL,
    CONSTRAINT fk_notifications_conversation FOREIGN KEY (conversation_id)
        REFERENCES conversations(id) ON DELETE SET NULL,
    CONSTRAINT fk_notifications_call_session FOREIGN KEY (call_session_id)
        REFERENCES call_sessions(id) ON DELETE SET NULL,
    INDEX idx_notifications_recipient_created (recipient_id, created_at, id),
    INDEX idx_notifications_recipient_read (recipient_id, read_at, created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
