package httpapi.authz

# bob is alice's manager, and betty is charlie's.

default allow = false

# Allow users to get their own salaries.
allow {
	some username
	input.method == "GET"
	input.path = ["finance", "salary", username]
	input.user == username
}

# Allow managers to get their subordinates' salaries.
allow {
	some username
	input.method == "GET"
	input.path = ["finance", "salary", username]
	data.subordinates[input.user][_] == username
}
