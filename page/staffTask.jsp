<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Staff Tasks</title>
</head>
<body style="font-family: Arial, sans-serif; background: #f4f4f4; margin: 0; padding: 20px;">

    <div style="max-width: 900px; margin: auto; background: #fff; padding: 30px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
        <h1 style="text-align: center; margin-bottom: 30px;">Staff Task Management</h1>

        <!-- Task Form (Add/Edit) -->
        <c:if test="${param.action == 'new' || param.action == 'edit'}">
            <h2>${empty task ? 'Add New Task' : 'Edit Task'}</h2>
            <form action="staffTask?action=${empty task ? 'add' : 'update'}" method="post" style="margin-bottom: 30px;">

                <c:if test="${not empty task}">
                    <input type="hidden" name="id" value="${task.taskId}" />
                </c:if>

                <div style="margin-bottom: 15px;">
                    <label>Title:</label><br />
                    <input type="text" name="title" value="${task.title}" required style="width: 100%; padding: 8px;" />
                </div>

                <div style="margin-bottom: 15px;">
                    <label>Description:</label><br />
                    <textarea name="description" rows="3" style="width: 100%; padding: 8px;">${task.description}</textarea>
                </div>

                <div style="margin-bottom: 15px;">
                    <label>Assigned To (Staff ID):</label><br />
                    <input type="number" name="assignedTo" value="${task.assignedTo}" required style="width: 100%; padding: 8px;" />
                </div>

                <div style="margin-bottom: 15px;">
                    <label>Assigned By (Staff ID):</label><br />
                    <input type="number" name="assignedBy" value="${task.assignedBy}" required style="width: 100%; padding: 8px;" />
                </div>

                <div style="margin-bottom: 15px;">
                    <label>Due Date:</label><br />
                    <input type="date" name="dueDate" value="${task.dueDate}" required style="width: 100%; padding: 8px;" />
                </div>

                <div style="margin-bottom: 15px;">
                    <label>Status:</label><br />
                    <select name="status" style="width: 100%; padding: 8px;">
                        <option value="Pending" ${task.status == 'Pending' ? 'selected' : ''}>Pending</option>
                        <option value="In Progress" ${task.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                        <option value="Completed" ${task.status == 'Completed' ? 'selected' : ''}>Completed</option>
                    </select>
                </div>

                <div style="margin-bottom: 15px;">
                    <label>Priority:</label><br />
                    <select name="priority" style="width: 100%; padding: 8px;">
                        <option value="Low" ${task.priority == 'Low' ? 'selected' : ''}>Low</option>
                        <option value="Medium" ${task.priority == 'Medium' ? 'selected' : ''}>Medium</option>
                        <option value="High" ${task.priority == 'High' ? 'selected' : ''}>High</option>
                    </select>
                </div>

                <div style="margin-bottom: 15px;">
                    <label>Progress (%):</label><br />
                    <input type="number" name="progress" value="${task.progress}" min="0" max="100" style="width: 100%; padding: 8px;" />
                </div>

                <c:if test="${not empty task}">
                    <div style="margin-bottom: 15px;">
                        <label>Created At:</label><br />
                        <input type="text" readonly value="${task.createdAt}" style="width: 100%; padding: 8px; background-color: #eee;" />
                    </div>

                    <div style="margin-bottom: 15px;">
                        <label>Completed At:</label><br />
                        <input type="text" readonly value="${task.completedAt}" style="width: 100%; padding: 8px; background-color: #eee;" />
                    </div>

                    <div style="margin-bottom: 15px;">
                        <label>Last Updated At:</label><br />
                        <input type="text" readonly value="${task.lastUpdatedAt}" style="width: 100%; padding: 8px; background-color: #eee;" />
                    </div>
                </c:if>

                <button type="submit" style="padding: 10px 20px; background: #28a745; color: white; border: none; border-radius: 6px;">Save</button>
                <a href="staffTask" style="padding: 10px 20px; background: #dc3545; color: white; text-decoration: none; border-radius: 6px;">Cancel</a>
            </form>
        </c:if>

        <!-- Task List Table -->
        <h2>Task List</h2>
        <a href="staffTask?action=new" style="display: inline-block; margin-bottom: 10px; background: #007bff; color: white; padding: 8px 14px; text-decoration: none; border-radius: 5px;">Add Task</a>

        <table border="1" cellpadding="10" cellspacing="0" style="width: 100%; border-collapse: collapse; background-color: #fff;">
            <tr style="background-color: #f1f1f1;">
                <th>ID</th>
                <th>Title</th>
                <th>Assigned To</th>
                <th>Status</th>
                <th>Priority</th>
                <th>Due Date</th>
                <th>Progress</th>
                <th>Actions</th>
            </tr>
            <c:forEach items="${taskList}" var="task">
                <tr>
                    <td>${task.taskId}</td>
                    <td>${task.title}</td>
                    <td>${task.assignedTo}</td>
                    <td>${task.status}</td>
                    <td>${task.priority}</td>
                    <td>${task.dueDate}</td>
                    <td>${task.progress}%</td>
                  <td>
    <a href="staffTask?action=edit&id=${task.taskId}" 
       style="background-color: #007bff; color: white; padding: 6px 12px; text-decoration: none; border-radius: 4px; margin-right: 6px;">
       Edit
    </a>
    
    <a href="staffTask?action=delete&id=${task.taskId}" 
       onclick="return confirm('Delete this task?')" 
       style="background-color: #dc3545; color: white; padding: 6px 12px; text-decoration: none; border-radius: 4px;">
       Delete
    </a>
</td>

                </tr>
            </c:forEach>
        </table>
    </div>

</body>
</html>
