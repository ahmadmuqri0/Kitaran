/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// Create toast container if it doesn't exist
function getToastContainer() {
    let container = document.querySelector('.toast-container');
    if (!container) {
        container = document.createElement('div');
        container.className = 'toast-container';
        document.body.appendChild(container);
    }
    return container;
}

// Icon mapping for different toast types
const toastIcons = {
    error: '✕',
    success: '✓',
    warning: '⚠',
    info: 'ℹ'
};

/**
 * Show a toast notification
 * @param {string} message - The message to display
 * @param {string} type - Type of toast: 'error', 'success', 'warning', or 'info'
 * @param {number} duration - Duration in milliseconds (default: 4000)
 */
function showToast(message, type = 'info', duration = 4000) {
    const container = getToastContainer();
    
    // Create toast element
    const toast = document.createElement('div');
    toast.className = `toast toast-${type}`;
    
    // Create icon
    const icon = document.createElement('span');
    icon.className = 'toast-icon';
    icon.textContent = toastIcons[type] || toastIcons.info;
    
    // Create message
    const messageEl = document.createElement('span');
    messageEl.className = 'toast-message';
    messageEl.textContent = message;
    
    const toastIcons = {
    error: '✕',    // Or use '✕'
    success: '✓',  // Or use '✓'
    warning: '!',  // Or use '⚠'
    info: 'i'      // Or use 'ℹ'
};
    
    
    // Create close button
    const closeBtn = document.createElement('button');
    closeBtn.className = 'toast-close';
    closeBtn.innerHTML = '×';
    closeBtn.onclick = () => removeToast(toast);
    
    // Assemble toast
    toast.appendChild(icon);
    toast.appendChild(messageEl);
    toast.appendChild(closeBtn);
    
    // Add to container
    container.appendChild(toast);
    
    // Auto-remove after duration
    if (duration > 0) {
        setTimeout(() => removeToast(toast), duration);
    }
    
    return toast;
}

/**
 * Remove a toast with animation
 * @param {HTMLElement} toast - The toast element to remove
 */
function removeToast(toast) {
    toast.classList.add('hiding');
    setTimeout(() => {
        if (toast.parentNode) {
            toast.parentNode.removeChild(toast);
        }
    }, 300); // Match animation duration
}

// Convenience methods
function showError(message, duration) {
    return showToast(message, 'error', duration);
}

function showSuccess(message, duration) {
    return showToast(message, 'success', duration);
}

function showWarning(message, duration) {
    return showToast(message, 'warning', duration);
}

function showInfo(message, duration) {
    return showToast(message, 'info', duration);
}

