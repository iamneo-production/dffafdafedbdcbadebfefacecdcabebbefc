const { validateRegistration } = require('../../LoginJS/public/registrationValidation'); // Update the path accordingly
const { validateLogin } = require('../../LoginJS/public/loginValidation'); // Update the path accordingly

describe('Registration Form Validation', () => {
  beforeEach(() => {
    document.body.innerHTML = `
      <div class="container">
      <div class="container">
      <h1>Registration</h1>
      <form id="registrationForm" onsubmit="return validateRegistration();" method="post">
          <label for="username">Username:</label>
          <input type="text" id="username" name="username" required>
          
          <label for="password">Password:</label>
          <input type="password" id="password" name="password" required>
          <span id="passwordValidation" class="validation-message"></span>
          
          <label for="confirmPassword">Confirm Password:</label>
          <input type="password" id="confirmPassword" name="confirmPassword" required>
          <span id="passwordValidation1" class="validation-message"></span>

          
          <label for="role">Role:</label>
          <select id="role" name="role" required>
              <option value="" disabled selected>Select role</option>
              <option value="admin">Admin</option>
              <option value="organizer">Organizer</option>
          </select>
          
          <input type="submit" value="Register">
      </form>
  </div>
      </div>`;
  });

  test('Week4_DAy1_Valid Registration', () => {
    // Mock form inputs
    document.getElementById('username').value = 'validUser';
    document.getElementById('password').value = 'Password1';
    document.getElementById('confirmPassword').value = 'Password1';
    document.getElementById('role').value = 'admin';

    // Mock localStorage
    const localStorageMock = (function() {
      let store = {};
      return {
        getItem: key => store[key],
        setItem: (key, value) => { store[key] = value.toString(); },
        removeItem: key => delete store[key],
        clear: () => store = {}
      };
    })();
    Object.defineProperty(window, 'localStorage', { value: localStorageMock });

    // Mock alert function
    window.alert = jest.fn();

    // Mock window.location.href
    delete window.location;
    window.location = { href: '' };

    // Call the validation function
    validateRegistration();

    // Assertions
    expect(window.alert).toHaveBeenCalledWith('Registration successful!');
    expect(localStorage.getItem('registeredUser')).toEqual(JSON.stringify({
      username: 'validUser',
      password: 'Password1',
      role: 'admin'
    }));
    expect(window.location.href).toEqual('login.html');
  });

  test('Week4_DAy1_Invalid Registration Weak Password', () => {
    // Mock form inputs with weak password
    document.getElementById('username').value = 'weakUser';
    document.getElementById('password').value = 'password'; // Doesn't meet complexity requirements
    document.getElementById('confirmPassword').value = 'password';
    document.getElementById('role').value = 'admin';

    // Call the validation function
    const result = validateRegistration();

    // Assertions
    expect(result).toBe(false);
    expect(document.getElementById('passwordValidation').textContent).toBe('Password must be at least 8 characters long and contain both letters and numbers');
});

test('Week4_DAy1_Invalid Registration Password does not match', () => {
  // Mock form inputs with weak password
  document.getElementById('username').value = 'weakUser';
  document.getElementById('password').value = 'password1'; // Doesn't meet complexity requirements
  document.getElementById('confirmPassword').value = 'password2';
  document.getElementById('role').value = 'admin';

  // Call the validation function
  const result = validateRegistration();

  // Assertions
  expect(result).toBe(false);
  expect(document.getElementById('passwordValidation').textContent).toBe('Passwords do not match');
});

test('Week4_DAy1_Invalid Registration Invalid Role', () => {
  // Mock form inputs with invalid role
  document.getElementById('username').value = 'invalidRoleUser';
  document.getElementById('password').value = 'Password123';
  document.getElementById('confirmPassword').value = 'Password123';
  document.getElementById('role').value = 'invalidRole';

  // Mock alert function
  window.alert = jest.fn();

  // Call the validation function
  const result = validateRegistration();

  // Assertions
  expect(result).toBe(false);
  expect(window.alert).toHaveBeenCalledWith('Invalid role selected.');
});

  test('Week4_DAy2_Valid Registration navigate to login page', () => {
    // Mock form inputs
    document.getElementById('username').value = 'validUser';
    document.getElementById('password').value = 'Password1';
    document.getElementById('confirmPassword').value = 'Password1';
    document.getElementById('role').value = 'admin';

    // Mock localStorage
    const localStorageMock = (function() {
      let store = {};
      return {
        getItem: key => store[key],
        setItem: (key, value) => { store[key] = value.toString(); },
        removeItem: key => delete store[key],
        clear: () => store = {}
      };
    })();
    Object.defineProperty(window, 'localStorage', { value: localStorageMock });

    // Mock alert function
    window.alert = jest.fn();

    // Mock window.location.href
    delete window.location;
    window.location = { href: '' };

    // Call the validation function
    validateRegistration();

    expect(window.location.href).toEqual('login.html');
  });

  // Add more test cases for other scenarios here
});

describe('Login Form Validation', () => {
  beforeEach(() => {
    document.body.innerHTML = `
    <div class="container">
    <h1>Login</h1>
    <form id="loginForm" onsubmit="return validateLogin();" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        
        <input type="submit" value="Login">
    </form>
</div>
    `;
  });

  test('Week4_DAy1_Valid Login', () => {
    // Mock form inputs
    document.getElementById('username').value = 'validUser';
    document.getElementById('password').value = 'Password1';

    // Mock localStorage with registered user data
    const registeredUser = {
      username: 'validUser',
      password: 'Password1',
      role: 'admin'
    };
    localStorage.setItem('registeredUser', JSON.stringify(registeredUser));

    // Mock alert function
    window.alert = jest.fn();

    // Mock window.location.href
    delete window.location;
    window.location = { href: '' };

    // Call the validation function
    validateLogin();

    // Assertions
    expect(window.alert).toHaveBeenCalledWith('Login successful! Role: admin');
  });

  test('Week4_DAy1_Invalid Login', () => {
    // Mock form inputs with incorrect credentials
    document.getElementById('username').value = 'invalidUser';
    document.getElementById('password').value = 'WrongPassword';

    // Mock localStorage without registered user data
    localStorage.removeItem('registeredUser');

    // Mock alert function
    window.alert = jest.fn();

    // Mock window.location.href
    delete window.location;
    window.location = { href: '' };

    // Call the validation function
    validateLogin();

    // Assertions
    expect(window.alert).toHaveBeenCalledWith('Invalid username or password.');
    expect(window.location.href).toBe('');
  });

  test('Week4_DAy2_Valid Login navigate to home page', () => {
    // Mock form inputs
    document.getElementById('username').value = 'validUser';
    document.getElementById('password').value = 'Password1';

    // Mock localStorage with registered user data
    const registeredUser = {
      username: 'validUser',
      password: 'Password1',
      role: 'admin'
    };
    localStorage.setItem('registeredUser', JSON.stringify(registeredUser));

    // Mock alert function
    window.alert = jest.fn();

    // Mock window.location.href
    delete window.location;
    window.location = { href: '' };

    // Call the validation function
    validateLogin();

    // Assertions
    expect(window.location.href).toEqual('home.html');
  });

  // Add more test cases for other scenarios here
});
