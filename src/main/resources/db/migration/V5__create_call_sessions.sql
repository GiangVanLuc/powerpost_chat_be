CREATE TABLE call_sessions (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    call_uuid CHAR(36) NOT NULL,
    caller_id BIGINT UNSIGNED NOT NULL,
    receiver_id BIGINT UNSIGNED NOT NULL,
    call_type VARCHAR(10) NOT NULL,
    status VARCHAR(20) NOT NULL,
    started_at DATETIME(3) NOT NULL,
    answered_at DATETIME(3) NULL,
    connected_at DATETIME(3) NULL,
    ended_at DATETIME(3) NULL,
    end_reason VARCHAR(40) NULL,
    duration_seconds INT UNSIGNED NOT NULL DEFAULT 0,
    CONSTRAINT pk_call_sessions PRIMARY KEY (id),
    CONSTRAINT uq_call_sessions_uuid UNIQUE (call_uuid),
    CONSTRAINT fk_call_sessions_caller FOREIGN KEY (caller_id)
        REFERENCES users(id),
    CONSTRAINT fk_call_sessions_receiver FOREIGN KEY (receiver_id)
        REFERENCES users(id),
    INDEX idx_call_sessions_caller_started (caller_id, started_at),
    INDEX idx_call_sessions_receiver_started (receiver_id, started_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
