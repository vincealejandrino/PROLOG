# PROLOG
LOGIC BASED MODEL. The system should have a minimum of 20 facts and 5 rules

Consult MD - Symptom Checker
Overview
Consult MD is a Prolog-based application that provides a simple GUI for diagnosing common ailments based on user-reported symptoms. The application allows users to input their name and select symptoms from dropdown menus. Based on the selected symptoms, the system attempts to diagnose a potential disease and provides recommendations.

Features
Symptom Selection: Users can select up to four symptoms from dropdown menus.
Disease Diagnosis: The system diagnoses diseases based on the provided symptoms using predefined rules.
Recommendations: Provides recommendations and explanations for the diagnosed disease.

Symptom List
The symptoms available for selection are as follows (in alphabetical order):

abdominal_pain
chills
chest_pain
cough
diarrhea
difficulty_breathing
dizziness
fatigue
fever
headache
itchy_eyes
loss_of_smell
loss_of_taste
muscle_ache
nausea
rash
runny_nose
sensitivity_to_light
sneezing
sore_throat
sweating
vomiting
weight_loss
Diseases and Diagnosis Rules
The following diseases can be diagnosed by the system, based on the given rules:

Flu (Influenza)
Symptoms: Fever, Cough, Sore Throat, Muscle Ache

Common Cold

Symptoms: Runny Nose, Sore Throat, Cough
Migraine
Symptoms: Headache, Nausea, Sensitivity to Light

Allergy
Symptoms: Runny Nose, Itchy Eyes, Sneezing

COVID-19
Symptoms: Fever, Cough, Loss of Taste, Loss of Smell

Stomach Flu
Symptoms: Nausea, Vomiting, Diarrhea, Abdominal Pain

Food Poisoning
Symptoms: Nausea, Vomiting, Diarrhea, Dizziness

Disclaimer: The symptoms and diagnoses provided in this application are examples and not 100% factual. Always consult a healthcare provider for accurate diagnosis and treatment.

Code Overview
The main components of the code are:
Symptom and Disease Facts: Defined using symptom/1 and disease/1 predicates.
Diagnosis Rules: Defined using has_disease/2 predicates.
Explanations: Defined using explain_disease/2 predicates.
GUI Definition: Created using the xpce library with dialog elements for user input.
Diagnosis Logic: The diagnose_gui/4 predicate handles user input, calls the diagnosis logic, and displays the result.

**TO RUN**
?- cd /path/to/your/MCO2    
pwd: to check the path
?- consult('consult_md.pl').
