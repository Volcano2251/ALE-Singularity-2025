# LearnLM: AI Tutoring in UK Classrooms (Research Paper Analysis)

**Original PDF:** [learnLM_nov25.pdf](./pdfs/learnLM_nov25.pdf)
**Source URL:** https://storage.googleapis.com/deepmind-media/LearnLM/learnLM_nov25.pdf
**Authors:** LearnLM Team, Google & Eedi
**Date:** November 2025

## Executive Summary
This paper details an exploratory randomized controlled trial (RCT) conducted with 165 students across five UK secondary schools to evaluate the safety and efficacy of "LearnLM"—a generative AI model fine-tuned for pedagogy. The study integrated LearnLM into the "Eedi" mathematics platform, where expert human tutors supervised the AI's drafts before sending them to students.

**Key Finding:** Students tutored by the human-supervised AI performed **at least as well** as those with human tutors on immediate tasks and were **5.5 percentage points more likely** to solve novel problems on subsequent topics (knowledge transfer) compared to human tutoring alone.

## Key Takeaways

### 1. Efficacy & Learning Outcomes
*   **Mistake Remediation:** LearnLM (supervised) was as effective as human tutors in helping students correct immediate mistakes (93.0% vs. 91.2% success rate). Both vastly outperformed static hints (65.4%).
*   **Knowledge Transfer:** The most significant finding was in "transfer learning"—applying knowledge to a new topic. LearnLM-supported students had a **66.2% success rate** on the next unit's first question, compared to **60.7%** for human-tutor-only students.
*   **Misconception Resolution:** Both AI and human tutors achieved ~95% success in helping students resolve underlying misconceptions.

### 2. The Role of Human Supervision
*   **Workflow:** The AI drafted responses, and human tutors reviewed them. Tutors approved **76.4%** of AI drafts with zero or minimal edits (e.g., deleting an emoji).
*   **Tutor Feedback:** Tutors praised the AI for its consistent "Socratic dialogue" (asking guiding questions rather than giving answers).
*   **Professional Growth:** Interestingly, some tutors reported *learning* from the AI, noting it suggested explanations or questions they hadn't considered.
*   **Edits:** When tutors *did* edit, it was primarily to adjust **pacing** (preventing student frustration) or to add **social-emotional nuance** (rapport building).

### 3. Safety & Accuracy
*   **Audit:** A review of 3,617 AI-drafted messages found **zero** instances of harmful content.
*   **Accuracy:** Only **0.1%** (5 messages) contained factual errors (e.g., a calculation mistake or hallucination), which were caught by supervisors.

### 4. Methodology
*   **Participants:** 165 students (Years 9-10) in UK schools.
*   **Design:** Randomized Controlled Trial (RCT) comparing:
    1.  Static Hints (Control)
    2.  Human Tutor (Interactive)
    3.  LearnLM + Human Supervisor (Interactive)
*   **Model:** LearnLM, fine-tuned from **Gemini 2.0 Flash**.

## Technical Details for Implementation (Prompts)
The paper includes the specific **System Prompt** used to constrain LearnLM (Appendix D.1). Key directives included:
*   "Act as a mathematics tutor... in a clipped, Socratic style."
*   "Do not let students know you are a bot."
*   "Use short, focused sentences."
*   "Only ask the student one question at a time."
*   **Rudeness handling:** Specific scripts for dealing with rude students.
*   **Dynamic Instructions:** The prompt logic adjusted based on the student's predicted score (e.g., if score < 50%, "Use brief, simple language"; if > 80%, "Help with more advanced concepts").

## Conclusion
The study suggests that pedagogically fine-tuned AI, when supervised, can be a safe and highly effective tool for scaling personalized tutoring, potentially even surpassing unassisted human tutoring in fostering transferable skills by maintaining a consistent Socratic method.
