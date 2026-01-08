
let currentEditId = null;


function handleLogin(event) {
    event.preventDefault();
    const user = document.getElementById('username').value;
    if (user) {
        localStorage.setItem('currentUser', user);
        window.location.href = (user.toLowerCase() === 'admin') ? 'admin.jsp' : 'dashboard.jsp';
    }
}


function submitRecycle(event) {
    event.preventDefault();
    const type = document.getElementById('type').value;
    const item = document.getElementById('item').value;
    const address = document.getElementById('address').value;

    const newEntry = {
        id: Date.now(),
        user: localStorage.getItem('currentUser'),
        type, item, address,
        weight: 0,
        penalty: 0,
        status: 'Pending',
        date: new Date().toLocaleDateString()
    };

    const history = JSON.parse(localStorage.getItem('recycleHistory')) || [];
    history.unshift(newEntry);
    localStorage.setItem('recycleHistory', JSON.stringify(history));
    window.location.href = 'dashboard.html';
}


function loadAdminPanel(filter = 'all') {
    const history = JSON.parse(localStorage.getItem('recycleHistory')) || [];
    const tableBody = document.getElementById('admin-table-body');
    const totalWeightDisplay = document.getElementById('total-weight-all');

    tableBody.innerHTML = '';
    let totalSystemWeight = 0;

    const filteredData = history.filter(entry => {
        if (filter === 'pending')
            return entry.status === 'Pending';
        if (filter === 'verified')
            return entry.status === 'Verified' && entry.penalty == 0;
        if (filter === 'penalty')
            return entry.penalty > 0;
        return true;
    });

    document.querySelectorAll('.filter-btn').forEach(btn => btn.classList.remove('active'));
    document.getElementById(`btn-${filter}`).classList.add('active');

    filteredData.forEach((entry) => {
        if (entry.status === 'Verified')
            totalSystemWeight += parseFloat(entry.weight);

        let weightInput = entry.status === 'Verified'
                ? `${entry.weight} kg`
                : `<input type="number" id="weight-${entry.id}" style="width:70px; padding:5px; margin:0;" placeholder="kg">`;

        let actionBtn = entry.status === 'Verified'
                ? `<span class="badge badge-verified">Done</span>`
                : `<button onclick="approveItem(${entry.id})" class="badge badge-verified" style="border:none; cursor:pointer;">Tick ✓</button>`;

        let penaltyBtn = entry.penalty > 0
                ? `<span class="badge badge-penalty">RM${entry.penalty}</span>`
                : (entry.status === 'Verified' ? '-' : `<button onclick="openPenaltyModal(${entry.id})" class="badge badge-penalty" style="border:none; cursor:pointer;">Penalty</button>`);

        const row = `<tr>
            <td><b>${entry.user}</b><br><span style="font-size:0.8rem; color:#888">${entry.address}</span></td>
            <td>${entry.type}</td>
            <td>${entry.item}</td>
            <td>${weightInput}</td>
            <td>${penaltyBtn}</td>
            <td>${actionBtn}</td>
        </tr>`;
        tableBody.innerHTML += row;
    });

    totalWeightDisplay.innerText = totalSystemWeight.toFixed(1) + ' kg';
}

function openPenaltyModal(id) {
    currentEditId = id;
    document.getElementById('penaltyModal').style.display = 'flex';
}

function closePenaltyModal() {
    document.getElementById('penaltyModal').style.display = 'none';
    document.getElementById('wrong-weight').value = '';
}

function confirmPenalty() {
    const wrongWeight = parseFloat(document.getElementById('wrong-weight').value);

    if (!wrongWeight || wrongWeight <= 0)
        return alert("Please fill in the miss-categorized weight");

    const penaltyCost = (wrongWeight * 0.50).toFixed(2); // STRING

    let history = JSON.parse(localStorage.getItem('recycleHistory'));
    const index = history.findIndex(x => x.id === currentEditId);

    if (index !== -1) {
        history[index].weight = wrongWeight;
        history[index].status = 'Verified';
        history[index].points = 0;
        history[index].penalty = penaltyCost;

        localStorage.setItem('recycleHistory', JSON.stringify(history));
        closePenaltyModal();
        loadAdminPanel();
    }
}


