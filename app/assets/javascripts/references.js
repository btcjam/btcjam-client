$(document).ready(function() {
	$.getJSON("/authenticated_calls/references", function(data) {
		var tbody = $("#references-tbody");
		if (data) {
			$(data).each(function() {
				var obj = this;
				var tr = $("<tr>");
				var avatarUrl = obj.from_user_avatar_url;
				var img;
				if (avatarUrl) {
					img = $("<img>").attr("src", avatarUrl);
				}
				var firstTD = $("<td>");
				if (img) {
					firstTD.append(img);
				}
				tr.append(firstTD);
				tr.append($("<td>").text(obj.reference_id));
				tr.append($("<td>").text(obj.reference_date));
				tr.append($("<td>").text(obj.from_user_name));
				tr.append($("<td>").text(obj.reference_description));
				tr.append($("<td>").text(obj.reference_accepted));
					tr.append($("<td>").append($("<input type=button value=Accept>").attr("disabled", obj.reference_accepted).click(function() {
						updateReference(true, obj.reference_id);
					})));

					tr.append($("<td>").append($("<input type=button value=Reject>").attr("disabled", obj.reference_accepted).click(function() {
						updateReference(false, obj.reference_id);
					})));
				tbody.append(tr);
			});

		}
	});
});

function updateReference(accept, reference_id) {
	$.ajax({
		url : "/reference_calls/" + ( accept ? "accept" : "reject") + "?reference_id=" + reference_id
	}).done(function() {
		location.reload();
	});
}

