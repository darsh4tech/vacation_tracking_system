-- Steps
INSERT INTO approval_workflow_steps VALUES
(1, 'Request Submitted'),
(2, 'Manager Approval'),
(3, 'HR Review');

-- Statuses
INSERT INTO request_statuses VALUES
(1, 'PENDING', 'Pending'),
(2, 'APPROVED', 'Manager Approved'),
(3, 'REJECTED', 'Manager Rejected'),
(4, 'HR_APPROVED', 'HR Approved'),
(5, 'HR_REJECTED', 'HR Rejected');

-- Workflow Transitions
INSERT INTO workflow_transitions VALUES
(1, 1, 1, 2),   -- Pending → Manager
(2, 2, 2, 3),   -- Manager Approved → HR
(3, 2, 3, NULL),-- Manager Rejected → End
(4, 3, 4, NULL),-- HR Approved → End
(5, 3, 5, NULL);-- HR Rejected → End