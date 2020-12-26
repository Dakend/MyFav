document.addEventListener('turbolinks:load', () => {

    let leftBtns = document.getElementsByClassName('scroll-left-btn');
    let rightBtns = document.getElementsByClassName('scroll-right-btn');

    for(let i = 0; i < leftBtns.length; i++) {
        leftBtns[i].addEventListener('click', () => {
            let target = document.getElementsByClassName('post-card-block')[i];
            target.scrollLeft -= 800;
        });
    }
    for(let i = 0; i < rightBtns.length; i++) {
        rightBtns[i].addEventListener('click', () => {
            let target = document.getElementsByClassName('post-card-block')[i];
            target.scrollLeft += 800;
        });
    }
});