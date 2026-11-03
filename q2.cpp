// IC151 — Lab A2, question 2: Person Class Initialization & Update
//
// Define a Person class and manage object state updates.

#include <iostream>
#include <string>
#include <iomanip>

class Person {
private:
   /*Define you data here*/

public:
    /*Define you methods here*/

int main() {
    std::string name;
    int age, new_age;
    double height, gpa, new_height, new_gpa;
    char gender;

    if (std::cin >> name >> age >> height >> gender >> gpa >> new_age >> new_height >> new_gpa) {
        Person p;
        p.init(name, age, height, gender, gpa);
        
        std::cout << "Initial Person:\n";
        p.display();
        
        p.update(new_age, new_height, new_gpa);
        
        std::cout << "Updated Person:\n";
        p.display();
    }

    return 0;
}
