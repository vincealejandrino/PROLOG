:- use_module(library(pce)).
:- pce_image_directory('./icons'). 

% Define symptoms facts
symptom(fever).
symptom(cough).
symptom(sore_throat).
symptom(runny_nose).
symptom(headache).
symptom(fatigue).
symptom(chest_pain).
symptom(difficulty_breathing).
symptom(rash).
symptom(nausea).
symptom(vomiting).
symptom(diarrhea).
symptom(dizziness).
symptom(loss_of_taste).
symptom(loss_of_smell).
symptom(muscle_ache).
symptom(chills).
symptom(sweating).
symptom(weight_loss).
symptom(abdominal_pain).
symptom(sensitivity_to_light).
symptom(itchy_eyes).
symptom(sneezing).

% Define diseases 
disease(flu).
disease(common_cold).
disease(migraine).
disease(allergy).
disease(covid_19).
disease(stomach_flu).
disease(food_poisoning).

% Define rules
has_disease(Patient, flu) :-
    has_symptom(Patient, fever),
    has_symptom(Patient, cough),
    has_symptom(Patient, sore_throat),
    has_symptom(Patient, muscle_ache).

has_disease(Patient, common_cold) :-
    has_symptom(Patient, runny_nose),
    has_symptom(Patient, sore_throat),
    has_symptom(Patient, cough).

has_disease(Patient, migraine) :-
    has_symptom(Patient, headache),
    has_symptom(Patient, nausea),
    has_symptom(Patient, sensitivity_to_light).

has_disease(Patient, allergy) :-
    has_symptom(Patient, runny_nose),
    has_symptom(Patient, itchy_eyes),
    has_symptom(Patient, sneezing).

has_disease(Patient, covid_19) :-
    has_symptom(Patient, fever),
    has_symptom(Patient, cough),
    has_symptom(Patient, loss_of_taste),
    has_symptom(Patient, loss_of_smell).

has_disease(Patient, stomach_flu) :-
    has_symptom(Patient, nausea),
    has_symptom(Patient, vomiting),
    has_symptom(Patient, diarrhea),
    has_symptom(Patient, abdominal_pain).

has_disease(Patient, food_poisoning) :-
    has_symptom(Patient, nausea),
    has_symptom(Patient, vomiting),
    has_symptom(Patient, diarrhea),
    has_symptom(Patient, dizziness).

% Explain disease rules
explain_disease(flu, 'Flu (Influenza): Symptoms: Fever, Cough, Sore Throat, Muscle Ache.\nRecommended Actions: Rest, stay hydrated, and consult a healthcare provider if symptoms worsen.').
explain_disease(common_cold, 'Common Cold: Symptoms: Runny Nose, Sore Throat, Cough.\nRecommended Actions: Rest, drink plenty of fluids, and use over-the-counter cold remedies if necessary.').
explain_disease(migraine, 'Migraine: Symptoms: Headache, Nausea, Sensitivity to Light.\nRecommended Actions: Rest in a dark, quiet room; use pain relievers; consult a healthcare provider for prescription medications if needed.').
explain_disease(allergy, 'Allergy: Symptoms: Runny Nose, Itchy Eyes, Sneezing.\nRecommended Actions: Avoid allergens, use antihistamines, and consult a healthcare provider if symptoms persist.').
explain_disease(covid_19, 'COVID-19: Symptoms: Fever, Cough, Loss of Taste, Loss of Smell.\nRecommended Actions: Self-isolate, stay hydrated, monitor symptoms, and seek medical attention if symptoms worsen.').
explain_disease(stomach_flu, 'Stomach Flu: Symptoms: Nausea, Vomiting, Diarrhea, Abdominal Pain.\nRecommended Actions: Stay hydrated, rest, and consult a healthcare provider if symptoms persist.').
explain_disease(food_poisoning, 'Food Poisoning: Symptoms: Nausea, Vomiting, Diarrhea, Dizziness.\nRecommended Actions: Stay hydrated, rest, and consult a healthcare provider if symptoms persist.').

% Define GUI elements and actions
start_gui :-
    new(Dialog, dialog('Consult MD')),
    send(Dialog, append, new(Name, text_item(name, 'Enter your name'))),
    send(Dialog, append, new(Symptom1, menu(symptom1, cycle))),
    send_list(Symptom1, append, [abdominal_pain, chills, chest_pain, cough, diarrhea, difficulty_breathing, dizziness, fatigue, fever, headache, itchy_eyes, loss_of_smell, loss_of_taste, muscle_ache, nausea, rash, runny_nose, sensitivity_to_light, sneezing, sore_throat, sweating, vomiting, weight_loss]),
    send(Dialog, append, new(Symptom2, menu(symptom2, cycle))),
    send_list(Symptom2, append, [none, abdominal_pain, chills, chest_pain, cough, diarrhea, difficulty_breathing, dizziness, fatigue, fever, headache, itchy_eyes, loss_of_smell, loss_of_taste, muscle_ache, nausea, rash, runny_nose, sensitivity_to_light, sneezing, sore_throat, sweating, vomiting, weight_loss]),
    send(Dialog, append, new(Symptom3, menu(symptom3, cycle))),
    send_list(Symptom3, append, [none, abdominal_pain, chills, chest_pain, cough, diarrhea, difficulty_breathing, dizziness, fatigue, fever, headache, itchy_eyes, loss_of_smell, loss_of_taste, muscle_ache, nausea, rash, runny_nose, sensitivity_to_light, sneezing, sore_throat, sweating, vomiting, weight_loss]),
    send(Dialog, append, new(Symptom4, menu(symptom4, cycle))),
    send_list(Symptom4, append, [none, abdominal_pain, chills, chest_pain, cough, diarrhea, difficulty_breathing, dizziness, fatigue, fever, headache, itchy_eyes, loss_of_smell, loss_of_taste, muscle_ache, nausea, rash, runny_nose, sensitivity_to_light, sneezing, sore_throat, sweating, vomiting, weight_loss]),
    send(Dialog, append, button(submit, message(@prolog, diagnose_gui, Name?selection, Symptom1?selection, Symptom2?selection, Symptom3?selection, Symptom4?selection))),
    send(Dialog, open).

% Define the diagnose_gui predicate to handle GUI input and output
diagnose_gui(Name, Symptom1, Symptom2, Symptom3, Symptom4) :-
    format('Diagnosing ~w based on symptoms: ~w, ~w, ~w, ~w~n', [Name, Symptom1, Symptom2, Symptom3, Symptom4]),
    ( Symptom1 \= none -> assert(has_symptom(Name, Symptom1)) ; true ),
    ( Symptom2 \= none -> assert(has_symptom(Name, Symptom2)) ; true ),
    ( Symptom3 \= none -> assert(has_symptom(Name, Symptom3)) ; true ),
    ( Symptom4 \= none -> assert(has_symptom(Name, Symptom4)) ; true ),
    diagnose(Name, Explanation),
    send(@display, inform, Explanation),
    retractall(has_symptom(Name, _)).

% consultmd Logic
diagnose(Patient, Explanation) :-
    (   has_disease(Patient, Disease) ->
        explain_disease(Disease, DiseaseExplanation),
        format(atom(Explanation), 'Based on the symptoms, ~w is diagnosed with ~w.~n~w', [Patient, Disease, DiseaseExplanation])
    ;   Explanation = 'No specific diagnosis could be made based on the provided symptoms.'
    ).

% Entry point
:- start_gui.
