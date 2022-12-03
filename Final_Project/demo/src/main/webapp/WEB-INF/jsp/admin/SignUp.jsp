<!DOCTYPE html>
<html lang="en">

<head>
    <title>User Register</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="/image/png" href="../public/programs/form/assets/images/icons/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="../public/programs/form/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../public/programs/form/assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../public/programs/form/assets/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <link rel="stylesheet" type="text/css" href="../public/programs/form/assets/vendor/animate/animate.css">
    <link rel="stylesheet" type="text/css" href="../public/programs/form/assets/vendor/css-hamburgers/hamburgers.min.css">
    <link rel="stylesheet" type="text/css" href="../public/programs/form/assets/vendor/animsition/css/animsition.min.css">
    <link rel="stylesheet" type="text/css" href="../public/programs/form/assets/vendor/select2/select2.min.css">
    <link rel="stylesheet" type="text/css" href="../public/programs/form/assets/vendor/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" type="text/css" href="../public/programs/form/assets/css/util.css">
    <link rel="stylesheet" type="text/css" href="../public/programs/form/assets/css/main.css">
    
    <!--link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet"-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" crossorigin="anonymous">

</head>
<body>

    <div class="limiter" style="background-color: #ebeeef">
        <div class="container" style="padding:20px 0px 0px 20px;background-color: #ebeeef;">
            <a href="/" style="font-size: 13px;font-weight: 600;text-transform: uppercase;letter-spacing: 1px;display: inline-block;padding: 10px 32px;border-radius: 4px;background: #F39C12; color:black;">Go to Home</a>
        </div>
        <div class="container-login100">
            <div class="wrap-login100">
                <div class="login100-form-title" style="background-image: url(../public/programs/form/assets/images/bg-01.jpg)">
                    <span class="login100-form-title-1">
                        cms Registration
                    </span>
                </div>
                <x-alert type="ErrorMsg" />
                <form class="login100-form" action="/registerUser" method="post">
                   
                    <div class="wrap-input100 validate-input m-b-26" data-validate="First Name is required">
                        <span class="label-input100">First Name<span style="color: #ff5e13;">&nbsp;*</span></span>
                        <input class="input100" type="text" name="firstName" value="" placeholder="Enter First Name" required>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input m-b-18" data-validate="Last Name is required">
                        <span class="label-input100">Last Name<span style="color: #ff5e13;">&nbsp;*</span></span>
                        <input class="input100" type="text" name="lastName" value="" placeholder="Enter Last Name" required>
                        <span class="focus-input100"></span>
                    </div>
                    
                    <div class="wrap-input100 validate-input m-b-26" data-validate="User Name is required">
                        <span class="label-input100">User Name<span style="color: #ff5e13;">&nbsp;*</span></span>
                        <input class="input100" type="text" name="userName" value="" placeholder="User First Name" required>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input m-b-26" data-validate="Email is required">
                        <span class="label-input100">Email Id<span style="color: #ff5e13;">&nbsp;*</span></span>
                        <input class="input100" type="email" name="email" value="" placeholder="Enter Email" required>
                        <span class="focus-input100"></span>
                        <x-alert type="email-error" />
                    </div>

                    <div class="wrap-input100 validate-input m-b-18" data-validate="Password is required">
                        <span class="label-input100">Mobile No.<span style="color: #ff5e13;">&nbsp;*</span></span>
                        <input class="input100" type="text" name="mobileNo" value="" placeholder="Enter Mobile No." required>
                        <span class="focus-input100"></span>
                        <x-alert type="mobile-error" />
                    </div>
                    <div class="wrap-input100 validate-input m-b-26" data-validate="Password is required">
                        <span class="label-input100">Password<span style="color: #ff5e13;">&nbsp;*</span></span>
                        <input id="passwd" class="input100" type="password" name="password" placeholder="Enter Password" required>
                        <span class="eye-icon"><i id="eye-pass" class="fas fa-eye-slash"></i></span>
                        <span class="focus-input100"></span>
                        <ul id="ListPopOn" class="list-group list-group-flush" style="display: none;">
                            <li class="list-group-item">
                                <span class="lower-case invalid">
                                    <i class="fas fa-times-circle " aria-hidden="true"></i>&nbsp;LowerCase
                                </span>
                            </li>
                            <li class="list-group-item">
                                <span class="upper-case invalid">
                                    <i class="fas fa-times-circle" aria-hidden="true"></i>&nbsp;UpperCase
                                </span>
                            </li>
                            <li class="list-group-item">
                                <span class="number-digits invalid">
                                    <i class="fas fa-times-circle" aria-hidden="true"></i>&nbsp;Number (0-9)
                                </span>
                            </li>
                            <li class="list-group-item">
                                <span class="special-characters invalid">
                                    <i class="fas fa-times-circle" aria-hidden="true"></i>&nbsp;Special Characters
                                </span>
                            </li>
                            <li class="list-group-item">
                                <span class="AtLeast-Eight invalid">
                                    <i class="fas fa-times-circle" aria-hidden="true"></i>&nbsp;At Least 8 Char
                                </span>
                            </li>
                        </ul>
                    </div>
                    <div class="wrap-input100 validate-input m-b-18" data-validate="Confirm Password is required">
                        <span class="label-input100">Confirm Password<span style="color: #ff5e13;">&nbsp;*</span></span>
                        <input id="Cpasswd" class="input100" type="password" name="_password_confirmation" placeholder="Enter Confirm password" required>
                        <span class="eye-icon"><i id="eye-cpass" class="fas fa-eye-slash"></i></span>
                        <span class="focus-input100"></span>
                        <x-alert type="cpassword-error" />
                    </div>
                    <div class="container-login100-form-btn" style="justify-content: center;">
                        <button type="submit" class="login100-form-btn btn-margin">
                            REGISTRATION
                        </button>
                    </div>
                    <div class="w-full p-t-20" style="border-bottom: 1px solid #dadde1;"></div>
                    <div class="flex-sb-m w-full text-margins m-l-30" style="justify-content: center">
                        <div>
                            Already have an account?
                            <a href="admin/login" class="text-primary font-weight-bold">
                                LogIn
                            </a>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <script src="../public/programs/form/assets/vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="../public/programs/form/assets/vendor/animsition/js/animsition.min.js"></script>
    <script src="../public/programs/form/assets/vendor/bootstrap/js/popper.js"></script>
    <script src="../public/programs/form/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="../public/programs/form/assets/vendor/select2/select2.min.js"></script>
    <script src="../public/programs/form/assets/vendor/daterangepicker/moment.min.js"></script>
    <script src="../public/programs/form/assets/vendor/daterangepicker/daterangepicker.js"></script>
    <script src="../public/programs/form/assets/vendor/countdowntime/countdowntime.js"></script>
    <script src="../public/programs/form/assets/js/main.js"></script>

    <script src="../public/programs/form/assets/js/jsFunction.js"></script>
</body>

</html>
