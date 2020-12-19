document.addEventListener('turbolinks:load', () => {

    const modalPostOpen = document.getElementById('modal-post-open');
    const modalPostCancel = document.getElementById('modal-post-cancel');
    const modalPostForm = document.getElementById('modal-post-form');
    const modalPostMask = document.getElementById('modal-post-mask');
    const formBtnPost = document.getElementById('form-btn-post');
    const scroll = () => {
        let element = document.getElementById('modal-post-form__header');    
        element.scrollIntoView(true);
    };
    
    modalPostOpen.addEventListener('click', () => {
        modalPostForm.classList.add('active');
        modalPostMask.classList.add('active');
    });

    modalPostCancel.addEventListener('click', () => {
        modalPostForm.classList.remove('active');
        modalPostMask.classList.remove('active');
        scroll();
    });
});