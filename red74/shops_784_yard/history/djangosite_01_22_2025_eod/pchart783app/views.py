import json
from django.shortcuts import render, get_object_or_404, redirect
from django.http import JsonResponse
from .models import Survey, Answer, QuestionAnswer, PartNumber
from .forms import DynamicForm
from django.db.models import Q
from django.urls import reverse
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse

@login_required
def display_survey(request, survey_id):
    # Retrieve the survey instance
    survey_instance = get_object_or_404(Survey, pk=survey_id)

    # Deserialize the survey structure if it's a string
    form_structure = survey_instance.structure
    if isinstance(form_structure, str):
        try:
            form_structure = json.loads(form_structure)
        except json.JSONDecodeError:
            raise ValueError(f"Invalid JSON structure for survey ID {survey_id}")

    # Extract questions from the form structure
    if isinstance(form_structure, dict) and "questions" in form_structure:
        form_structure = form_structure["questions"]

    # Create the form
    if request.method == 'POST':
        form = DynamicForm(request.POST, form_structure=form_structure, survey_id=survey_id)
        if form.is_valid():
            # Prepare the response data for the Answer model
            response_data = {}
            for field_name, user_answer in form.cleaned_data.items():
                # Skip null or empty string answers
                if user_answer is None or user_answer == "":
                    continue

                # Find the corresponding question in the survey structure
                question = next(
                    (q for q in form_structure if q.get("name") == field_name), None
                )
                if question:
                    # Add the answer to the response_data JSON
                    response_data[field_name] = {"answer": user_answer}
                    
                    # Only add issue and action_taken for yes/no questions
                    if question.get("type") == "choice":
                        issue = request.POST.get(f"issue_{field_name}")
                        action_taken = request.POST.get(f"action_{field_name}")
                        if issue:
                            response_data[field_name]["issue"] = issue
                        if action_taken:
                            response_data[field_name]["action_taken"] = action_taken

            # Save the response in the Answer model
            if response_data:
                answer_instance = Answer.objects.create(
                    survey=survey_instance,
                    response_data=response_data,
                    user=request.user 
                )
            # Save each question-answer as a separate entry in the QuestionAnswer model
            for field_name, user_answer in form.cleaned_data.items():
                # Skip null or empty string answers
                if user_answer is None or user_answer == "":
                    continue

                question = next(
                    (q for q in form_structure if q.get("name") == field_name), None
                )
                if question:
                    issue = ''
                    action_taken = ''
                    if question.get("type") == "choice":
                        issue = request.POST.get(f"issue_{field_name}")
                        action_taken = request.POST.get(f"action_{field_name}")
                    
                    status_by_admin = 'open' if issue or action_taken else 'closed'

                    QuestionAnswer.objects.create(
                        survey=survey_instance,
                        question_id=question.get("id"),
                        question_text=question.get("label"),
                        question_name=question.get("name"),
                        answer=answer_instance,
                        response=user_answer,
                        issue=issue,
                        action_taken=action_taken,
                        status_by_admin=status_by_admin,
                        user=request.user 
                    )
            return redirect('pchart783app:pchart_survey_success')
    else:
        # Initialize an empty form for GET requests
        form = DynamicForm(form_structure=form_structure, survey_id=survey_id)

    # Render the form for both GET and POST requests (if POST fails validation)
    return render(request, 'pcharttemp/display_survey_pchart.html', {'form': form, 'survey_instance': survey_instance})


def survey_success(request):
    return render(request, 'pcharttemp/survey_success_pchart.html')


@login_required
def survey_list_pchart(request):
    # Get the search query from the request
    search_query = request.GET.get("search", "").strip()

    # Retrieve all surveys and answers
    surveys = Survey.objects.filter(user=request.user).order_by('sort_order', 'name', 'cell')
    answers = Answer.objects.filter(user=request.user).order_by('-created_at')

    if search_query:
        # Split the search query into individual terms
        search_terms = search_query.split()

        # Build Q objects to match all terms across name and cell fields for surveys and answers
        survey_search_q = Q()
        answer_search_q = Q()

        for term in search_terms:
            survey_search_q &= Q(name__icontains=term) | Q(cell__icontains=term)
            answer_search_q &= Q(survey__name__icontains=term) | Q(survey__cell__icontains=term)

        # Filter surveys and answers based on the combined Q objects
        surveys = surveys.filter(survey_search_q)
        answers = answers.filter(answer_search_q)

    # Slice after filtering to get the latest 5 answers
    answers = answers[:5]
    surveys = surveys[:30]
    # Handle HTMX requests separately for surveys and answers
    if request.headers.get('HX-Request'):
        target = request.GET.get('target', '')
        if target == 'answers':
            return render(request, "pcharttemp/answers_list_pchart.html", {"answers": answers})
        return render(request, "pcharttemp/survey_list_pchart.html", {"surveys": surveys})

    # For a regular page load, render the full template
    return render(request, "pcharttemp/survey_pchart.html", {
        "surveys": surveys[:30],  # Limit to 30 surveys for the full page load
        "answers": answers,
    })


def index(request):
    return render(request, 'index.html')

# def show_conditional_fields(request, field_name):
#     autofill_url = reverse('surveyapp:autofill_action', args=[field_name])
#     return HttpResponse(f"""
#         <div class="mb-3">
#             <label for="issue_{field_name}" class="form-label">Please describe the issue:</label>
#             <textarea id="issue_{field_name}" name="issue_{field_name}" class="form-control" rows="4" required></textarea>
#         </div>

#         <div class="mb-3">
#             <label for="action_{field_name}" class="form-label">What action was taken?</label>
#             <textarea id="action_{field_name}" name="action_{field_name}" class="form-control" rows="4" required></textarea>
#         </div>

#         <button type="button" class="btn btn-sm btn-primary mt-2" 
#             hx-get="{autofill_url}" 
#             hx-target="#action_{field_name}" 
#             hx-swap="innerHTML">
#             Autofill: Contacted Team Leader / Supervisor
#         </button>
#     """)

def autofill_action(request, field_name):
    return HttpResponse("Contacted Team Leader / Supervisor")

@login_required
def profile(request):
    return render(request, 'registration/profile.html')