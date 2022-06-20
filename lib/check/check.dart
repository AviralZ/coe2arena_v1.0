int check(String email) {
  List<String> stud = [
    'achadha_be19@thapar.edu',
    'ggarg1_be19@thapar.edu',
    'asachdeva_be19@thapar.edu',
    'mrai_be19@thapar.edu',
    'hseth_be19@thapar.edu',
    'bkhosla_be19@thapar.edu',
    'yupadhyay_be19@thapar.edu',
    'asharma5_be19@thapar.edu',
    'ydhawan_be19@thapar.edu',
    'hkharotia_be19@thapar.edu',
    'agupta2_be19@thapar.edu',
    'vnagori_be19@thapar.edu',
    'asonker_be19@thapar.edu',
    'psood1_be19@thapar.edu',
    'lkumar1_be19@thapar.edu',
    'tsharma1_be19@thapar.edu',
    'dsingh2_be19@thapar.edu',
    'hbansal1_be19@thapar.edu',
    'dchopra_be19@thapar.edu',
    'ddhairya_be19@thapar.edu',
    'vmahajan1_be19@thapar.edu',
    'gsidhu1_be19@thapar.edu',
    'pmanocha_be19@thapar.edu',
    'kjindal_be19@thapar.edu',
    'gkumar60_be20@thapar.edu',
    'rbehl_be19@thapar.edu',
    'dkaushik_bemba19@thapar.edu',
    'the3prog@gmail.com'
  ];

  for (int i = 0; i < 28; i++) {
    if (email == stud[i]) {
      return 1;
    }
  }

  return 0;
}

String nameID(String email) {
  if (email == 'achadha_be19@thapar.edu') {
    email = 'Anmol';
    return email;
  }

  if (email == 'ggarg1_be19@thapar.edu') {
    email = 'Gitesh';
    return email;
  }

  if (email == 'asachdeva_be19@thapar.edu') {
    email = 'Arnav';
    return email;
  }
  if (email == 'mrai_be19@thapar.edu') {
    email = 'Meghna';
    return email;
  }

  if (email == 'hseth_be19@thapar.edu') {
    email = 'Hardik';
    return email;
  }
  if (email == 'bkhosla_be19@thapar.edu') {
    email = 'Bhawna';
    return email;
  }

  if (email == 'yupadhyay_be19@thapar.edu') {
    email = 'Yash';
    return email;
  }

  if (email == 'asharma5_be19@thapar.edu') {
    email = 'Akarshan';
    return email;
  }

  if (email == 'ydhawan_be19@thapar.edu') {
    email = 'Yash';
    return email;
  }

  if (email == 'agupta2_be19@thapar.edu') {
    email = 'Aneesh';
    return email;
  }

  if (email == 'vnagori_be19@thapar.edu') {
    email = 'Vasu';
    return email;
  }

  if (email == 'asonker_be19@thapar.edu') {
    email = 'Aviral';
    return email;
  }

  if (email == 'psood1_be19@thapar.edu') {
    email = 'Palak';
    return email;
  }

  if (email == 'lkumar1_be19@thapar.edu') {
    email = 'Lalit';
    return email;
  }

  if (email == 'tsharma1_be19@thapar.edu') {
    email = 'Tavishi';
    return email;
  }

  if (email == 'dsingh2_be19@thapar.edu') {
    email = 'Dev';
    return email;
  }

  if (email == 'hkharotia_be19@thapar.edu') {
    email = 'Himanshi';
    return email;
  }
  if (email == 'hbansal1_be19@thapar.edu') {
    email = 'Himanshi';
    return email;
  }

  if (email == 'dchopra_be19@thapar.edu') {
    email = 'Dhriti';
    return email;
  }
  if (email == 'ddhairya_be19@thapar.edu') {
    email = 'Dhairya';
    return email;
  }

  if (email == 'vmahajan1_be19@thapar.edu') {
    email = 'Vanshikha';
    return email;
  }

  if (email == 'gsidhu1_be19@thapar.edu') {
    email = 'Gursher';
    return email;
  }

  if (email == 'pmanocha_be19@thapar.edu') {
    email = 'Pragya';
    return email;
  }

  if (email == 'kjindal_be19@thapar.edu') {
    email = 'Kanika';
    return email;
  }

  if (email == 'gkumar60_be20@thapar.edu') {
    email = 'Gaurav';
    return email;
  }

  if (email == 'rbehl_be19@thapar.edu') {
    email = 'Ridham';
    return email;
  }
  if (email == 'dkaushik_bemba19@thapar.edu') {
    email = 'Divyansh';
    return email;
  }

  if (email == 'the3prog@gmail.com') {
    email = 'Test User';
    return email;
  }
}

bool yesorno(String email) {
  if ((email == 'asonker_be19@thapar.edu') ||
      (email == 'ggarg1_be19@thapar.edu') ||
      (email == 'agupta2_be19@thapar.edu') ||
      (email == 'ddhairya_be19@thapar.edu') ||
      (email == 'hseth_be19@thapar.edu')) {
    return true;
  } else {
    return false;
  }
}