function approveItem(id) {
    const weightVal = document.getElementById(`weight-${id}`).value;
    if (!weightVal)
        return alert("Enter weight");

    let history = JSON.parse(localStorage.getItem('recycleHistory'));
    const index = history.findIndex(x => x.id === id);

    if (index !== -1) {
        history[index].weight = weightVal;
        history[index].status = 'Verified';
        history[index].penalty = 0;
        localStorage.setItem('recycleHistory', JSON.stringify(history));
        loadAdminPanel();
    }
}

function resetSystem() {
    if (confirm(" RESET DEMO SYSTEM?\n\nThis will delete all User Data.\nClick OK to restart.")) {
        localStorage.clear();
        window.location.href = 'login.html';
    }
}

function loadUserDashboard() {
    const user = localStorage.getItem('currentUser');
    if (!user)
        window.location.href = 'login.html';
    document.getElementById('username-display').innerText = user;

    const history = JSON.parse(localStorage.getItem('recycleHistory')) || [];
    const myData = history.filter(x => x.user === user);

    const tableBody = document.getElementById('user-table');
    const billAmount = document.getElementById('bill-amount');
    const paySection = document.getElementById('pay-section');

    tableBody.innerHTML = '';
    let totalMyWeight = 0;
    let totalPenalty = 0.00;

    myData.forEach(entry => {
        if (entry.weight > 0)
            totalMyWeight += parseFloat(entry.weight);


        if (entry.penalty > 0) {
            totalPenalty += parseFloat(entry.penalty);
        }

        const statusClass = entry.status === 'Pending' ? 'badge-pending' : 'badge-verified';
        const penaltyTxt = entry.penalty > 0 ? `<span style="color:var(--red)">RM${entry.penalty}</span>` : '-';

        tableBody.innerHTML += `<tr>
            <td>${entry.type}</td>
            <td>${entry.item}</td>
            <td>${entry.status === 'Pending' ? '-' : entry.weight + 'kg'}</td>
            <td>${penaltyTxt}</td>
            <td><span class="badge ${statusClass}">${entry.status}</span></td>
        </tr>`;
    });

    document.getElementById('total-weight').innerText = totalMyWeight.toFixed(1) + " kg";

    if (totalPenalty > 0) {
        billAmount.innerText = `RM ${totalPenalty.toFixed(2)}`;
        paySection.style.display = 'block';

        localStorage.setItem('pendingPaymentAmount', totalPenalty.toFixed(2));
    } else {
        billAmount.innerText = "RM 0.00";
        paySection.style.display = 'none';
        localStorage.removeItem('pendingPaymentAmount');
    }
}

function payBill() {

    window.location.href = 'payment.html';
}

function loadPaymentPage() {
    const amount = localStorage.getItem('pendingPaymentAmount');
    if (!amount) {
        alert("No payment due.");
        window.location.href = 'dashboard.html';
    }
    document.getElementById('pay-display').innerText = `RM ${amount}`;
}

function processPayment() {
    const user = localStorage.getItem('currentUser');
    let history = JSON.parse(localStorage.getItem('recycleHistory'));

    history.forEach(item => {
        if (item.user === user && item.penalty > 0) {
            item.penalty = 0;
        }
    });

    localStorage.setItem('recycleHistory', JSON.stringify(history));

    alert("Payment Successful! Redirecting...");
    window.location.href = 'dashboard.html';
}

function cancelPayment() {
    window.location.href = 'dashboard.html';
}

function logout() {
    localStorage.removeItem('currentUser');
    window.location.href = 'login.jsp';
}