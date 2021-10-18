package httpapi.authz

# David is the only member of HR.

# Allow HR members to get anyone's salary.
allow {
	input.method == "GET"
	input.path = ["finance", "salary", _]
	input.user == data.hr[_]
}
