const likeBtn = document.querySelectorAll(".like__btn");

likeBtn.forEach(function (item) {
    let likeIcon = item.querySelector(".icon");
    let count = item.querySelector(".count");
    let clicked=false;
    item.addEventListener("click", (event) => {

        
        if (!clicked) {
            clicked = true;
            likeIcon.innerHTML = `<i class="fas fa-thumbs-up"></i>`;
            count.textContent++;
        } else {
            clicked = false;
            likeIcon.innerHTML = `<i class="far fa-thumbs-up"></i>`;
            count.textContent--;
        }
    });
});

const likeBtnDis = document.querySelectorAll(".like__btn_diabled");

likeBtnDis.forEach(function (item) {
    let likeIcon = item.querySelector(".icon");
    let count = item.querySelector(".count");
    let clicked=true;
    item.addEventListener("click", (event) => {

        
        if (clicked===true) {
             clicked = false;
            likeIcon.innerHTML = `<i class="far fa-thumbs-up"></i>`;
            
            count.textContent--;
           
        } else {
             clicked = true;
            likeIcon.innerHTML = `<i class="fas fa-thumbs-up"></i>`;
            count.textContent++;
            
           
        }
    });
});


function filled(item)
{    let likeIcon = item.querySelector(".icon");
     likeIcon.innerHTML = `<i class="far fa-thumbs-up"></i>`;
}



