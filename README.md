# C++ Dynamic Memory & Class Practice Assignments

This repository contains C++ implementations and automated verification for two core OOP and memory management assignments.

---

## Question 1: Dynamic Array Allocation and Resizing

### Problem Statement
Write a C++ program to dynamically create an array of type `Person` (where a `Person` has characteristics: `name`, `age`, `height`, `gender`, and `gpa`) to store the data of 500 persons. Subsequently, resize this array dynamically to hold data for 600 persons. Navigate the resized array to find and print the average age, height, and GPA for all 600 persons.

### Expected Functionality
1. Dynamically allocate memory for an array of 500 `Person` structures/objects.
2. Populate initial 500 records.
3. Dynamically reallocate memory to expand the array capacity from 500 to 600 elements while preserving original data.
4. Populate the remaining 100 records.
5. Traverse the entire 600-element array to calculate and output:
   - Average Age
   - Average Height
   - Average GPA

---

## Question 2: Person Class Initialization and Updates

### Problem Statement
Write a C++ program to create a class named `Person` with characteristics: `name`, `age`, `height`, `gender`, and `gpa`. 
- Include member functions to initialize the object data.
- Include an `update` member function to modify the `age`, `height`, and `gpa` of an existing `Person` object.
- Provide display methods to verify data before and after modification.

### Expected Functionality
1. Encapsulate person attributes inside a `Person` class.
2. Use constructor or explicit `init()` method to set initial attribute values.
3. Use an `update()` method to modify `age`, `height`, and `gpa`.
4. Output initial and updated object states.

---

## Test Examples

### Question 1 Examples

#### Test Example 1.1 (Standard Small Dataset - Scaled Concept Validation)
* **Input Dataset Overview**: 600 records with uniform values across all entries.
  - 600 entries: Age = `20`, Height = `170.0`, GPA = `3.5`
* **Expected Output**:
  ```text
  Average Age: 20.00
  Average Height: 170.00
  Average GPA: 3.50

  ### Test Example 1.2 (Variable Value Distribution)
* **Input Dataset Overview**: First 500 entries have fixed set A; additional 100 entries have fixed set B.
  - 500 entries: Age = 20, Height = 160.0, GPA = 3.0
  - 100 entries: Age = 26, Height = 190.0, GPA = 4.0
* **Calculation**:
  - Avg Age = $\frac{(500 \times 20) + (100 \times 26)}{600} = \frac{10000 + 2600}{600} = 21.00$
  - Avg Height = $\frac{(500 \times 160.0) + (100 \times 190.0)}{600} = \frac{80000 + 19000}{600} = 165.00$
  - Avg GPA = $\frac{(500 \times 3.0) + (100 \times 4.0)}{600} = \frac{1500 + 400}{600} = 3.17$
* **Expected Output**:
  ```text
  Average Age: 21.00
  Average Height: 165.00
  Average GPA: 3.17

  # Question 2 Test Examples

This document outlines the test cases and expected plaintext outputs for Question 2.

---

## Test Example 2.1: Basic Update Test

### Parameters
* **Initial State:**
  * **Name:** `"Alice"`
  * **Age:** `20`
  * **Height:** `165.5`
  * **Gender:** `'F'`
  * **GPA:** `3.8`
* **Update Parameters:**
  * **Age:** `21`
  * **Height:** `167.0`
  * **GPA:** `3.9`

### Expected Output
```plaintext
Initial Person:
Name: Alice, Age: 20, Height: 165.50, Gender: F, GPA: 3.80
Updated Person:
Name: Alice, Age: 21, Height: 167.00, Gender: F, GPA: 3.90
```

---

## Test Example 2.2: Multi-Year Advancement

### Parameters
* **Initial State:**
  * **Name:** `"Bob"`
  * **Age:** `19`
  * **Height:** `175.0`
  * **Gender:** `'M'`
  * **GPA:** `2.9`
* **Update Parameters:**
  * **Age:** `22`
  * **Height:** `180.2`
  * **GPA:** `3.5`

### Expected Output
```plaintext
Initial Person:
Name: Bob, Age: 19, Height: 175.00, Gender: M, GPA: 2.90
Updated Person:
Name: Bob, Age: 22, Height: 180.20, Gender: M, GPA: 3.50
```

---

## Test Example 2.3: Graduation / Final Record Update

### Parameters
* **Initial State:**
  * **Name:** `"Charlie"`
  * **Age:** `21`
  * **Height:** `182.0`
  * **Gender:** `'M'`
  * **GPA:** `3.4`
* **Update Parameters:**
  * **Age:** `22`
  * **Height:** `182.0`
  * **GPA:** `3.75`

### Expected Output
```plaintext
Initial Person:
Name: Charlie, Age: 21, Height: 182.00, Gender: M, GPA: 3.40
Updated Person:
Name: Charlie, Age: 22, Height: 182.00, Gender: M, GPA: 3.75
```
