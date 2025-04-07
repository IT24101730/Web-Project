// category-management.js - Client-side functionality for category management

document.addEventListener('DOMContentLoaded', function() {
    // Initialize functionality when the DOM is fully loaded
    initializeCategoryManagement();
});

function initializeCategoryManagement() {
    // Add event listeners for form validation
    setupFormValidation();

    // Add confirmation for category deletion (if implemented)
    setupDeleteConfirmations();

    // Add any other interactive elements
    setupInteractiveElements();
}

function setupFormValidation() {
    const form = document.querySelector('form');
    if (form) {
        form.addEventListener('submit', function(event) {
            if (!validateCategoryForm()) {
                event.preventDefault(); // Prevent form submission if validation fails
            }
        });
    }
}

function validateCategoryForm() {
    const nameInput = document.getElementById('name');
    const subcategoriesInput = document.getElementById('subcategories');
    let isValid = true;

    // Clear previous error messages
    clearErrorMessages();

    // Validate category name
    if (!nameInput.value.trim()) {
        displayErrorMessage(nameInput, 'Category name is required');
        isValid = false;
    } else if (nameInput.value.trim().length < 2) {
        displayErrorMessage(nameInput, 'Category name must be at least 2 characters');
        isValid = false;
    }

    // Validate subcategories
    if (!subcategoriesInput.value.trim()) {
        displayErrorMessage(subcategoriesInput, 'At least one subcategory is required');
        isValid = false;
    } else {
        const subcategories = subcategoriesInput.value.split(',');
        if (subcategories.some(sub => !sub.trim())) {
            displayErrorMessage(subcategoriesInput, 'Subcategories cannot be empty');
            isValid = false;
        }
    }

    return isValid;
}

function displayErrorMessage(inputElement, message) {
    const errorElement = document.createElement('div');
    errorElement.className = 'error-message';
    errorElement.style.color = 'red';
    errorElement.style.fontSize = '0.8em';
    errorElement.style.marginTop = '5px';
    errorElement.textContent = message;

    // Insert after the input element
    inputElement.parentNode.insertBefore(errorElement, inputElement.nextSibling);

    // Highlight the input field
    inputElement.style.borderColor = 'red';
}

function clearErrorMessages() {
    // Remove all error messages
    const errorMessages = document.querySelectorAll('.error-message');
    errorMessages.forEach(msg => msg.remove());

    // Reset input borders
    const inputs = document.querySelectorAll('input');
    inputs.forEach(input => {
        input.style.borderColor = '';
    });
}

function setupDeleteConfirmations() {
    // If you implement delete functionality later, add confirmation dialogs
    const deleteButtons = document.querySelectorAll('.delete-category');
    deleteButtons.forEach(button => {
        button.addEventListener('click', function(event) {
            if (!confirm('Are you sure you want to delete this category?')) {
                event.preventDefault();
            }
        });
    });
}

function setupInteractiveElements() {
    // Add any interactive elements like search/filter functionality
    const searchInput = document.getElementById('search-categories');
    if (searchInput) {
        searchInput.addEventListener('input', function() {
            filterCategories(this.value.toLowerCase());
        });
    }
}

function filterCategories(searchTerm) {
    const rows = document.querySelectorAll('table tr:not(:first-child)');

    rows.forEach(row => {
        const categoryName = row.cells[0].textContent.toLowerCase();
        const subcategories = row.cells[1].textContent.toLowerCase();

        if (categoryName.includes(searchTerm) || subcategories.includes(searchTerm)) {
            row.style.display = '';
        } else {
            row.style.display = 'none';
        }
    });
}

// Function to enhance the subcategories input with tag-like functionality
function enhanceSubcategoriesInput() {
    const subcategoriesInput = document.getElementById('subcategories');
    if (subcategoriesInput) {
        const tagsContainer = document.createElement('div');
        tagsContainer.className = 'tags-container';
        subcategoriesInput.parentNode.insertBefore(tagsContainer, subcategoriesInput);

        subcategoriesInput.addEventListener('keydown', function(event) {
            if (event.key === 'Enter' || event.key === ',') {
                event.preventDefault();
                addTag(this.value.trim());
                this.value = '';
            }
        });

        subcategoriesInput.addEventListener('blur', function() {
            if (this.value.trim()) {
                addTag(this.value.trim());
                this.value = '';
            }
        });
    }
}

function addTag(tagText) {
    if (!tagText) return;

    const tagsContainer = document.querySelector('.tags-container');
    const subcategoriesInput = document.getElementById('subcategories');

    const tag = document.createElement('span');
    tag.className = 'tag';
    tag.textContent = tagText;

    const removeBtn = document.createElement('span');
    removeBtn.className = 'remove-tag';
    removeBtn.textContent = '×';
    removeBtn.addEventListener('click', function() {
        tag.remove();
        updateHiddenInput();
    });

    tag.appendChild(removeBtn);
    tagsContainer.appendChild(tag);
    updateHiddenInput();
}

function updateHiddenInput() {
    const tags = document.querySelectorAll('.tag');
    const subcategories = Array.from(tags).map(tag =>
        tag.textContent.replace('×', '').trim()
    );
    document.getElementById('subcategories').value = subcategories.join(',');
}

// Initialize the enhanced input when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    enhanceSubcategoriesInput();
});