#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

bool IsPasswordOK() {
	bool retResult = 0;
	unsigned int aSize = 9;
	char goodpwd[] = "goodpass";
	// Memory storage for pwd
	char password[aSize];

	// Get input from keyboard
	gets(password);

	// char * result = fgets(password, aSize, stdin);
	// if ( result == NULL ) {
	// 	printf("fgets unsuccessful\n");
	// 	return 0;
	// }

	// print memory address of password
	printf("Starting address of password is %A", password);

	// Echo both passwords
	printf("actual password is %s\n", goodpwd);
	printf("password entered is %s\n", password);

	// strcmp(str1,str2) returns a value < 0 if str1 < str2.
	// strcmp(str1,str2) returns a value > 0 if str1 > str2.
	// strcmp(str1,str2) returns a value = 0 if str1 is equal to str2.
	if (!strcmp(password, goodpwd))
		retResult = 1; // !(0) -> !(false) = true since password equal goodpwd
	else
		retResult = 0; // !(1) -> !(true) = false since Password not equal goodpwd

	return retResult;
}

int main() {
	bool pwStatus;   // Password Status
	int result = 0;

	puts("Enter Password:");

	pwStatus = IsPasswordOK(); // Get & check password
	if (pwStatus)            // 1 -> true
		puts("Access granted");
	else {					   // 0 -> false
		puts("Access denied");
		result = 1;
	}

	return result;

}