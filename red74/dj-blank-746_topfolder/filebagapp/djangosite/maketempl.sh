#!/bin/bash

# Set base template paths
APP_NAME="filebagapp"
TEMPLATES_DIR="templates"
APP_TEMPLATES_DIR="$TEMPLATES_DIR/$APP_NAME"
REGISTRATION_DIR="$TEMPLATES_DIR/registration"

# Create directories
mkdir -p "$APP_TEMPLATES_DIR"
mkdir -p "$REGISTRATION_DIR"

# Create list.html
cat > "$APP_TEMPLATES_DIR/list.html" <<EOF
<h2>Files</h2>
<ul>
  {% for f in files %}
    <li>{{ f.name }} —
      <a href="{% url 'filebag-edit' f.pk %}">Edit</a> |
      <a href="{% url 'filebag-local-edit' f.pk %}">Local Edit</a>
    </li>
  {% endfor %}
</ul>
<a href="{% url 'filebag-upload' %}">Upload New</a>
EOF

# Create upload.html
cat > "$APP_TEMPLATES_DIR/upload.html" <<EOF
<h2>Upload File</h2>
<form method="post" enctype="multipart/form-data">
  {% csrf_token %}
  {{ form.as_p }}
  <button type="submit">Upload</button>
</form>
EOF

# Create edit.html
cat > "$APP_TEMPLATES_DIR/edit.html" <<EOF
<h2>Edit {{ filebag.name }}</h2>
<form method="post">
  {% csrf_token %}
  {{ form.as_p }}
  <button type="submit">Save</button>
</form>
<script src="{% static '$APP_NAME/codemirror/codemirror.js' %}"></script>
<script>
  var editor = CodeMirror.fromTextArea(document.getElementById("codemirror"), {
    lineNumbers: true,
    mode: "text/plain"
  });
</script>
EOF

# Create login.html
cat > "$REGISTRATION_DIR/login.html" <<EOF
<h2>Login</h2>
<form method="post">
  {% csrf_token %}
  {{ form.as_p }}
  <button type="submit">Login</button>
</form>
EOF

echo "✅ Templates created in '$TEMPLATES_DIR/'"
