/** Starts auth for the main user */
function start_auth() {
    setTimeout(function() {
        lightdm.start_authentication("blackbracken");
    }, 1000);
}

/**
 * Start listeners; init page
 */
function init() {
    /** Auth on enter */
	document.getElementById("pass").addEventListener("keyup", function(event) {
	    event.preventDefault();
    	if (event.keyCode === 13) {
        	auth();
    	}
	});

    /** Shutdown button */
    document.getElementById('shutdown').addEventListener('click', function(event) {
        lightdm.shutdown();
    });

    /** Restart button */
    document.getElementById('restart').addEventListener('click', function(event) {
        lightdm.restart();
    });

    /** Suspend button */
    document.getElementById('suspend').addEventListener('click', function(event) {
        lightdm.suspend();
    });

    /** Starts auth process for main user */
    start_auth();
}

/** (Probably) required by lightdm, but we don't use them */
function show_prompt(text, type) {}
function autologin_timer_expired(username) {}

/** Shows error/success message */
function show_message(text, type) {
    var el = document.getElementById('message');
    if(type === "error") {
        el.style.color = "red";
    } else {
        el.style.color = "green";
    }
    el.innerHTML = text;
}

/** Grabs the password and attempts to auth */
function auth() {
    var entry = document.getElementById('pass');
    lightdm.provide_secret(entry.value);
}

/** Callback on auth pass/fail */
function authentication_complete() {
    if (lightdm.is_authenticated) {
        show_message("Correct Password, Logging in", "success");
        lightdm.login (lightdm.authentication_user, 'openbox');
    } else {
        /** Shows error message, starts auth process again */
        show_message("Incorrect Password", "error");
        start_auth();
    }
};

/** Run the setup */
init();
