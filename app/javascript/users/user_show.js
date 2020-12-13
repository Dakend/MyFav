document.addEventListener('turbolinks:load', () => {
    
    if (document.querySelectorAll('label.tab-item').length == 1) {
        document.getElementsByClassName('tab-item')[0].style.width = '100%';
    }

    const modalProfileOpen = document.getElementById('profile-info-edit');

    if (modalProfileOpen != null) {

        const modalProfileCancel = document.getElementById('modal-profile-form-cancel');
        const modalProfileForm = document.getElementById('modal-profile-form');
        const modalProfileMask = document.getElementById('modal-profile-mask');
        const userIcon = document.getElementById('user_icon');

        modalProfileOpen.addEventListener('click', () => {
            modalProfileForm.classList.add('active');
            modalProfileMask.classList.add('active');
        });
        modalProfileCancel.addEventListener('click', () => {
            modalProfileForm.classList.remove('active');
            modalProfileMask.classList.remove('active');
        });
        userIcon.addEventListener('change', (e) => {
            let file = e.target.files[0];
            let blobUrl = window.URL.createObjectURL(file);
            let img = document.getElementById('icon-preview');
            img.src = blobUrl;
        });
    }

 });