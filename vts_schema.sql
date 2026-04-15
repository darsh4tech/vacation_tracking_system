-- =========================
-- EMPLOYEES
-- =========================
CREATE TABLE employees (
    id              BIGINT PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    email           VARCHAR(150) UNIQUE NOT NULL,
    manager_id      BIGINT NULL,
    role            VARCHAR(50) NOT NULL, -- EMPLOYEE, MANAGER, HR
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_manager
        FOREIGN KEY (manager_id)
        REFERENCES employees(id)
);

-- =========================
-- REQUEST STATUSES
-- =========================
CREATE TABLE request_statuses (
    id          INT PRIMARY KEY,
    code        VARCHAR(50) UNIQUE NOT NULL,
    name        VARCHAR(100) NOT NULL
);

-- =========================
-- WORKFLOW STEPS
-- =========================
CREATE TABLE approval_workflow_steps (
    id          INT PRIMARY KEY,
    step_name   VARCHAR(100) NOT NULL
);

-- =========================
-- VACATION REQUESTS
-- =========================
CREATE TABLE vacation_requests (
    id              BIGINT PRIMARY KEY,
    employee_id     BIGINT NOT NULL,
    title           VARCHAR(200),
    description     TEXT,
    start_date      DATE,
    end_date        DATE,

    status_id       INT NOT NULL,

    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_employee
        FOREIGN KEY (employee_id)
        REFERENCES employees(id),

    CONSTRAINT fk_status
        FOREIGN KEY (status_id)
        REFERENCES request_statuses(id)
);

-- =========================
-- WORKFLOW TRANSITIONS
-- =========================
CREATE TABLE workflow_transitions (
    id              BIGINT PRIMARY KEY,

    step_id         INT NOT NULL,
    status_id       INT NOT NULL,
    next_step_id    INT NULL,

    CONSTRAINT fk_step
        FOREIGN KEY (step_id)
        REFERENCES approval_workflow_steps(id),

    CONSTRAINT fk_status_transition
        FOREIGN KEY (status_id)
        REFERENCES request_statuses(id),

    CONSTRAINT fk_next_step
        FOREIGN KEY (next_step_id)
        REFERENCES approval_workflow_steps(id)
);