const navToggle = document.querySelector('.nav-toggle');
const navLinks = document.querySelectorAll('.nav__link')    // This variable will create a note list, finding all the nav links

navToggle.addEventListener('click', () => {         // When we click we want to use a function
    document.body.classList.toggle('nav-open');     // So whenever we click the burger button it should add that class (nav-open) to open the nav-button 
}); 


// Basically for each link we'll be creating an event listener for a click
navLinks.forEach(link => {  
    link.addEventListener('click', () => {           // Again when the user clicks a function is used, instead of toggling nav-open it will remove it from the class list, just in case its clicked or activated off screen, we don't want it to open
        document.body.classList.remove('nav-open');
    })
})

