# 💧 Optimizing Salt Dissolution in Water Using Response Surface Methodology

## 📌 Problem Statement

Salt dissolution in water is a critical step in preparing lemonade, particularly when using chilled or hot water. Dissolution is slow in cold water and requires additional cooling time in hot water. This study aims to identify the optimal conditions—**water volume**, **temperature**, and **stirring rate**—that minimize the **time taken to dissolve a fixed amount of salt**.

---

## 🎯 Goal

Use **Response Surface Methodology (RSM)** to determine the optimal:
- Temperature of water (°F)
- Amount of water (ml)
- Stirring rate (stirs/sec)  
to **minimize the dissolution time** (in seconds) for 2.84g of salt.

---

## 📊 Response & Factors

- **Response Variable**:  
  Dissolution time for salt (in seconds)

- **Factor Variables**:
  - Amount of water (ml)
  - Stirring rate (stirs/sec)
  - Temperature of water (°F)

---

## 🧪 Data Collection Process

1. A fixed quantity of salt (2.84g) was dissolved in water under various conditions.
2. Water was measured using a 1/3 cup, heated via microwave, and its temperature recorded using a thermometer.
3. Salt was added to the water and stirred using an ice-cream stick at a consistent rate by a single person to ensure consistency.
4. A mobile phone timer was used to record the time until the salt fully dissolved.

---

## 🧮 Experimental Design

| Parameter               | Global Range     | Local Range     | Initial Center Point |
|:----------------------|:----------------:|:----------------:|:--------------------:|
| Amount of Water (ml)   | 150 – 300        | 157 – 237        | 197.16               |
| Stirring Rate (stirs/s)| 2 – 9            | 2 – 4            | 3                    |
| Temperature (°F)       | 75 – 160         | 75 – 100         | 87.5                 |

---

## 📈 Analysis Workflow

1. **First-Order Model**  
   Built within the global design space. Lack-of-fit test showed the model was sufficient (response was linear in this region).

2. **Steepest Descent Path**  
   A gradient was used to identify a direction of improvement, moving towards a region where the response became nonlinear.

3. **Second First-Order Model**  
   Built at a new point. Lack-of-fit test showed insufficiency—response surface was no longer linear.

4. **Central Composite Design (CCD)**  
   Used to fit a second-order model. Lack-of-fit test confirmed the model was now sufficient, indicating significant interactions.

5. **Canonical Analysis**  
   Revealed a **saddle point**. Hence, further optimization was needed to determine the optimal conditions.

---

## ✅ Final Optimal Settings (Estimated)

| Factor         | Value               |
|----------------|---------------------|
| Amount of Water| **235.77 ml**       |
| Temperature    | **123.06 °F**       |
| Stirring Rate  | **9 stirs/sec**     |

These conditions are expected to **minimize the mean dissolution time** of salt in water.

---

## 📚 Tools & Techniques Used

- **Response Surface Methodology (RSM)**
- **First- and Second-Order Model Fitting**
- **Lack-of-Fit Testing**
- **Path of Steepest Descent**
- **Canonical Analysis**
- **Experimental Design (Central Composite Design)**

---

## 🧂 Future Work

- Conduct more trials near the saddle point for improved accuracy
- Automate stirring for finer control and reproducibility
- Extend to other solutes or flavored powders

---

## Important Notice

The code in this repository is proprietary and protected by copyright law. Unauthorized copying, distribution, or use of this code is strictly prohibited. By accessing this repository, you agree to the following terms:

- **Do Not Copy:** You are not permitted to copy any part of this code for any purpose.
- **Do Not Distribute:** You are not permitted to distribute this code, in whole or in part, to any third party.
- **Do Not Use:** You are not permitted to use this code, in whole or in part, for any purpose without explicit permission from the owner.

Any violation of these terms will be subject to legal action. If you have any questions or require permission, please contact the repository owner.

Thank you for your cooperation.
