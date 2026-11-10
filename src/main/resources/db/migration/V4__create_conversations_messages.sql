CREATE TABLE conversations (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    type VARCHAR(20) NOT NULL DEFAULT 'DIRECT',
    direct_key VARCHAR(60) NOT NULL,
    created_at DATETIME(3) NOT NULL,
    CONSTRAINT pk_conversations PRIMARY KEY (id),
    CONSTRAINT uq_conversations_direct_key UNIQUE (direct_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE conversation_members (
    conversation_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    joined_at DATETIME(3) NOT NULL,
    CONSTRAINT pk_conversation_members PRIMARY KEY (conversation_id, user_id),
    CONSTRAINT fk_conversation_members_conversation FOREIGN KEY (conversation_id)
        REFERENCES conversations(id) ON DELETE CASCADE,
    CONSTRAINT fk_conversation_members_user FOREIGN KEY (user_id)
        REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_conversation_members_user (user_id, conversation_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE messages (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    conversation_id BIGINT UNSIGNED NOT NULL,
    sender_id BIGINT UNSIGNED NOT NULL,
    client_message_id VARCHAR(64) NOT NULL,
    message_type VARCHAR(20) NOT NULL DEFAULT 'TEXT',
    content TEXT NOT NULL,
    created_at DATETIME(3) NOT NULL,
    CONSTRAINT pk_messages PRIMARY KEY (id),
    CONSTRAINT uq_messages_sender_client_id UNIQUE (sender_id, client_message_id),
    CONSTRAINT fk_messages_conversation FOREIGN KEY (conversation_id)
        REFERENCES conversations(id) ON DELETE CASCADE,
    CONSTRAINT fk_messages_sender FOREIGN KEY (sender_id)
        REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_messages_conversation_id (conversation_id, id),
    INDEX idx_messages_sender_created_at (sender_id, created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE message_receipts (
    message_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    delivered_at DATETIME(3) NULL,
    read_at DATETIME(3) NULL,
    CONSTRAINT pk_message_receipts PRIMARY KEY (message_id, user_id),
    CONSTRAINT fk_message_receipts_message FOREIGN KEY (message_id)
        REFERENCES messages(id) ON DELETE CASCADE,
    CONSTRAINT fk_message_receipts_user FOREIGN KEY (user_id)
        REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_message_receipts_user_read (user_id, read_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
