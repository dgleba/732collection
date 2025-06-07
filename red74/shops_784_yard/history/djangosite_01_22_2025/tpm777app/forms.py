from django import forms
import json
from django.apps import apps

class DynamicForm(forms.Form):
    def __init__(self, *args, **kwargs):
        form_structure = kwargs.pop('form_structure')
        survey_id = kwargs.pop('survey_id', None)

        # Deserialize JSON string if needed
        if isinstance(form_structure, str):
            try:
                form_structure = json.loads(form_structure)
            except json.JSONDecodeError:
                raise ValueError("form_structure is not valid JSON")

        # Ensure form_structure is a list
        if isinstance(form_structure, dict):
            form_structure = [form_structure]
        if not isinstance(form_structure, list):
            raise ValueError(f"form_structure must be a list, got {type(form_structure)}")

        super().__init__(*args, **kwargs)

        # Process each field in the form structure
        for field in form_structure:
            field_type = field.get('type')
            field_name = field.get('name')
            field_label = field.get('label', field_name)
            required = field.get('required', True)
            help_text = field.get('q_help_text', '')

            if not field_type or not field_name:
                raise ValueError(f"Field type or name is missing in {field}")

            # Handle different field types
            if field_type == 'text':
                self.fields[field_name] = forms.CharField(label=field_label, required=required)

                widget=forms.TextInput(attrs={'class': 'form-control'})
            elif field_type == 'number':
                min_value = field.get('min')
                max_value = field.get('max')
                

                self.fields[field_name] = forms.IntegerField(
                    label=field_label, required=required, min_value=min_value, max_value=max_value,help_text=help_text
                )
                widget=forms.NumberInput(attrs={'class': 'form-control'})
            elif field_type == 'choice':
                choices = field.get('choices', [])
                self.fields[field_name] = forms.ChoiceField(
                    label=field_label, required=required,
                    help_text=help_text,
                    choices=[(choice, choice) for choice in choices], 
                    widget=forms.RadioSelect
                )
            elif field_type == 'multi_choice':
                choices = field.get('choices', [])
                self.fields[field_name] = forms.MultipleChoiceField(
                    label=field_label, required=required,
                    help_text=help_text,
                    choices=[(choice['value'], choice['label']) for choice in choices],
                    widget=forms.CheckboxSelectMultiple
                )
            elif field_type == 'textarea':
                self.fields[field_name] = forms.CharField(
                    label=field_label, required=required,
                    help_text=help_text,
                    widget=forms.Textarea(attrs={'class': 'form-control','rows': 3})
                )
            elif field_type == 'table_lookup':
                grouping = field.get('choice_tbl_grouping')
                
                if not grouping:
                    raise ValueError(f"'choice_tbl_grouping' not specified for field '{field_name}'")

                choice_tbl_model = apps.get_model('tpm777app', 'choice_tbl')
                choices = choice_tbl_model.objects.filter(choice_tbl_grouping=grouping).values_list('choice_name', 'choice_name')
                self.fields[field_name] = forms.ChoiceField(label=field_label, required=required, choices=choices, widget=forms.RadioSelect,help_text=help_text)
            elif field_type == 'partnum_lookup':
                part_number_model = apps.get_model('tpm777app', 'PartNumber')
                survey_model = apps.get_model('tpm777app', 'Survey')
                help_text=help_text,
                if survey_id:
                    try:
                        survey = survey_model.objects.get(id=survey_id)
                        part_numbers = survey.part_numbers.values_list('number', flat=True)
                    except survey_model.DoesNotExist:
                        raise ValueError(f"Survey with id {survey_id} does not exist")
                else:
                    # Fallback to all part numbers if no survey_id provided
                    part_numbers = part_number_model.objects.values_list('number', flat=True)

                choices = [(num, num) for num in part_numbers]
                self.fields[field_name] = forms.ChoiceField(
                    label=field_label, 
                    required=required,
                    help_text=help_text,
                    choices=choices,
                    widget=forms.RadioSelect(attrs={'class': 'form-check-input'})
                )

            else:
                raise ValueError(f"Unsupported field type: {field_type}")
