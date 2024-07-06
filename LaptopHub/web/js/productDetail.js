const mainSrc = document.querySelector('.mainImg').getAttribute('src');
function changeMainImage(event) {
    const subImg = event.target; // Hình ảnh `subImg` được di chuột qua
    const main = document.querySelector('.mainImg'); // Hình ảnh `mainImg`

    // Lấy đường dẫn từ hình ảnh `subImg`
    const newSrc = subImg.getAttribute('src');

    // Gán đường dẫn mới cho hình ảnh `mainImg`
    main.setAttribute('src', newSrc);
}

function returnImage(event){
    const main = document.querySelector('.mainImg');
    main.setAttribute('src', mainSrc);
}


    const images = document.querySelectorAll('.subImg');
    const nextButton = document.getElementById('nextButton');
    const backButton = document.getElementById('backButton');
    let currentIndex = 0;

    // Hiển thị 5 hình ảnh ban đầu
    function showInitialImages() {
        for (let i = 0; i < 4; i++) {
            images[i].style.display = 'flex'; // Hiển thị
        }
    }

    // Ẩn tất cả hình ảnh
    function hideAllImages() {
        images.forEach(img => {
            img.style.display = 'none';
        });
    }

    // Xử lý khi người dùng ấn vào nút mũi tên
    nextButton.addEventListener('click', () => {
        hideAllImages();
        currentIndex = (currentIndex + 1) % images.length;
        for (let i = currentIndex; i < currentIndex + 4; i++) {
            images[i % images.length].style.display = 'flex'; // Hiển thị
        }
    });
    
    backButton.addEventListener('click', () => {
        hideAllImages();
        
        if(currentIndex===0){
            showInitialImages();
        }else{
            currentIndex = (currentIndex - 1) % images.length;
            for (let i = currentIndex; i < currentIndex + 4; i++) {
                images[i % images.length].style.display = 'flex'; // Hiển thị
            }
        }
    });

    hideAllImages();
    showInitialImages();
    
    function increaseQuantity() {
        const input = document.getElementById('quantityInput');
        const currentValue = parseInt(input.value);
        input.value = currentValue + 1;
    }

    function decreaseQuantity() {
        const input = document.getElementById('quantityInput');
        const currentValue = parseInt(input.value);
        if (currentValue > 1) {
            input.value = currentValue - 1;
        }
    }

    // Hiển thị 5 hình ảnh ban đầu khi tải trang
    
const percentage = Math.round((value / max) * 100);
document.querySelector('.overlay').style.width = `${100 - percentage}%`;