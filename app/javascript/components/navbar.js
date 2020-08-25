const navSlide = () => {
	const toggleBtn = document.querySelector('.toggle-btn');
	const nav = document.querySelector('.nav-menu');
	const navMenu = document.querySelectorAll('.nav-menu > li');
	toggleBtn.addEventListener('click', () => {
		//Toggle NavBar
		nav.classList.toggle('nav-active');
		//Animate List
		navMenu.forEach((link, index) => {
			if (link.style.animation) {
				link.style.animation = '';
			} else {
				link.style.animation = `navMenuFadeIn 0.5s ease forwards ${index / 5 + 0.6}s`;
			}
		});
		//Animate Menu Button
		toggleBtn.classList.toggle('toggle');
	});
}

export{navSlide};
