CREATE PROCEDURE sp_manage_student
    @Action NVARCHAR(10),               -- Action to be performed (INSERT, SELECT, UPDATE, DELETE)
    @StudentID INT = NULL,              -- Student ID (required for UPDATE and DELETE)
    @StudentName NVARCHAR(50) = NULL,   -- Name of the student
    @Age INT = NULL,                    -- Age of the student
    @Address NVARCHAR(100) = NULL,      -- Address of the student
    @Class NVARCHAR(20) = NULL          -- Class or grade of the student
AS
BEGIN
    SET NOCOUNT ON;

    IF @Action = 'INSERT'
    BEGIN
        INSERT INTO student (studentid, studentname, age, address, class)
        VALUES (@StudentID, @StudentName, @Age, @Address, @Class);
        PRINT 'Record inserted successfully';
    END
    ELSE IF @Action = 'SELECT'
    BEGIN
        IF @StudentID IS NULL
            SELECT * FROM student;  -- Select all records if no StudentID is provided
        ELSE
            SELECT * FROM student WHERE studentid = @StudentID;  -- Select a specific record
    END
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE student
        SET studentname = @StudentName,
            age = @Age,
            address = @Address,
            class = @Class
        WHERE studentid = @StudentID;
        PRINT 'Record updated successfully';
    END
    ELSE IF @Action = 'DELETE'
    BEGIN
        DELETE FROM student WHERE studentid = @StudentID;
        PRINT 'Record deleted successfully';
    END
    ELSE
    BEGIN
        PRINT 'Invalid action specified. Use INSERT, SELECT, UPDATE, or DELETE.';
    END
END;

GO

