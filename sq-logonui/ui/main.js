let show = false

window.addEventListener('message', (evt) => {
    if (evt.data.type === 'logoShow') {
        $('.Container').fadeIn();
        document.querySelector(".MyID").textContent = 'ID: ' + evt.data.me
        show = true
    } else if(evt.data.type === 'UpdatePlayersCount') {
        RefreshTime()
        document.querySelector(".PlayerCount").textContent = 'Players: ' + evt.data.Players.length
        document.querySelector(".Time").textContent = currentTime
        document.querySelector(".Time2").innerHTML = `<i class="fa-solid fa-clock"></i> ${currentTime}`
    }
});





function RefreshTime() {
    const now = new Date();
    let hours = now.getHours();
    let minutes = now.getMinutes();
    
    hours = hours < 10 ? '0' + hours : hours;
    minutes = minutes < 10 ? '0' + minutes : minutes;
    
    currentTime = `${hours}:${minutes}`;

    if(minutes == '00' && show) {
        $('.Container').animate({
            left: '-1000px'
        }, 1000);
        $('.Container').fadeOut();
        $('.TimeContainer').fadeIn();
        $('.TimeContainer').animate({
            left: '8px'
        }, 1000);

        setTimeout(function() {
            $('.TimeContainer').animate({
                left: '-1000px'
            }, 1000);
            $('.TimeContainer').fadeOut();
            $('.Container').fadeIn();
            $('.Container').animate({
                left: '8px'
            }, 1000);
        }, 5000);
    }
}