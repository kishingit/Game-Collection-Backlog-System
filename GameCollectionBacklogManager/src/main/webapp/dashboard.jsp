<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Player Dashboard - Game Backlog Manager</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500;700;900&family=Rajdhani:wght@500;600;700&display=swap" rel="stylesheet">
    <style>
        .action-btn {
            background: transparent;
            border: 1px solid rgb(221, 34, 34);
            color: cyan;
            padding: 4px 10px;
            cursor: pointer;
            border-radius: 4px;
            font-family: 'Rajdhani', sans-serif;
            font-weight: 700;
            margin-right: 5px;
            transition: all 0.2s ease;
        }
        .action-btn:hover {
            background: rgb(22, 68, 195);
            color: #0d0f18;
            box-shadow: 0 0 8px cyan;
        }
        .action-btn.delete-btn {
            border-color: #ff0055;
            color: #ff0055;
        }
        .action-btn.delete-btn:hover {
            background: #ff0055;
            color: #fff;
            box-shadow: 0 0 8px #ff0055;
        }
        .action-btn.save-btn {
            border-color: #00ff66;
            color: #00ff66;
        }
        .action-btn.save-btn:hover {
            background: #00ff66;
            color: #0d0f18;
            box-shadow: 0 0 8px #00ff66;
        }
        .edit-input, .edit-select {
            background: #141824;
            border: 1px solid cyan;
            color: #fff;
            padding: 4px;
            border-radius: 4px;
            font-family: 'Rajdhani', sans-serif;
            width: 90%;
        }
    </style>
</head>
<body class="dashboard-body">
    <div class="dashboard-container">
        <!-- Header -->
        <header class="dashboard-header">
            <div class="logo">GAME<span>LOG</span></div>
            <div class="user-badge">
                <span>PLAYER: <strong>Harshit</strong></span>
                <a href="login.jsp" class="btn btn-logout" style="text-decoration:none;">LOGOUT</a>
            </div>
        </header>

        <!-- Main Dashboard Content -->
        <main class="dashboard-main">
            <!-- Add Game Section -->
            <section class="card add-game-card">
                <h2>Add New Title</h2>
                <form id="addGameForm" class="add-game-form" action="add-game" method="POST">
                    <div class="input-group">
                        <label for="gameTitle">TITLE</label>
                        <input type="text" id="gameTitle" name="title" placeholder="Game title..." required>
                    </div>
                    <div class="input-group">
                        <label for="gamePlatform">PLATFORM</label>
                        <input type="text" id="gamePlatform" name="platform" placeholder="PC, PS5, Switch..." required>
                    </div>
                    <div class="input-group">
                        <label for="gameStatus">STATUS</label>
                        <select id="gameStatus" name="status" class="styled-select">
                            <option value="BACKLOG">BACKLOG</option>
                            <option value="PLAYING">PLAYING</option>
                            <option value="COMPLETED">COMPLETED</option>
                            <option value="ABANDONED">ABANDONED</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">+ ADD TO BACKLOG</button>
                </form>
            </section>

            <!-- Game Collection List -->
            <section class="card collection-card">
                <h2>Your Collection</h2>
                <div class="game-list">
                    <table class="game-table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>TITLE</th>
                                <th>PLATFORM</th>
                                <th>STATUS</th>
                                <th>ACTIONS</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td class="game-title-cell"><strong>Elden Ring</strong></td>
                                <td class="game-platform-cell"><span class="platform-badge">PC</span></td>
                                <td class="game-status-cell"><span class="status-tag status-playing">PLAYING</span></td>
                                <td>
                                    <button type="button" class="action-btn edit-btn">Edit</button>
                                    <button type="button" class="action-btn delete-btn">Delete</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
        </main>
    </div>

    <script>
        // Edit and Delete Handler for table rows
        document.querySelector(".game-table tbody").addEventListener("click", function (e) {
            const target = e.target;
            const row = target.closest("tr");

            if (target.classList.contains("delete-btn")) {
                row.remove();
                return;
            }

            if (target.classList.contains("edit-btn")) {
                const titleCell = row.querySelector(".game-title-cell");
                const platformCell = row.querySelector(".game-platform-cell");
                const statusCell = row.querySelector(".game-status-cell");

                const isEditing = target.classList.contains("save-btn");

                if (!isEditing) {
                    const currentTitle = titleCell.textContent.trim();
                    const currentPlatform = platformCell.textContent.trim();
                    const currentStatus = statusCell.textContent.trim();

                    titleCell.innerHTML = `<input type="text" class="edit-input title-input" value="${currentTitle}">`;
                    platformCell.innerHTML = `<input type="text" class="edit-input platform-input" value="${currentPlatform}">`;
                    statusCell.innerHTML = `
                        <select class="edit-select status-select">
                            <option value="BACKLOG" ${currentStatus === 'BACKLOG' ? 'selected' : ''}>BACKLOG</option>
                            <option value="PLAYING" ${currentStatus === 'PLAYING' ? 'selected' : ''}>PLAYING</option>
                            <option value="COMPLETED" ${currentStatus === 'COMPLETED' ? 'selected' : ''}>COMPLETED</option>
                            <option value="ABANDONED" ${currentStatus === 'ABANDONED' ? 'selected' : ''}>ABANDONED</option>
                        </select>
                    `;

                    target.textContent = "Save";
                    target.classList.add("save-btn");
                } else {
                    const newTitle = titleCell.querySelector(".title-input").value.trim();
                    const newPlatform = platformCell.querySelector(".platform-input").value.trim();
                    const newStatus = statusCell.querySelector(".status-select").value;

                    if (!newTitle || !newPlatform) return;

                    titleCell.innerHTML = `<strong>${newTitle}</strong>`;
                    platformCell.innerHTML = `<span class="platform-badge">${newPlatform}</span>`;
                    statusCell.innerHTML = `<span class="status-tag status-${newStatus.toLowerCase()}">${newStatus}</span>`;

                    target.textContent = "Edit";
                    target.classList.remove("save-btn");
                }
            }
        });
    </script>
</body>
</html>